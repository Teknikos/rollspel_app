import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rollspel_app/models/components.dart';
import '../models/spell.dart';
import '../widgets/spell_detailed.dart';
import '../widgets/spell_list.dart';

class Spells extends StatefulWidget {
  const Spells({super.key, required this.title});

  final String title;

  @override
  State<Spells> createState() => _SpellsState();
}

class _SpellsState extends State<Spells> {
  bool isLoading = true;
  List<Spell> _spellList = [];
  Spell? _selectedSpell;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('assets/spells.json');
      // final List<dynamic> data = await json.decode(response);
      final data = await json.decode(response) as List<dynamic>;

      setState(() {
        _spellList = data.map((spell) => Spell.fromJson(spell)).toList();
        isLoading = false;
        _selectedSpell = _spellList[0];
      });
    } on Exception catch (_) {
      isLoading = false;
    }
  }

  void _handleSpellSelected(Spell spell) {
    setState(() {
      _selectedSpell = spell;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: false,
        // if i have a selected spell, show its name, otherwise show the title
        title: Row(
          children: [
            Text(
              _selectedSpell != null ? _selectedSpell!.name : widget.title,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              _selectedSpell != null ? _selectedSpell!.level : '',
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SpellDetailed(
              cantrip: _selectedSpell != null
                  ? _selectedSpell!
                  : Spell(
                      name: 'No spell selected',
                      tags: [],
                      type: '',
                      ritual: false,
                      level: '',
                      school: '',
                      castingTime: '',
                      range: '',
                      components: Components(
                          verbal: false,
                          somatic: false,
                          material: false,
                          raw: '',
                          materialsNeeded: []),
                      duration: '',
                      description: '',
                      classes: []),
            ),
          ),
          isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: SizedBox(
                    child: SpellList(
                      spells: _spellList,
                      selectedSpell: _selectedSpell,
                      onSpellSelected: _handleSpellSelected,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
