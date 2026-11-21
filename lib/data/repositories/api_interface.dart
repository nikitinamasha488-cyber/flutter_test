import '../../domain/models/exercise.dart';

abstract class IExerciseRepository {
  Future<List<Exercise>> getExercises({String? search});
}