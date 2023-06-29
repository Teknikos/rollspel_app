import 'package:rollspel_app/models/components.dart';

class Spell {
  final String castingTime;
  final List<String> classes;
  final Components components;
  final String description;
  final String duration;
  final String? higherLevels;
  final String level;
  final String name;
  final String range;
  final bool ritual;
  final String school;
  final List<String> tags;
  final String type;

  Spell({
    required this.name,
    required this.tags,
    required this.type,
    required this.ritual,
    required this.level,
    required this.school,
    required this.castingTime,
    required this.range,
    required this.components,
    required this.duration,
    required this.description,
    this.higherLevels,
    required this.classes,
  });

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      name: json['name'],
      tags: List<String>.from(json['tags']),
      type: json['type'],
      ritual: json['ritual'],
      level: json['level'],
      school: json['school'],
      castingTime: json['casting_time'],
      range: json['range'],
      components: Components.fromJson(json['components']),
      duration: json['duration'],
      description: json['description'],
      higherLevels: json['higher_levels'],
      classes: List<String>.from(json['classes'] ?? []),
    );
  }
}
