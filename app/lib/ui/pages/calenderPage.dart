import 'package:gaji/i18n/strings.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class CalenderPage extends HookConsumerWidget {
  final String project;

  const CalenderPage({Key? key, this.project = ''}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(tabs: [
            Tab(
              text: t.week,
            ),
            Tab(
              text: t.month,
            ),
            Tab(
              text: t.year,
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            Text("Week"),
            Text("month"),
            Text("year"),
          ],
        ),
      ),
    );
  }
}
