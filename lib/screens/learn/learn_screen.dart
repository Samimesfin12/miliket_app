import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/localization/app_localizations.dart';
import '../../providers/lesson_provider.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categories = context.watch<LessonProvider>().categories;
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.translate('learn')),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final lessonCount = context
              .read<LessonProvider>()
              .getLessonsForCategory(cat.id)
              .length;
          final colors = [
            AppColors.green,
            AppColors.yellow,
            AppColors.red,
            AppColors.green,
            AppColors.yellow,
            AppColors.red,
          ];
          final color = colors[index % colors.length];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.school, color: color),
              ),
              title: Text(
                cat.getName(locale),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('$lessonCount lessons'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => context.push('/learn/category/${cat.id}'),
            ),
          );
        },
      ),
    );
  }
}
