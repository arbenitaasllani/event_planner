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
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
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
                SizedBox(height: 15.0),
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
                SizedBox(height: 15.0),
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
                EventCard(
                  imageUrl: "assets/images/tour.jpeg",
                  eventName: "Tour around the Ocean",
                  eventLocation: "Philippines",
                  eventTime: "10.08.2024 | 08:00",
                  eventPrice: "\$145",
                  capacity: "/50 Participants",
                  eventType: "Tour",
                  seatsTaken: '48',
                ),
                EventCard(
                  imageUrl: "assets/images/live_concert2.jpg",
                  eventName: "Outdoor Live Concert",
                  eventLocation: "Prishtina, KS",
                  eventTime: "12.09.2024 | 20:00",
                  eventPrice: "\$40",
                  capacity: "/120 Participants",
                  eventType: "Live Concert",
                  seatsTaken: '100',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
