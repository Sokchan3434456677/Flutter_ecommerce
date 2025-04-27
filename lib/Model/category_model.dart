class Facategory {
  final String name, image;
  Facategory({required this.name, required this.image});
}

// Main categories (Women, Men, Teens, Kids, Baby)
List<Facategory> mainCategories = [
  Facategory(name: "Women", image: "assets/Women.png"),
  Facategory(name: "Men", image: "assets/Men.png"),
  Facategory(name: "Teens", image: "assets/Teens.png"),
  Facategory(name: "Kids", image: "assets/Kids.png"),
  Facategory(name: "Baby", image: "assets/Baby.png"),
];

// Original product categories
List<Facategory> productCategories = [
  Facategory(name: "Tees", image: "assets/Tees.png"),
  Facategory(name: "Girl", image: "assets/Gril.png"),
  Facategory(name: "Hoodie", image: "assets/Hoodie.png"),
  Facategory(name: "Pants", image: "assets/Pants.png"),
  Facategory(name: "Shop", image: "assets/Shop.png"),
];
