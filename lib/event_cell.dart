import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/theme/colors.dart';

class EventCell extends StatelessWidget {
  final SportsEvent event;

  const EventCell({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.hoverColor,
      onTap: () {
        Navigator.of(context).pushNamed(
          '/details',
          arguments: event,
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 20, top: 21, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 21),
              child: EventImage(event: event),
            ),
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

class EventImage extends StatelessWidget {
  const EventImage({
    super.key,
    required this.event,
  });

  final SportsEvent event;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      event.iconUrl,
      height: 40,
      width: 40,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, color: Colors.red);
      },
    );
  }
}

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

class LeagueBadge extends StatelessWidget {
  const LeagueBadge({
    super.key,
    required this.event,
  });

  final SportsEvent event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.hoverColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            event.league.split(' ').first.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textColor,
            ),
          ),
          Text(
            event.league.split(' ').last,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
