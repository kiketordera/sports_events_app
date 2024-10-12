import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/services/sports_event_service.dart';

class SportsEventRepository {
  final SportsEventService service;

  SportsEventRepository({required this.service});

  Future<List<SportsEvent>> getSportsEvents() {
    return service.fetchSportsEvents();
  }
}
