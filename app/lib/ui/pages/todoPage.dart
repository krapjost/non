import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:non/controllers/todo.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:non/ui/pages/todo/todoTab.dart';
import 'package:intl/intl.dart';
import 'package:non/ui/widgets/addTodoInputWidget.dart';
import 'package:line_icons/line_icons.dart';

const keys = ["today", "tomorrow", "later"];
final views = [
  TodoTab(todoFor: keys[0]),
  TodoTab(todoFor: keys[1]),
  TodoTab(todoFor: keys[2]),
];

class TodoPage extends HookConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final texts = [t.today, t.tomorrow, t.later];
    /* final today = DateFormat('EEEE d', LocaleSettings.currentLocale.languageTag) */
    /*     .format(DateTime.now()); */
    final page = useState(0);

    final int todoLen = ref
        .watch(todoControllerProvider)
        .getUncompletedFor(keys[page.value])
        .length;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.push('/setting');
              },
              icon: const Icon(LineIcons.cog))
        ],
        title: Text("${texts[page.value]} : $todoLen todos"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 0,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w800),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        onTap: (index) => page.value = index,
        currentIndex: page.value,
        items: [
          BottomNavigationBarItem(
            label: texts[0],
            icon: const Icon(LineIcons.mapAlt),
          ),
          BottomNavigationBarItem(
            label: texts[1],
            icon: const Icon(LineIcons.copyAlt),
          ),
          BottomNavigationBarItem(
            label: texts[2],
            icon: const Icon(LineIcons.copyAlt),
          ),
        ],
      ),
      body: views[page.value],
      /* floatingActionButton: AddTodoInput(addTodoFor: keys[page.value]), */
      /* floatingActionButtonLocation: */
      /*     FloatingActionButtonLocation.miniCenterFloat, */
    );
  }
}




/**/
/* class TodoPage extends ConsumerWidget { */
/*   const TodoPage({Key? key}) : super(key: key); */
/**/
/*   @override */
/*   Widget build(BuildContext context, WidgetRef ref) { */
/*     final t = Translations.of(context); */
/*     final today = DateFormat('EEEE d', LocaleSettings.currentLocale.languageTag) */
/*         .format(DateTime.now()); */
/**/
/*     return DefaultTabController( */
/*       length: views.length, */
/*       child: Scaffold( */
/*         appBar: AppBar( */
/*           actions: [ */
/*             IconButton( */
/*                 onPressed: () { */
/*                   context.push('/setting'); */
/*                 }, */
/*                 icon: const Icon(LineIcons.cog)) */
/*           ], */
/*           title: Text(today), */
/*           bottom: TabBar(tabs: [ */
/*             Tab(text: t.today), */
/*             Tab(text: t.tomorrow), */
/*             Tab(text: t.later), */
/*           ]), */
/*         ), */
/*         body: const TabBarView(children: views), */
/*         floatingActionButton: const AddTodoInput(), */
/*       ), */
/*     ); */
/*   } */
/* } */
/**/
/**/
/**/
/**/
