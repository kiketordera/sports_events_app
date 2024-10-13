import 'package:bloc/bloc.dart';
import 'package:sports_events_app/bloc/events/event.dart';
import 'package:sports_events_app/bloc/events/state.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/repositories/sports_event_repository.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final SportsEventRepository repository;

  EventsBloc({required this.repository}) : super(EventsInitial()) {
    on<LoadEvents>(_onLoadEvents);
  }

  Future<void> _onLoadEvents(
      LoadEvents event, Emitter<EventsState> emit) async {
    emit(EventsLoading());
    try {
      final allEvents = await repository.getSportsEvents();
      final filteredEvents = allEvents
          .where((e) =>
              e.dateStarting.toLowerCase() == event.dateFilter.toLowerCase())
          .toList();

      sortSportsEventsChronologically(filteredEvents);

      if (filteredEvents.isEmpty) {
        emit(EventsError(message: 'No events for ${event.dateFilter}'));
      } else {
        emit(EventsLoaded(events: filteredEvents));
      }
    } catch (e) {
      emit(EventsError(message: 'Failed to load events: ${e.toString()}'));
    }
  }
}
