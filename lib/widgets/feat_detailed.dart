import 'package:flutter/material.dart';
import '../models/feat.dart';

class FeatDetailed extends StatelessWidget {
  final Feat feat;

  const FeatDetailed({Key? key, required this.feat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                    style: Theme.of(context).textTheme.labelLarge,
                    'Prerequisite: '),
                Text(feat.preRequisites
                    .map((preReq) =>
                        '${preReq.abilityScore.name}: ${preReq.minimumScore}')
                    .join('\n')),
                const Text(' or higher')
              ],
            ),
            const Divider(),
            Text(
              feat.desc.join('\n\n'),
            ),
          ],
        ),
      ),
    );
  }
}
