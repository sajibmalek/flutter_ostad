class Recipe {
  final String img;
  final String title;
  final String description;
  final List<String> ingredients;

  Recipe({
    required this.img,
    required this.title,
    required this.description,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        img:json['img'],
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}