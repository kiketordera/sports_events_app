import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/ui/theme/colors.dart';

class EventData extends StatelessWidget {
  const EventData({
    super.key,
    required this.event,
    required this.alignment,
  });

  final SportsEvent event;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          '${event.dateStarting} | ${event.timeStarting} - ${event.timeEnding}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          event.teams,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
