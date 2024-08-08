// favorites_screen.dart
import 'package:event_planner/features/models/favorites.dart';
import 'package:event_planner/features/screens/event_details.dart';
import 'package:event_planner/features/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteEvents.length,
        itemBuilder: (context, index) {
          final event = favoriteEvents[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EventDetails(
                          imageUrl: event.imageUrl,
                          eventName: event.eventName,
                          eventLocation: event.eventLocation,
                          eventTime: event.eventTime,
                          eventPrice: event.eventPrice,
                          seatsTaken: event.seatsTaken,
                          capacity: event.capacity,
                          eventType: event.eventType),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            event.imageUrl,
                            width: 120,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 15.0, bottom: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(event.eventType),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFEEDEC),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      event.eventPrice,
                                      style: const TextStyle(
                                        color: Color(0xffF45D43),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                event.eventName,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(event.eventLocation),
                                  const Text("  |  "),
                                  const Text("22 Jan, 2024"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // EventCard(
              //   imageUrl: event.imageUrl,
              //   eventName: event.eventName,
              //   eventLocation: event.eventLocation,
              //   eventTime: event.eventTime,
              //   eventPrice: event.eventPrice,
              //   capacity: event.capacity,
              //   eventType: event.eventType,
              //   seatsTaken: event.seatsTaken,
              // ),
            ),
          );
        },
      ),
    );
  }
}
