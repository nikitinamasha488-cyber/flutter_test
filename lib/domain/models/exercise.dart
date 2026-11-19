import 'package:flutter/material.dart';

/// Доменная модель: то, с чем работает приложение.
/// Формат ответа сервера её не касается — за это отвечает ExerciseDto и маппер.
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
