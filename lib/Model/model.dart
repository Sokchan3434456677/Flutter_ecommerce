import 'package:flutter/material.dart';

class AppModel {
  final String name, image, description, category, brandName;
  final double rating;
  final int reviewCount, price;
  final List<Color> fcolor;
  final List<String> size;
  final bool isCheck;

  AppModel({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.brandName,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.fcolor,
    required this.size,
    required this.isCheck,
  });
}

List<AppModel> FashionEcommercesApp = [
  AppModel(
    name: "Nike T-shirt",
    image: "assets/Tees.png",
    description: "Premium quality cotton t-shirt with Nike logo",
    category: "Tees",
    brandName: "Nike",
    rating: 4.5,
    reviewCount: 120,
    price: 29,
    isCheck: true,
    fcolor: [Colors.black, Colors.white, Colors.red],
    size: ["S", "M", "L", "XL"],
  ),
  AppModel(
    name: "Adidas Hoodie",
    image: "assets/Hoodie.png",
    description: "Warm and comfortable hoodie for all seasons",
    category: "Hoodies",
    brandName: "Adidas",
    rating: 4.7,
    reviewCount: 85,
    price: 59,
    isCheck: false,
    fcolor: [Colors.blue, Colors.black, Colors.grey],
    size: ["M", "L", "XL"],
  ),
  AppModel(
    name: "Puma Running Shoes",
    image: "assets/Shop.png",
    description: "Lightweight running shoes with extra cushioning",
    category: "Shoes",
    brandName: "Puma",
    rating: 4.8,
    reviewCount: 210,
    price: 89,
    isCheck: true,
    fcolor: [Colors.white, Colors.black, Colors.red],
    size: ["7", "8", "9", "10"],
  ),
  // Add more items as needed...
];
