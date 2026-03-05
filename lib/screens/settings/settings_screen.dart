import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/localization/app_localizations.dart';
import '../../providers/locale_provider.dart';
import '../../providers/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = context.watch<LocaleProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.translate('settings')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.translate('language')),
            subtitle: Text(
              localeProvider.locale.languageCode == 'en'
                  ? l10n.translate('english')
                  : l10n.translate('amharic'),
            ),
            trailing: Switch(
              value: localeProvider.locale.languageCode == 'am',
              onChanged: (_) async {
                localeProvider.toggleLocale();
                final auth = context.read<AuthProvider>();
                if (auth.user != null) {
                  await auth.updateLanguage(
                    localeProvider.locale.languageCode,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
