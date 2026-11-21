import '../../domain/models/exercise.dart';
import '../dtos/exercise_dto.dart';


const _imagePlaceholder = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPh2vIzz3qCBgyq8bqDnLen2B84SD1vz0xwBXznP4aNA&s=10';

extension ExerciseMapper on ExerciseDto {
  Exercise toDomain() => Exercise(
    id: id,
    name: name,
    target: target,
    technique: technique,
    difficulty: difficulty,
    category: category?.name ?? 'Без категории',

    imageUrl: (imageUrl == 'string' || imageUrl == null || imageUrl!.isEmpty)
        ? _imagePlaceholder
        : imageUrl!,
  );
}