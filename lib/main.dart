import 'package:flutter/material.dart';
import 'package:sports_events_app/theme/colors.dart';

void main() {
  runApp(const SportsEventsApp());
}

class SportsEventsApp extends StatelessWidget {
  const SportsEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Events',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const EventsHomePage(),
    );
  }
}

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColorDark,
          centerTitle: true,
          title: Image.asset(
            'assets/img/logo.png',
            height: 25,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(44),
            child: Container(
              color: AppColors.backgroundColorGray,
              child: const TabBar(
                indicatorColor: AppColors.selectedColor,
                labelColor: AppColors.selectedColor,
                unselectedLabelColor: AppColors.unselectedColor,
                tabs: [
                  Tab(text: 'YESTERDAY'),
                  Tab(text: 'TODAY'),
                  Tab(text: 'TOMORROW'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Text('Here events for today'),
            Text('Here events for yesterday'),
            Text('Here events for tomorrow'),
          ],
        ),
      ),
    );
  }
}
