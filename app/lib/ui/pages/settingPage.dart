import 'package:flutter/material.dart';
import 'package:gaji/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              t.settings,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const Divider(),
          TextButton.icon(
            label: Text(t.theme),
            onPressed: () {
              context.push('/theme');
            },
            icon: const Icon(LineIcons.palette),
          ),
          const Divider(),
          TextButton.icon(
            label: Text(t.language),
            onPressed: () {
              context.push('/language');
            },
            icon: const Icon(LineIcons.language),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              t.about,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          TextButton.icon(
            label: Text(t.rateUs),
            onPressed: () {},
            icon: const Icon(LineIcons.heart),
          ),
          const Divider(),
          TextButton.icon(
            label: Text(t.reportIssue),
            onPressed: () {},
            icon: const Icon(LineIcons.bug),
          ),
          const Divider(),
          TextButton.icon(
            label: Text(t.privacyPolicy),
            onPressed: () {},
            icon: const Icon(LineIcons.lock),
          ),
        ],
      ),
    );
  }
}
