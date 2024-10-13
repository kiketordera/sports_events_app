import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sports_events_app/bloc/events/bloc.dart';
import 'package:sports_events_app/bloc/events/event.dart';
import 'package:sports_events_app/bloc/events/state.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/repositories/sports_event_repository.dart';

import 'events_bloc_test.mocks.dart';

@GenerateMocks([SportsEventRepository])
void main() {
  group('EventsBloc', () {
    late EventsBloc eventsBloc;
    late MockSportsEventRepository mockRepository;

    setUp(() {
      mockRepository = MockSportsEventRepository();
      eventsBloc = EventsBloc(repository: mockRepository);
    });

    tearDown(() {
      eventsBloc.close();
    });

    final mockEvents = [
      SportsEvent(
        iconUrl: 'https://example.com/icon.png',
        league: 'Lega A',
        teams: 'Team A vs Team B',
        sportType: 'Football',
        dateStarting: 'Today',
        timeStarting: '14:00',
      ),
      SportsEvent(
        iconUrl: 'https://example.com/icon1.png',
        league: 'Lega B',
        teams: 'Team C vs Team D',
        sportType: 'Basketball',
        dateStarting: 'Today',
        timeStarting: '16:00',
      ),
    ];

    // Test case 1: Successful data fetch
    blocTest<EventsBloc, EventsState>(
      'emits [EventsLoading, EventsLoaded] when LoadEvents is added and data is fetched successfully',
      build: () {
        when(mockRepository.getSportsEvents())
            .thenAnswer((_) async => mockEvents);
        return eventsBloc;
      },
      act: (bloc) => bloc.add(const LoadEvents(dateFilter: 'Today')),
      expect: () => [
        EventsLoading(),
        EventsLoaded(events: mockEvents),
      ],
      verify: (_) {
        verify(mockRepository.getSportsEvents()).called(1);
      },
    );

    // Test case 2: Repository throws an exception
    blocTest<EventsBloc, EventsState>(
      'emits [EventsLoading, EventsError] when LoadEvents is added and repository throws an exception',
      build: () {
        when(mockRepository.getSportsEvents())
            .thenThrow(Exception('Error fetching data'));
        return eventsBloc;
      },
      act: (bloc) => bloc.add(const LoadEvents(dateFilter: 'Today')),
      expect: () => [
        EventsLoading(),
        const EventsError(
            message: 'Failed to load events: Exception: Error fetching data'),
      ],
      verify: (_) {
        verify(mockRepository.getSportsEvents()).called(1);
      },
    );

    // Test case 3: No events match the filter
    blocTest<EventsBloc, EventsState>(
      'emits [EventsLoading, EventsError] when LoadEvents is added and no events match the filter',
      build: () {
        when(mockRepository.getSportsEvents()).thenAnswer((_) async => []);
        return eventsBloc;
      },
      act: (bloc) => bloc.add(const LoadEvents(dateFilter: 'Today')),
      expect: () => [
        EventsLoading(),
        const EventsError(message: 'No events for Today'),
      ],
      verify: (_) {
        verify(mockRepository.getSportsEvents()).called(1);
      },
    );
  });
}
