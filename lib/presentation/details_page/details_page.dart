import 'package:flutter/material.dart';
import '../../domain/models/exercise.dart';

class DetailsPage extends StatelessWidget {
  final Exercise exercise;

  const DetailsPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Большая картинка
          Center(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  exercise.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(exercise.name, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          _InfoRow(label: 'Цель', value: exercise.target),
          _InfoRow(label: 'Сложность', value: exercise.difficulty),
          _InfoRow(label: 'Категория', value: exercise.category),
          const SizedBox(height: 16),
          Text(
            'Техника выполнения',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(exercise.technique, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text('$label: $value'),
    );
  }
}