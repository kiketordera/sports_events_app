import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/ui/theme/colors.dart';

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
