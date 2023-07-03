import 'package:flutter/material.dart';
import '../models/spell.dart';

class SpellDetailed extends StatelessWidget {
  const SpellDetailed({super.key, required this.cantrip});

  final Spell cantrip;

  // This helper function will create a string based on the component values.
  String getComponentsString(Spell cantrip) {
    List<String> componentStrings = [];
    if (cantrip.components.somatic) {
      componentStrings.add('S');
    }
    if (cantrip.components.verbal) {
      componentStrings.add('V');
    }
    if (cantrip.components.material) {
      componentStrings.add('M');
    }
    if (componentStrings.isEmpty) {
      return 'No components';
    } else {
      return componentStrings.join(', ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${cantrip.castingTime} '
                          '${cantrip.duration} '
                          '${cantrip.range}',
                        ),
                        if (cantrip.ritual) ...[
                          const Spacer(),
                          const Text('Ritual'),
                        ],
                      ],
                    ),
                    const Divider(),
                    Text(cantrip.description),
                    if (cantrip.higherLevels != null) ...[
                      const Divider(),
                      Text(cantrip.higherLevels!),
                    ],
                  ],
                ),
              ),
              // Classes and components
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getComponentsString(cantrip),
                      ),
                      Text(cantrip.classes != []
                          ? cantrip.classes.join('\n')
                          : 'No classes'),
                      // conditionally render the classes as images
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
