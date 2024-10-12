import 'package:flutter/material.dart';
import 'package:sports_events_app/event_list.dart';
import 'package:sports_events_app/events_detail_page.dart';
import 'package:sports_events_app/models/sports_event.dart';
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
                  Tab(text: 'YESTERDAY', height: 32),
                  Tab(text: 'TODAY', height: 32),
                  Tab(text: 'TOMORROW', height: 32),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            EventsTab(dateFilter: 'Yesterday'),
            EventsTab(dateFilter: 'Today'),
            EventsTab(dateFilter: 'Tomorrow'),
          ],
        ),
      ),
    );
  }
}

class EventsTab extends StatefulWidget {
  final String dateFilter;

  const EventsTab({super.key, required this.dateFilter});

  @override
  EventsTabState createState() => EventsTabState();
}

class EventsTabState extends State<EventsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case '/':
            builder =
                (BuildContext _) => EventsList(dateFilter: widget.dateFilter);
            break;
          case '/details':
            final event = settings.arguments as SportsEvent;
            builder = (BuildContext _) => EventDetailsPage(event: event);
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
