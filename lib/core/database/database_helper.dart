import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// SQLite database helper for Miliket app
/// Mirrors web app localStorage schema
class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;
  static const int _version = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'miliket.db');

    return openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        fullName TEXT NOT NULL,
        createdAt INTEGER NOT NULL,
        lastLogin INTEGER,
        preferredLanguage TEXT DEFAULT 'en'
      )
    ''');

    await db.execute('''
      CREATE TABLE userProgress (
        userId INTEGER PRIMARY KEY,
        signsLearned INTEGER DEFAULT 0,
        currentStreak INTEGER DEFAULT 0,
        longestStreak INTEGER DEFAULT 0,
        totalTimeMinutes INTEGER DEFAULT 0,
        lastActiveDate TEXT,
        level INTEGER DEFAULT 1,
        xp INTEGER DEFAULT 0,
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE lessonProgress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        lessonId TEXT NOT NULL,
        categoryId TEXT NOT NULL,
        completed INTEGER DEFAULT 0,
        completedAt INTEGER,
        watchTimeSeconds INTEGER DEFAULT 0,
        lastWatchedAt INTEGER,
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE quizResults (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        quizId TEXT NOT NULL,
        categoryId TEXT NOT NULL,
        score INTEGER NOT NULL,
        totalQuestions INTEGER NOT NULL,
        completedAt INTEGER NOT NULL,
        timeSpentSeconds INTEGER DEFAULT 0,
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE achievements (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        achievementId TEXT NOT NULL,
        achievementType TEXT NOT NULL,
        unlockedAt INTEGER NOT NULL,
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE dictionaryFavorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        signId TEXT NOT NULL,
        addedAt INTEGER NOT NULL,
        UNIQUE(userId, signId),
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE practiceSessions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        signId TEXT NOT NULL,
        signName TEXT NOT NULL,
        averageAccuracy REAL DEFAULT 0,
        bestAccuracy REAL DEFAULT 0,
        attempts INTEGER DEFAULT 0,
        durationSeconds INTEGER DEFAULT 0,
        completedAt INTEGER NOT NULL,
        FOREIGN KEY (userId) REFERENCES users(id)
      )
    ''');

    // Indexes for performance
    await db.execute('CREATE INDEX idx_lesson_progress_user ON lessonProgress(userId)');
    await db.execute('CREATE INDEX idx_quiz_results_user ON quizResults(userId)');
    await db.execute('CREATE INDEX idx_achievements_user ON achievements(userId)');
    await db.execute('CREATE INDEX idx_dict_favorites_user ON dictionaryFavorites(userId)');
    await db.execute('CREATE INDEX idx_practice_sessions_user ON practiceSessions(userId)');
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
