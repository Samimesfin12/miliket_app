/// App-wide constants for Miliket
class AppConstants {
  AppConstants._();

  // Min touch target size (44x44 points for accessibility)
  static const double minTouchTarget = 44.0;

  // XP & Leveling
  static const int xpPerLesson = 50;
  static const int xpPerQuiz = 25;
  static const int xpPerSignLearned = 10;
  static const int xpPerStreakDay = 5;
  static const int xpPerLevel = 200;

  // Streak
  static const int maxStreakGraceHours = 24;

  // Categories
  static const List<String> categoryIds = [
    'greetings',
    'family',
    'food',
    'numbers',
    'colors',
    'everyday',
  ];
}
