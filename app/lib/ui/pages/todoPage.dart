import 'package:non/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:non/ui/pages/todo/todoTab.dart';
import 'package:intl/intl.dart';
import 'package:non/ui/widgets/addTodoInputWidget.dart';
import 'package:line_icons/line_icons.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final today = DateFormat('EEEE d', LocaleSettings.currentLocale.languageTag)
        .format(DateTime.now());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.push('/setting');
                },
                icon: const Icon(LineIcons.cog))
          ],
          title: Text(today),
          bottom: TabBar(tabs: [
            Tab(text: t.today),
            Tab(text: t.tomorrow),
          ]),
        ),
        body: const TabBarView(
          children: [
            TodoTab(todoFor: "today"),
            TodoTab(todoFor: "tomorrow"),
          ],
        ),
        floatingActionButton: const AddTodoInput(),
      ),
    );
  }
}
