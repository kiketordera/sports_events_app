import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_events_app/bloc/events/bloc.dart';
import 'package:sports_events_app/bloc/events/event.dart';
import 'package:sports_events_app/bloc/events/state.dart';
import 'package:sports_events_app/models/sports_event.dart';
import 'package:sports_events_app/repositories/sports_event_repository.dart';
import 'package:sports_events_app/ui/theme/colors.dart';
import 'package:sports_events_app/ui/widgets/event_cell.dart';
import 'package:sports_events_app/ui/pages/events_detail_page.dart';

class EventsTab extends StatefulWidget {
  final String dateFilter;
  final SportsEventRepository repository;

  const EventsTab(
      {Key? key, required this.dateFilter, required this.repository})
      : super(key: key);

  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => EventsBloc(repository: widget.repository)
        ..add(LoadEvents(dateFilter: widget.dateFilter)),
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          switch (settings.name) {
            case '/':
              builder = (BuildContext _) =>
                  BlocBuilder<EventsBloc, EventsState>(
                    builder: (context, state) {
                      if (state is EventsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is EventsLoaded) {
                        return ListView.separated(
                          itemCount: state.events.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 1,
                            color: AppColors.dividerColor,
                          ),
                          itemBuilder: (context, index) {
                            return EventCell(
                              event: state.events[index],
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/details',
                                  arguments: state.events[index],
                                );
                              },
                            );
                          },
                        );
                      } else if (state is EventsError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.message,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.unselectedColor),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<EventsBloc>().add(LoadEvents(
                                      dateFilter: widget.dateFilter));
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  );
              break;
            case '/details':
              if (settings.arguments is SportsEvent) {
                final event = settings.arguments as SportsEvent;
                builder = (BuildContext _) => EventDetailsPage(event: event);
              } else {
                builder = (BuildContext _) => const Scaffold(
                      body: Center(child: Text('Invalid event data')),
                    );
              }
              break;
            default:
              builder = (BuildContext _) => const Scaffold(
                    body: Center(child: Text('No route defined for this tab')),
                  );
          }

          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
    );
  }
}
