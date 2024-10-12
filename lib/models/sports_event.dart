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
