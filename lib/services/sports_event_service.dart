import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sports_events_app/models/sports_event.dart';

abstract class SportsEventService {
  Future<List<SportsEvent>> fetchSportsEvents();
}

class LocalSportsEventService implements SportsEventService {
  @override
  Future<List<SportsEvent>> fetchSportsEvents() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/events.json');
      final List<dynamic> data = json.decode(response);

      return data.map((json) => SportsEvent.fromMap(json)).toList();
    } catch (e) {
      throw Exception('Failed to load sports events: $e');
    }
  }
}
