import 'package:flutter/material.dart';
import '../models/spell.dart';

class SpellList extends StatefulWidget {
  final Spell? selectedSpell;
  final List<Spell> spells;
  final ValueChanged<Spell> onSpellSelected;
  const SpellList(
      {super.key,
      required this.spells,
      required this.onSpellSelected,
      required this.selectedSpell});

  @override
  State<SpellList> createState() => _SpellListState();
}

class _SpellListState extends State<SpellList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: widget.spells.isNotEmpty
          ? GridView.count(
              crossAxisCount: 4,
              children: List.generate(widget.spells.length, (index) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      widget.onSpellSelected(widget.spells[index]);
                    },
                    child: Card(
                      color: widget.selectedSpell != null &&
                              widget.spells[index] == widget.selectedSpell
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          '${widget.spells[index].name}\n'
                          '\n${widget.spells[index].level}',
                          style: widget.selectedSpell != null &&
                                  widget.spells[index] == widget.selectedSpell
                              ? Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Colors.white)
                              : Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            )

          // ListView.separated(
          //     separatorBuilder: (context, index) => const Divider(),
          //     itemCount: widget.spells.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //           title: Text(widget.spells[index].name),
          //           subtitle: Text('Level: ${widget.spells[index].level}'),
          //           selected: widget.selectedSpell != null &&
          //               widget.spells[index] == widget.selectedSpell,
          //           onTap: () {
          //             widget.onSpellSelected(widget.spells[index]);
          //           });
          //     })

          : Container(),
    );
  }
}
