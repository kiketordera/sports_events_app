import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/services/sports_event_service.dart';

class SportsEventRepository {
  final SportsEventService service;
  List<SportsEvent>? _cache;

  SportsEventRepository({required this.service});

  Future<List<SportsEvent>> getSportsEvents() async {
    if (_cache != null) {
      return _cache!;
    } else {
      _cache = await service.fetchSportsEvents();
      return _cache!;
    }
  }

  void clearCache() {
    _cache = null;
  }
}
