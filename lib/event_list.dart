import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/theme/colors.dart';

class EventsList extends StatelessWidget {
  final String dateFilter;

  const EventsList({super.key, required this.dateFilter});

  @override
  Widget build(BuildContext context) {
    final List<SportsEvent> filteredEvents = sportsEvents
        .where((event) => event.dateStarting == dateFilter)
        .toList();

    if (filteredEvents.isEmpty) {
      return Center(
        child: Text(
          'No events for $dateFilter',
          style:
              const TextStyle(fontSize: 18, color: AppColors.unselectedColor),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredEvents.length,
      itemBuilder: (context, index) {
        return Text(filteredEvents[index].teams);
      },
    );
  }
}
