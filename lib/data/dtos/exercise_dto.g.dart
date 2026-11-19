// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) => ExerciseDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  target: json['target'] as String,
  technique: json['technique'] as String,
  difficulty: json['difficulty'] as String,
  imageUrl: json['imageUrl'] as String?,
  category: json['category'] == null
      ? null
      : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
);

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
);
