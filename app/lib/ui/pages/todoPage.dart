import 'package:gaji/controllers/language.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gaji/ui/pages/todo/todoTab.dart';
import 'package:intl/intl.dart';
import 'package:gaji/ui/widgets/addTodoInputWidget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateFormat('EEEE d').format(DateTime.now());
    final Map<String, dynamic> lang =
        ref.watch(languageDataProvider.state).state;
    print(lang);

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
          title: Text(lang['todo']['title']),
          bottom: TabBar(tabs: [
            Tab(text: AppLocalizations.of(context)!.today),
            Tab(text: "Tomorrow"),
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
