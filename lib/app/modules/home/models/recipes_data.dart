class Recipes {
  int id;
  String recipeName;
  String ingredients;
  String instructions;
  String category;
  bool favorite;

  Recipes(
      {required this.id,
      required this.recipeName,
      required this.ingredients,
      required this.instructions,
      required this.category,
      required this.favorite});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      id: json['id'],
      recipeName: json['recipeName'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      category: json['category'],
      favorite: json['favorite'],
    );
  }
}
