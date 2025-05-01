import 'package:flutter/material.dart';

class AppModel {
  final int id; // Added id field
  final String name, image, description, category, brandName;
  final double rating, price; // Changed price to double for consistency
  final int reviewCount;
  final List<Color> fcolor;
  final List<String> size;
  final bool isCheck;

  AppModel({
    required this.id, // Updated constructor to include id
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
