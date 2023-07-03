class AbilityScore {
  final String index;
  final String name;
  final String url;

  AbilityScore(this.index, this.name, this.url);

  factory AbilityScore.fromJson(Map<String, dynamic> json) {
    return AbilityScore(
      json['index'],
      json['name'],
      json['url'],
    );
  }
}
