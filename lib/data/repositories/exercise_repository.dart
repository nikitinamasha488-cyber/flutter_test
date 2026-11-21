import 'package:dio/dio.dart';
import '../../domain/models/exercise.dart';
import '../dtos/exercise_dto.dart';
import '../mappers/exercise_mapper.dart';
import 'api_interface.dart';


class ExerciseRepository implements IExerciseRepository {
  static const String _baseUrl = 'http://10.0.2.2:8080/api/1.0';

  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  @override
  Future<List<Exercise>> getExercises({String? search}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        '/exercises',
        queryParameters: (search == null || search.isEmpty) ? null : {'search': search},
      );

      final data = response.data ?? const <dynamic>[];

      return data
          .map((json) => ExerciseDto.fromJson(json as Map<String, dynamic>).toDomain())
          .toList();
    } catch (e) {
      throw Exception('Ошибка загрузки');
    }
  }
}