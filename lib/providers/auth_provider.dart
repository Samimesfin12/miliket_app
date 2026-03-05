import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../core/database/database_helper.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isLoading => _isLoading;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await DatabaseHelper.instance.database;
      final results = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      if (results.isNotEmpty) {
        _user = User.fromMap(results.first);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('currentUserId', _user!.id);
        await _updateLastLogin(_user!.id);
      } else {
        throw Exception('Invalid email or password');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String email, String password, String fullName) async {
    _isLoading = true;
    notifyListeners();

    try {
      final db = await DatabaseHelper.instance.database;
      final now = DateTime.now().millisecondsSinceEpoch;

      final id = await db.insert('users', {
        'email': email,
        'password': password,
        'fullName': fullName,
        'createdAt': now,
        'lastLogin': now,
        'preferredLanguage': 'en',
      });

      _user = User(
        id: id.toInt(),
        email: email,
        fullName: fullName,
        preferredLanguage: 'en',
        createdAt: DateTime.fromMillisecondsSinceEpoch(now),
        lastLogin: DateTime.fromMillisecondsSinceEpoch(now),
      );

      await db.insert('userProgress', {
        'userId': id,
        'signsLearned': 0,
        'currentStreak': 0,
        'longestStreak': 0,
        'totalTimeMinutes': 0,
        'lastActiveDate': DateTime.now().toIso8601String().split('T')[0],
        'level': 1,
        'xp': 0,
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('currentUserId', _user!.id);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUserId');
    _user = null;
    notifyListeners();
    if (context.mounted) context.go('/sign-in');
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('currentUserId');
    if (userId == null) return;

    try {
      final db = await DatabaseHelper.instance.database;
      final results = await db.query('users', where: 'id = ?', whereArgs: [userId]);
      if (results.isNotEmpty) {
        _user = User.fromMap(results.first);
        notifyListeners();
      }
    } catch (_) {}
  }

  Future<void> _updateLastLogin(int userId) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'users',
      {'lastLogin': DateTime.now().millisecondsSinceEpoch},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  Future<void> updateLanguage(String language) async {
    if (_user == null) return;

    final db = await DatabaseHelper.instance.database;
    await db.update(
      'users',
      {'preferredLanguage': language},
      where: 'id = ?',
      whereArgs: [_user!.id],
    );

    _user = User(
      id: _user!.id,
      email: _user!.email,
      fullName: _user!.fullName,
      preferredLanguage: language,
      createdAt: _user!.createdAt,
      lastLogin: _user!.lastLogin,
    );
    notifyListeners();
  }
}
