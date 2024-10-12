import 'package:flutter/material.dart';
import 'package:sports_events_app/repositories/sports_event_repository.dart';
import 'package:sports_events_app/routes.dart';
import 'package:sports_events_app/services/sports_event_service.dart';
import 'package:sports_events_app/ui/pages/events_home_page.dart';
import 'package:sports_events_app/ui/theme/colors.dart';

void main() {
  runApp(const SportsEventsApp());
}

class SportsEventsApp extends StatelessWidget {
  const SportsEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SportsEventService service = LocalSportsEventService();
    final SportsEventRepository repository =
        SportsEventRepository(service: service);

    return MaterialApp(
      title: 'Sports Events',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: AppColors.backgroundColorDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColorDark,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
      home: EventsHomePage(repository: repository),
    );
  }
}
