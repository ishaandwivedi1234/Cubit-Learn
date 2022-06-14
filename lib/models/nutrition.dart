class Nutrition {
  final String name;
  var calories;
  var totalFat;
  var cholesterol;
  var protein;
  var vitaminA;

  Nutrition(
      {required this.name,
      required this.calories,
      required this.totalFat,
      required this.cholesterol,
      required this.protein,
      required this.vitaminA});

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      name: json['item_name'],
      calories: json['nf_calories'],
      totalFat: json['nf_total_fat'],
      cholesterol: json['nf_cholesterol'],
      protein: json['nf_protein'],
      vitaminA: json['nf_vitamin_a_dv'],
    );
  }
}
