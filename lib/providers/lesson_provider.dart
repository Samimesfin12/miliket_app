import 'package:flutter/material.dart';
import '../data/lessons_data.dart';
import '../models/lesson.dart';
import '../models/category.dart';

class LessonProvider extends ChangeNotifier {
  List<Category> _categories = LessonsData.categories;
  Map<String, List<Lesson>> _lessonsByCategory = {};

  List<Category> get categories => _categories;

  List<Lesson> getLessonsForCategory(String categoryId) {
    if (_lessonsByCategory.containsKey(categoryId)) {
      return _lessonsByCategory[categoryId]!;
    }
    final lessons = LessonsData.lessons
        .where((l) => l.categoryId == categoryId)
        .toList();
    _lessonsByCategory[categoryId] = lessons;
    return lessons;
  }

  Lesson? getLesson(String lessonId) {
    try {
      return LessonsData.lessons.firstWhere((l) => l.id == lessonId);
    } catch (_) {
      return null;
    }
  }
}
