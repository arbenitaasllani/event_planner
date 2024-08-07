import 'package:event_planner/features/widgets/event_card.dart';
import 'package:flutter/material.dart';

class PopularEvents extends StatefulWidget {
  const PopularEvents({super.key});

  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Events"),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EventCard(
                  imageUrl: "assets/images/art_exhibition.jpg",
                  eventName: "Art Exhibition",
                  eventLocation: "Prishtina, KS",
                  eventTime: "02.08.2024 | 20:00",
                  eventPrice: "\$70",
                  capacity: "/80 Participants",
                  eventType: "Art Exhibition",
                  seatsTaken: '50',
                ),
                const SizedBox(height: 15.0),
                EventCard(
                  imageUrl: "assets/images/live_concert.jpg",
                  eventName: "Newport Beach Jazz Festival",
                  eventLocation: "California, CA",
                  eventTime: "22.01.2024 | 20:00",
                  eventPrice: "\$453",
                  capacity: "/1K Participant",
                  eventType: "Live Concert",
                  seatsTaken: '680',
                ),
                const SizedBox(height: 15.0),
                EventCard(
                  imageUrl: "assets/images/workshop_image.jpg",
                  eventName: "Civil Engineering Workshop",
                  eventLocation: "Prishtina, KS",
                  eventTime: "30.07.2024 | 17:00",
                  eventPrice: "\$350",
                  capacity: "/500 Participants",
                  eventType: "Workshop",
                  seatsTaken: '430',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
