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
  String get timeEnding {
    final startingTime = _parseTime(timeStarting);
    if (startingTime == null) {
      return 'Invalid Time';
    }

    final endingTime = startingTime.add(const Duration(hours: 2));

    return _formatTime(endingTime);
  }

  DateTime get eventDate {
    final today = DateTime.now();
    switch (dateStarting.toLowerCase()) {
      case 'yesterday':
        return today.subtract(const Duration(days: 1));
      case 'today':
        return today;
      case 'tomorrow':
        return today.add(const Duration(days: 1));
      default:
        return today;
    }
  }

  DateTime? _parseTime(String time) {
    try {
      final parts = time.split(':');
      if (parts.length != 2) return null;
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, hour, minute);
    } catch (e) {
      return null;
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

void sortSportsEventsChronologically(List<SportsEvent> events) {
  events.sort((a, b) => a.timeStarting.compareTo(b.timeStarting));
}

final List<SportsEvent> sportsEvents = [
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Juventus vs Roma',
    sportType: 'Basketball',
    dateStarting: 'Yesterday',
    timeStarting: '16:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Juventus vs Inter Milan',
    sportType: 'Football',
    dateStarting: 'Yesterday',
    timeStarting: '16:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Manchester United vs Liverpool',
    sportType: 'Football',
    dateStarting: 'Yesterday',
    timeStarting: '19:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Real Madrid vs Barcelona',
    sportType: 'Football',
    dateStarting: 'Yesterday',
    timeStarting: '21:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Lakers vs Celtics',
    sportType: 'Basketball',
    dateStarting: 'Yesterday',
    timeStarting: '18:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Real Madrid vs CSKA Moscow',
    sportType: 'Basketball',
    dateStarting: 'Yesterday',
    timeStarting: '20:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Djokovic vs Thiem',
    sportType: 'Tennis',
    dateStarting: 'Yesterday',
    timeStarting: '14:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Serena vs Williams',
    sportType: 'Tennis',
    dateStarting: 'Yesterday',
    timeStarting: '16:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Milan vs Munich',
    sportType: 'Football',
    dateStarting: 'Today',
    timeStarting: '14:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Bayern Munich vs Borussia Dortmund',
    sportType: 'Football',
    dateStarting: 'Today',
    timeStarting: '14:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'LA Galaxy vs Seattle Sounders',
    sportType: 'Football',
    dateStarting: 'Today',
    timeStarting: '16:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Paris Saint-Germain vs Lyon',
    sportType: 'Football',
    dateStarting: 'Today',
    timeStarting: '19:45',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Heat vs Bucks',
    sportType: 'Basketball',
    dateStarting: 'Today',
    timeStarting: '19:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Fenerbahçe vs Zalgiris Kaunas',
    sportType: 'Basketball',
    dateStarting: 'Today',
    timeStarting: '21:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Medvedev vs Alcaraz',
    sportType: 'Tennis',
    dateStarting: 'Today',
    timeStarting: '13:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Barty vs Osaka',
    sportType: 'Tennis',
    dateStarting: 'Today',
    timeStarting: '15:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Yankees vs Red Sox',
    sportType: 'Baseball',
    dateStarting: 'Today',
    timeStarting: '18:15',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Yomiuri Giants vs Hanshin Tigers',
    sportType: 'Baseball',
    dateStarting: 'Today',
    timeStarting: '20:45',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Ajax vs PSV Eindhoven',
    sportType: 'Football',
    dateStarting: 'Tomorrow',
    timeStarting: '15:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Porto vs Benfica',
    sportType: 'Football',
    dateStarting: 'Tomorrow',
    timeStarting: '17:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Toronto FC vs New York City FC',
    sportType: 'Football',
    dateStarting: 'Tomorrow',
    timeStarting: '20:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Knicks vs Nets',
    sportType: 'Basketball',
    dateStarting: 'Tomorrow',
    timeStarting: '19:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'CSKA Moscow vs Olimpia Milano',
    sportType: 'Basketball',
    dateStarting: 'Tomorrow',
    timeStarting: '21:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Tsitsipas vs Zverev',
    sportType: 'Tennis',
    dateStarting: 'Tomorrow',
    timeStarting: '14:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Swiatek vs Svitolina',
    sportType: 'Tennis',
    dateStarting: 'Tomorrow',
    timeStarting: '16:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Dodgers vs Giants',
    sportType: 'Baseball',
    dateStarting: 'Tomorrow',
    timeStarting: '19:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Doosan Bears vs Kia Tigers',
    sportType: 'Baseball',
    dateStarting: 'Tomorrow',
    timeStarting: '21:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Maple Leafs vs Bruins',
    sportType: 'Hockey',
    dateStarting: 'Today',
    timeStarting: '20:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'SKA Saint Petersburg vs CSKA Moscow',
    sportType: 'Hockey',
    dateStarting: 'Tomorrow',
    timeStarting: '22:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Patriots vs Dolphins',
    sportType: 'American Football',
    dateStarting: 'Today',
    timeStarting: '17:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega A',
    teams: 'Toronto Argonauts vs Montreal Alouettes',
    sportType: 'Canadian Football',
    dateStarting: 'Tomorrow',
    timeStarting: '19:30',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega B',
    teams: 'Conor McGregor vs Dustin Poirier',
    sportType: 'MMA',
    dateStarting: 'Yesterday',
    timeStarting: '22:00',
  ),
  SportsEvent(
    iconUrl: 'https://cdn-icons-png.flaticon.com/512/2158/2158416.png',
    league: 'Lega C',
    teams: 'Daniel Cormier vs Ryan Bader',
    sportType: 'MMA',
    dateStarting: 'Tomorrow',
    timeStarting: '20:30',
  ),
];
