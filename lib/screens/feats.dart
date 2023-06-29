import 'package:flutter/material.dart';

class Feats extends StatelessWidget {
  const Feats({super.key});

  @override
  Widget build(BuildContext context) {
    var feats = [
      'Feat 1',
      'Feat 2',
      'Feat 3',
      'Feat 4',
    ];

    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(feats.length, (index) {
        return Center(
          child: Card(
            child: Text(
              feats[index],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        );
      }),
    );
  }
}
