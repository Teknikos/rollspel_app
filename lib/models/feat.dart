import 'package:rollspel_app/models/pre_requisites.dart';

class Feat {
  final String index;
  final String name;
  final String url;
  final List<String> desc;
  final List<PreRequisites> preRequisites;

  Feat(this.index, this.name, this.url, this.desc, this.preRequisites);

  factory Feat.fromJson(Map<String, dynamic> json) {
    return Feat(
      json['index'],
      json['name'],
      json['url'],
      List<String>.from(json['desc']),
      List<PreRequisites>.from(
          json['prerequisites'].map((x) => PreRequisites.fromJson(x))),
    );
  }
}
