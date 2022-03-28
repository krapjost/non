import 'package:flutter/material.dart';
import 'package:gaji/provider/color.dart';
import 'package:gaji/ui/pages/historyPage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:gaji/ui/pages/todoPage.dart';
import 'package:gaji/ui/pages/calenderPage.dart';
import 'package:gaji/provider/state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int page = ref.watch(pageProvider.state).state;
    final bool hasFocus = ref.watch(focustStateControllerProvider.state).state;
    final Color bnw = ref.watch(bnwColorProvider.state).state;

    final pages = [
      const TodoPage(),
      const CalenderPage(),
      const HistoryPage(),
    ];

    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: hasFocus ? 0 : 55,
        child: hasFocus
            ? SizedBox(width: MediaQuery.of(context).size.width)
            : BottomNavigationBar(
                selectedItemColor: bnw,
                currentIndex: page,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: (index) {
                  ref.read(pageProvider.state).state = index % pages.length;
                },
                items: const [
                  BottomNavigationBarItem(
                      tooltip: "todo",
                      label: "todo",
                      icon: Icon(LineIcons.tasks)),
                  BottomNavigationBarItem(
                      tooltip: "calender",
                      label: "calender",
                      icon: Icon(LineIcons.calendarCheck)),
                  BottomNavigationBarItem(
                      tooltip: "history",
                      label: "history",
                      icon: Icon(LineIcons.history)),
                ],
              ),
      ),
      body: pages[page],
    );
  }
}

/**/
/* class HomePage extends StatefulWidget { */
/*   const HomePage({Key? key, required this.title}) : super(key: key); */
/**/
/*   final String title; */
/**/
/*   @override */
/*   _HomePageState createState() => _HomePageState(); */
/* } */
/**/
/* class _HomePageState extends State<HomePage> { */
/*   int _counter = 0; */
/**/
/*   @override */
/*   void initState() { */
/*     super.initState(); */
/*     HomeWidget.widgetClicked.listen((Uri? uri) => loadData()); */
/*     loadData(); // This will load data from widget every time app is opened */
/*   } */
/**/
/*   void loadData() async { */
/*     await HomeWidget.getWidgetData<int>('_counter', defaultValue: 0) */
/*         .then((value) { */
/*       _counter = value!; */
/*     }); */
/*     setState(() {}); */
/*   } */
/**/
/*   Future<void> updateAppWidget() async { */
/*     await HomeWidget.saveWidgetData<int>('_counter', _counter); */
/*     await HomeWidget.updateWidget( */
/*         name: 'AppWidgetProvider', iOSName: 'AppWidgetProvider'); */
/*   } */
/**/
/*   void _incrementCounter() { */
/*     setState(() { */
/*       _counter++; */
/*     }); */
/*     updateAppWidget(); */
/*   } */
/**/
/*   @override */
/*   Widget build(BuildContext context) { */
/*     return Scaffold( */
/*       appBar: AppBar( */
/*         title: Text(widget.title), */
/*       ), */
/*       body: Center( */
/*         child: Column( */
/*           mainAxisAlignment: MainAxisAlignment.center, */
/*           children: <Widget>[ */
/*             const Text( */
/*               'You have pushed the button this many times:', */
/*             ), */
/*             Text( */
/*               '$_counter', */
/*               style: Theme.of(context).textTheme.headline4, */
/*             ), */
/*           ], */
/*         ), */
/*       ), */
/*       floatingActionButton: FloatingActionButton( */
/*         onPressed: _incrementCounter, */
/*         tooltip: 'Increment', */
/*         child: const Icon(Icons.add), */
/*       ), // This trailing comma makes auto-formatting nicer for build methods. */
/*     ); */
/*   } */
/* } */
