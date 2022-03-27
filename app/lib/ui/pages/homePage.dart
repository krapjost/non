import 'package:flutter/material.dart';
import 'package:gaji/ui/pages/historyPage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:gaji/ui/pages/todoPage.dart';
import 'package:gaji/ui/pages/calenderPage.dart';
import 'package:gaji/provider/provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int page = ref.watch(pageProvider.state).state;
    final bool _isVisible = !ref.watch(isOnInputProvider.state).state;

    final pages = [
      const TodoPage(),
      const CalenderPage(),
      const HistoryPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ? 55 : 0,
        child: _isVisible
            ? BottomNavigationBar(
                currentIndex: page,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.brown,
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
              )
            : SizedBox(width: MediaQuery.of(context).size.width),
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
