import 'package:json_annotation/json_annotation.dart';

part 'exercise_dto.g.dart';

@JsonSerializable(createToJson: false)
class ExerciseDto {
  final int id;
  final String name;
  final String target;
  final String technique;
  final String difficulty;
  final String? imageUrl;

  @JsonKey(name: 'category')
  final CategoryDto? category;

  ExerciseDto({
    required this.id,
    required this.name,
    required this.target,
    required this.technique,
    required this.difficulty,
    this.imageUrl,
    this.category,
  });

  factory ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CategoryDto {
  final int id;
  final String name;

  CategoryDto({required this.id, required this.name});

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
