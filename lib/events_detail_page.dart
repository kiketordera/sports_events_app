import 'package:flutter/material.dart';
import 'package:sports_events_app/event_cell.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/theme/colors.dart';

class EventDetailsPage extends StatelessWidget {
  final SportsEvent event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: LeagueBadge(event: event)),
                  const SizedBox(height: 16),
                  Center(
                    child: EventData(
                      event: event,
                      alignment: CrossAxisAlignment.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(
                    color: AppColors.dividerColor,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Image.network(
                      event.iconUrl,
                      height: 46,
                      width: 46,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Gummi bears cupcake sesame snaps cupcake bonbon. Halvah muffin biscuit brownie bear claw cookie croissant. Sugar plum candy canes brownie topping pudding jelly-o chocolate cake lollipop.',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textColorGray,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Chocolate cake chupa chups shortbread apple pie chocolate bar jelly beans chocolate carrot cake danish. Lemon drops jujubes chocolate sesame snaps marshmallow. Sesame snaps sweet roll oat cake.',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.textColorGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
