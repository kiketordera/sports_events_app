import 'package:flutter/material.dart';
import 'package:sports_events_app/event_cell.dart';
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

    sortSportsEventsChronologically(filteredEvents);

    if (filteredEvents.isEmpty) {
      return Center(
        child: Text(
          'No events for $dateFilter',
          style:
              const TextStyle(fontSize: 18, color: AppColors.unselectedColor),
        ),
      );
    }

    return ListView.separated(
      itemCount: filteredEvents.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 5,
          color: AppColors.dividerColor,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        );
      },
      itemBuilder: (context, index) {
        return EventCell(event: filteredEvents[index]);
      },
    );
  }
}
