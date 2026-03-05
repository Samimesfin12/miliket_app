import 'package:flutter/material.dart';
import '../core/database/database_helper.dart';
import '../providers/auth_provider.dart';

class UserProgress {
  final int signsLearned;
  final int currentStreak;
  final int longestStreak;
  final int totalTimeMinutes;
  final int level;
  final int xp;

  UserProgress({
    this.signsLearned = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.totalTimeMinutes = 0,
    this.level = 1,
    this.xp = 0,
  });

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    return UserProgress(
      signsLearned: map['signsLearned'] as int? ?? 0,
      currentStreak: map['currentStreak'] as int? ?? 0,
      longestStreak: map['longestStreak'] as int? ?? 0,
      totalTimeMinutes: map['totalTimeMinutes'] as int? ?? 0,
      level: map['level'] as int? ?? 1,
      xp: map['xp'] as int? ?? 0,
    );
  }
}

class ProgressProvider extends ChangeNotifier {
  UserProgress? _progress;

  UserProgress? get progress => _progress;

  Future<void> loadProgress(int userId) async {
    final db = await DatabaseHelper.instance.database;
    final results = await db.query(
      'userProgress',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    if (results.isNotEmpty) {
      _progress = UserProgress.fromMap(results.first);
      notifyListeners();
    }
  }

  Future<void> addXp(int userId, int amount) async {
    final db = await DatabaseHelper.instance.database;
    final current = _progress ?? UserProgress();
    final newXp = current.xp + amount;
    int newLevel = current.level;
    int remainingXp = newXp;

    while (remainingXp >= newLevel * 200) {
      remainingXp -= newLevel * 200;
      newLevel++;
    }

    await db.update(
      'userProgress',
      {'xp': newXp, 'level': newLevel},
      where: 'userId = ?',
      whereArgs: [userId],
    );

    _progress = UserProgress(
      signsLearned: current.signsLearned,
      currentStreak: current.currentStreak,
      longestStreak: current.longestStreak,
      totalTimeMinutes: current.totalTimeMinutes,
      level: newLevel,
      xp: newXp,
    );
    notifyListeners();
  }

  Future<void> updateStreak(int userId, int streak) async {
    final db = await DatabaseHelper.instance.database;
    final current = _progress ?? UserProgress();
    final longest = streak > current.longestStreak ? streak : current.longestStreak;

    await db.update(
      'userProgress',
      {
        'currentStreak': streak,
        'longestStreak': longest,
        'lastActiveDate': DateTime.now().toIso8601String().split('T')[0],
      },
      where: 'userId = ?',
      whereArgs: [userId],
    );

    _progress = UserProgress(
      signsLearned: current.signsLearned,
      currentStreak: streak,
      longestStreak: longest,
      totalTimeMinutes: current.totalTimeMinutes,
      level: current.level,
      xp: current.xp,
    );
    notifyListeners();
  }
}
