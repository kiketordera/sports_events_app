import 'package:equatable/equatable.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

class LoadEvents extends EventsEvent {
  final String dateFilter;

  const LoadEvents({required this.dateFilter});

  @override
  List<Object> get props => [dateFilter];
}