import 'package:flutter/material.dart';
import 'package:sports_events_app/repositories/sports_event_repository.dart';
import 'package:sports_events_app/ui/theme/colors.dart';
import 'package:sports_events_app/ui/widgets/events_tab.dart';

class EventsHomePage extends StatelessWidget {
  const EventsHomePage({super.key, required this.repository});

  final SportsEventRepository repository;

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
                  Tab(text: 'YESTERDAY', height: 32),
                  Tab(text: 'TODAY', height: 32),
                  Tab(text: 'TOMORROW', height: 32),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            EventsTab(
              dateFilter: 'Yesterday',
              repository: repository,
            ),
            EventsTab(
              dateFilter: 'Today',
              repository: repository,
            ),
            EventsTab(
              dateFilter: 'Tomorrow',
              repository: repository,
            ),
          ],
        ),
      ),
    );
  }
}
