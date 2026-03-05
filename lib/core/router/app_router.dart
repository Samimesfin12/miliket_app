import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../screens/auth/sign_in_screen.dart';
import '../../screens/auth/sign_up_screen.dart';
import '../../screens/auth/forgot_password_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/main_navigation_shell.dart';
import '../../screens/learn/learn_screen.dart';
import '../../screens/learn/category_detail_screen.dart';
import '../../screens/learn/lesson_detail_screen.dart';
import '../../screens/dictionary/dictionary_screen.dart';
import '../../screens/practice/practice_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/settings/settings_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter createRouter(AuthProvider authProvider) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/sign-in',
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggedIn = authProvider.isLoggedIn;
      final isAuthRoute = state.matchedLocation.startsWith('/sign-in') ||
          state.matchedLocation.startsWith('/sign-up') ||
          state.matchedLocation.startsWith('/forgot-password');

      if (!isLoggedIn && !isAuthRoute) return '/sign-in';
      if (isLoggedIn && isAuthRoute) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainNavigationShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/learn',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LearnScreen(),
            ),
            routes: [
              GoRoute(
                path: 'category/:categoryId',
                builder: (context, state) => CategoryDetailScreen(
                  categoryId: state.pathParameters['categoryId']!,
                ),
              ),
              GoRoute(
                path: 'lesson/:lessonId',
                builder: (context, state) => LessonDetailScreen(
                  lessonId: state.pathParameters['lessonId']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/dictionary',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DictionaryScreen(),
            ),
          ),
          GoRoute(
            path: '/practice',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PracticeScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
