import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class CalenderPage extends HookConsumerWidget {
  final String project;

  const CalenderPage({Key? key, this.project = ''}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 0,
          bottom: const TabBar(tabs: [
            Tab(
              text: "Week",
            ),
            Tab(
              text: "Month",
            ),
            Tab(
              text: "Year",
            ),
          ]),
        ),
        backgroundColor: Colors.black87,
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
