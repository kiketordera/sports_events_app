class SportsEvent {
  final String iconUrl;
  final String league;
  final String teams;
  final String sportType;
  final String dateStarting;
  final String timeStarting;

  SportsEvent({
    required this.iconUrl,
    required this.league,
    required this.teams,
    required this.sportType,
    required this.dateStarting,
    required this.timeStarting,
  });

  factory SportsEvent.fromMap(Map<String, dynamic> map) {
    return SportsEvent(
      iconUrl: map['iconUrl'] as String,
      league: map['league'] as String,
      teams: map['teams'] as String,
      sportType: map['sportType'] as String,
      dateStarting: map['dateStarting'] as String,
      timeStarting: map['timeStarting'] as String,
    );
  }
}

final List<SportsEvent> sportsEvents = [
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Serie A',
    teams: 'Milan vs. Munich',
    sportType: 'Football',
    dateStarting: 'Today',
    timeStarting: '14:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Juventus vs. Roma',
    sportType: 'Basketball',
    dateStarting: 'Yesterday',
    timeStarting: '16:00',
  ),
];
