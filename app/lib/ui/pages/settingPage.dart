import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const Divider(),
          TextButton.icon(
            label: const Text("Theme"),
            onPressed: () {
              context.push('/theme');
            },
            icon: const Icon(LineIcons.palette),
          ),
          const Divider(),
          TextButton.icon(
            label: const Text("Language"),
            onPressed: () {
              context.push('/language');
            },
            icon: const Icon(LineIcons.language),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Text(
              "About",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          TextButton.icon(
            label: const Text("Rate Us"),
            onPressed: () {},
            icon: const Icon(LineIcons.heart),
          ),
          const Divider(),
          TextButton.icon(
            label: const Text("Report Issue"),
            onPressed: () {},
            icon: const Icon(LineIcons.bug),
          ),
          const Divider(),
          TextButton.icon(
            label: const Text("Privacy Policy"),
            onPressed: () {},
            icon: const Icon(LineIcons.lock),
          ),
        ],
      ),
    );
  }
}
