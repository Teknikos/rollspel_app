class Components {
  final bool material;
  final bool somatic;
  final bool verbal;
  final String raw;
  final List<String>? materialsNeeded;

  Components({
    required this.material,
    required this.somatic,
    required this.verbal,
    required this.raw,
    this.materialsNeeded,
  });

  factory Components.fromJson(Map<String, dynamic> json) {
    return Components(
      material: json['material'],
      somatic: json['somatic'],
      verbal: json['verbal'],
      raw: json['raw'],
      materialsNeeded: json['materials_needed'] != null
          ? List<String>.from(json['materials_needed'])
          : null,
    );
  }
}
