import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../providers/lesson_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/progress_provider.dart';
import '../../core/constants/app_constants.dart';

class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    final lesson = context.read<LessonProvider>().getLesson(widget.lessonId);
    final locale = Localizations.localeOf(context).languageCode;

    if (lesson == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Lesson not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.getTitle(locale)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (lesson.videoUrl != null) ...[
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_circle_outline, size: 64, color: Colors.grey[600]),
                      const SizedBox(height: 8),
                      Text(
                        'Video: ${lesson.videoUrl}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
            Text(
              lesson.getTitle(locale),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (lesson.getDescription(locale).isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                lesson.getDescription(locale),
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _completed
                  ? null
                  : () async {
                      setState(() => _completed = true);
                      final auth = context.read<AuthProvider>();
                      if (auth.user != null) {
                        await context
                            .read<ProgressProvider>()
                            .addXp(auth.user!.id, AppConstants.xpPerLesson);
                      }
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Lesson completed! +50 XP'),
                          ),
                        );
                      }
                    },
              icon: Icon(_completed ? Icons.check_circle : Icons.check),
              label: Text(_completed ? 'Completed' : 'Mark as Complete'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
