import 'dart:async';

enum Difficulty {
  beginner('Начинающий'),
  intermediate('Средний'),
  advanced('Продвинутый');

  final String title;
  const Difficulty(this.title);
}

class Exercise {
  final int id;
  final String name;
  final String target;
  final String technique;
  final Difficulty difficulty;

  Exercise({
    required this.id,
    required this.name,
    required this.target,
    required this.technique,
    required this.difficulty,
  });

  String shortInfo() => '$name (${difficulty.title})  цель: $target';

  @override
  String toString() =>
      'Exercise(id: $id, name: $name, target: $target, '
          'technique: $technique, difficulty: ${difficulty.title})';
}

extension ExerciseListExtension on List<Exercise> {
  List<Exercise> byDifficulty(Difficulty difficulty) {
    return where((e) => e.difficulty == difficulty).toList();
  }

  int totalCount() => length;

  void printAll() {
    for (var i = 0; i < length; i++) {
      print(' ${this[i].shortInfo()}');
    }
  }
}

Future<void> main() async {
  final List<Exercise> exercises = [
    Exercise(
      id: 1,
      name: 'Планка',
      target: 'Пресс и спина',
      technique: 'Держать ровно, не прогибаться',
      difficulty: Difficulty.advanced,
    ),
    Exercise(
      id: 2,
      name: 'Бёрпи',
      target: 'Кардио',
      technique: 'Прыжок, упор лежа, прыжок вверх',
      difficulty: Difficulty.intermediate,
    ),
    Exercise(
      id: 3,
      name: 'Приседания',
      target: 'Ноги и ягодицы',
      technique: 'Спина прямая, колени не выходят за носки',
      difficulty: Difficulty.beginner,
    ),
    Exercise(
      id: 4,
      name: 'Отжимания',
      target: 'Грудь и руки',
      technique: 'Корпус прямой, локти в стороны',
      difficulty: Difficulty.intermediate,
    ),
  ];

  await Future.delayed(const Duration(seconds: 1));

  print('Все упражнения (${exercises.totalCount()})');
  exercises.printAll();

  final easy = exercises.where((e) => e.difficulty == Difficulty.beginner).toList();
  print('\nУпражнения для начинающих ');
  easy.printAll();

  final intermediate = exercises.byDifficulty(Difficulty.intermediate);
  print('Упражнения среднего уровня');
  intermediate.printAll();


  print('\nСтатистика');
  var beginners = 0, middles = 0, advanced = 0;
  for (final ex in exercises) {
    switch (ex.difficulty) {
      case Difficulty.beginner:
        beginners++;
        break;
      case Difficulty.intermediate:
        middles++;
        break;
      case Difficulty.advanced:
        advanced++;
        break;
    }
  }
  print('Начинающих:   $beginners');
  print('Средних:      $middles');
  print('Продвинутых:  $advanced');
  print('Всего:        ${exercises.totalCount()}');
}