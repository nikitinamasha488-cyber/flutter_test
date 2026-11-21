import 'package:flutter/material.dart';

class Exercise {
  final int id;
  final String name;
  final String target;
  final String technique;
  final String difficulty;
  final String category;
  final String imageUrl;

  const Exercise({
    required this.id,
    required this.name,
    required this.target,
    required this.technique,
    required this.difficulty,
    required this.category,
    required this.imageUrl,
  });
}
