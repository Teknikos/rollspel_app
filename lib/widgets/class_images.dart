import 'package:flutter/material.dart';

class ClassImages extends StatelessWidget {
  final List<String> classes;

  const ClassImages({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return classes.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: classes.length,
            itemBuilder: (context, index) {
              return Image.asset(
                  'assets/images/classes/${classes[index].toLowerCase()}.jpeg');
            },
          )
        : const Text('No classes');
  }
}
