import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../models/category.dart';
import '../../providers/lesson_provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final lessonProvider = context.watch<LessonProvider>();
    Category? category;
    try {
      category = lessonProvider.categories.firstWhere((c) => c.id == categoryId);
    } catch (_) {}
    final lessons = lessonProvider.getLessonsForCategory(categoryId);
    final locale = Localizations.localeOf(context).languageCode;

    if (category == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Category not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.getName(locale)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.play_circle_outline, color: AppColors.primary),
              ),
              title: Text(
                lesson.getTitle(locale),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: lesson.getDescription(locale).isNotEmpty
                  ? Text(lesson.getDescription(locale))
                  : null,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.push('/learn/lesson/${lesson.id}'),
            ),
          );
        },
      ),
    );
  }
}
