import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rollspel_app/models/feat.dart';
import 'package:rollspel_app/widgets/feat_detailed.dart';

Future<Feat> fetchFeats(String index) async {
  final response =
      await http.get(Uri.parse('https://www.dnd5eapi.co/api/feats/$index'));

  if (response.statusCode == 200) {
    return Feat.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load feat');
  }
}

class Feats extends StatefulWidget {
  const Feats({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  FeatsState createState() => FeatsState();
}

class FeatsState extends State<Feats> {
  late Future<Feat> futureFeat;

  @override
  void initState() {
    super.initState();
    futureFeat = fetchFeats('grappler');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Feat>(
        future: futureFeat,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Error'),
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    centerTitle: false,
                  ),
                  body: Center(child: Text('Error: ${snapshot.error}')));
            }

            return Scaffold(
                appBar: AppBar(
                  title: Text(snapshot.data!.name),
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  centerTitle: false,
                ),
                body: FeatDetailed(feat: snapshot.data!));
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
