import 'package:flutter/material.dart';
import 'package:gaji/controllers/locale.dart';
import 'package:gaji/i18n/strings.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<String> locales = [
  "ko",
  "en",
  "es",
];

class LanguagePage extends ConsumerWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.language)),
      body: ListView.builder(
        itemCount: locales.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      ref.read(localeController.notifier).save(locales[index]);
                    },
                    child: Text(locales[index])),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
