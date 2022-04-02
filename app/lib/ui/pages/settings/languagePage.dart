import 'package:flutter/material.dart';
import 'package:gaji/controllers/language.dart' as l;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<String> languages = [
  "korean",
  "chinese",
  "english",
  "russian",
  "japanese",
  "spanish",
  "french",
  "dutch"
];

class LanguagePage extends ConsumerWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    saveLanguage(String lang) {
      ref.watch(l.languageController.notifier).save(lang);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Languages")),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      saveLanguage(languages[index]);
                    },
                    child: Text(languages[index])),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
