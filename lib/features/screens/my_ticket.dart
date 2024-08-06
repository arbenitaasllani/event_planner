import 'package:event_planner/features/widgets/calendar.dart';
import 'package:event_planner/features/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text(
          "My Ticket",
          style: TextStyle(color: Color(0xff000000)),
        ),
        iconTheme: const IconThemeData(color: Color(0xff000000)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(
              "assets/icons/notification_icon.png",
              width: 25,
              height: 25,
              color: const Color(0xff000000),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "August 2024",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            HorizontalCalendar(),
            const SizedBox(height: 20),
            const DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Color(0xff000000),
                      labelColor: Color(0xff000000), // Selected tab text color
                      unselectedLabelColor: Color(0xff919191), // Unselected tab text color
                      tabs: [
                        SizedBox(
                          height: 45,
                          child: Center(
                            child: Text(
                              "Upcoming",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          child: Center(
                            child: Text(
                              "Past Tickets",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                TicketWidget(
                                  eventName: 'The Royal Edinburgh Military Music',
                                  eventTime: '07:30 PM',
                                  nrTickets: '1 Ticket',
                                  eventLocation: 'Fushe Kosove',
                                  eventDate: 'Tue, Aug. 6',
                                ),
                                TicketWidget(
                                  eventName: 'Self-love stories: A Journaling Workshop',
                                  eventTime: '07:00 PM',
                                  nrTickets: '2 Tickets',
                                  eventLocation: 'Prishtina',
                                  eventDate: 'Mon, Aug. 5',
                                ),
                                TicketWidget(
                                  eventName: 'The Royal Edinburgh Military Music',
                                  eventTime: '07:30 PM',
                                  nrTickets: '1 Ticket',
                                  eventLocation: 'Podujeve',
                                  eventDate: 'Sun, Aug. 6',
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                TicketWidget(
                                  eventName: 'Self-love stories: A Journaling Workshop',
                                  eventTime: '07:00 PM',
                                  nrTickets: '2 Tickets',
                                  eventLocation: 'Prizren',
                                  eventDate: 'Mon, Apr. 15',
                                ),
                                TicketWidget(
                                  eventName: 'The Royal Edinburgh Military Music',
                                  eventTime: '07:30 PM',
                                  nrTickets: '1 Ticket',
                                  eventLocation: 'Ferizaj',
                                  eventDate: 'Tue, Jul 5',
                                ),
                                TicketWidget(
                                  eventName: 'The Royal Edinburgh Military Music',
                                  eventTime: '07:30 PM',
                                  nrTickets: '1 Ticket',
                                  eventLocation: 'Gjilan',
                                  eventDate: 'Sun, Jan. 23',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
