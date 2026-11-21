import '../../domain/models/exercise.dart';
import 'api_interface.dart';

class MockExerciseRepository implements IExerciseRepository {
  @override
  Future<List<Exercise>> getExercises({String? search}) async {
    await Future.delayed(const Duration(seconds: 1));

    final list = [
      const Exercise(
        id: 1,
        name: 'Приседания (Мок)',
        target: 'Ноги',
        technique: 'Спина прямая',
        difficulty: 'Начинающий',
        category: 'Силовые',
        imageUrl: '',
      ),
      const Exercise(
        id: 2,
        name: 'Отжимания (Мок)',
        target: 'Грудь',
        technique: 'Корпус ровно',
        difficulty: 'Средний',
        category: 'Силовые',
        imageUrl: '',
      ),
    ];

    if (search == null || search.isEmpty) {
      return list;
    }
    return list.where((e) => e.name.toLowerCase().contains(search.toLowerCase())).toList();
  }
}