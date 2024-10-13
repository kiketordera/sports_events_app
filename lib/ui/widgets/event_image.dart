import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sports_events_app/models/sports_event.dart';

class EventImage extends StatelessWidget {
  final SportsEvent event;

  const EventImage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: event.iconUrl,
      height: 40,
      width: 40,
      placeholder: (context, url) =>
          const CircularProgressIndicator(strokeWidth: 2),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red),
      fit: BoxFit.cover,
      cacheKey: event.iconUrl,
    );
  }
}
