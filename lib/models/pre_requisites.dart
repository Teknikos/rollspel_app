import 'ability_score.dart';

class PreRequisites {
  final AbilityScore abilityScore;
  final int minimumScore;

  PreRequisites(this.abilityScore, this.minimumScore);

  factory PreRequisites.fromJson(Map<String, dynamic> json) {
    return PreRequisites(
      AbilityScore.fromJson(json['ability_score']),
      json['minimum_score'],
    );
  }
}
