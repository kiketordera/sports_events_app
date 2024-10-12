import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/ui/widgets/event_data.dart';
import 'package:sports_events_app/ui/widgets/event_image.dart';
import 'package:sports_events_app/ui/widgets/league_badge.dart';

class EventCell extends StatelessWidget {
  final SportsEvent event;
  final VoidCallback onTap;

  const EventCell({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Utilize the provided onTap callback
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EventImage(event: event),
            const SizedBox(width: 16),
            Expanded(
              child: EventData(
                event: event,
                alignment: CrossAxisAlignment.start,
              ),
            ),
            LeagueBadge(event: event),
          ],
        ),
      ),
    );
  }
}
