import 'package:event_planner/features/models/favorites.dart';
import 'package:event_planner/features/screens/event_details.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final String imageUrl;
  final String eventName;
  final String eventLocation;
  final String eventTime;
  final String eventPrice;
  final String seatsTaken;
  final String capacity;
  final String eventType;

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.eventName,
    required this.eventLocation,
    required this.eventTime,
    required this.eventPrice,
    required this.capacity,
    required this.eventType,
    required this.seatsTaken,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = favoriteEvents.any((event) => event.eventName == widget.eventName);
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        favoriteEvents.add(EventDetails(
          imageUrl: widget.imageUrl,
          eventName: widget.eventName,
          eventLocation: widget.eventLocation,
          eventTime: widget.eventTime,
          eventPrice: widget.eventPrice,
          capacity: widget.capacity,
          eventType: widget.eventType,
          seatsTaken: widget.seatsTaken,
        ));
      } else {
        favoriteEvents.removeWhere((event) => event.eventName == widget.eventName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetails(
              imageUrl: widget.imageUrl,
              eventName: widget.eventName,
              eventLocation: widget.eventLocation,
              eventTime: widget.eventTime,
              eventPrice: widget.eventPrice,
              capacity: widget.capacity,
              eventType: widget.eventType,
              seatsTaken: widget.seatsTaken,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom: 10.0, right: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xfffefefe),
                  Color(0xfffefefe),
                  Color(0xffeaeaea),
                  Color(0xffe8e8e8)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(widget.imageUrl,
                          width: double.infinity, height: 200),
                      Positioned(
                        top: 15,
                        left: 10,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color(0xffFEFEFE),
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Center(
                              child: Text(
                                widget.eventType,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        right: 10,
                        child: GestureDetector(
                          onTap: toggleFavorite,
                          child: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xffFEFEFE),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: const Color(0xffF45D43),
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.eventName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Color(
                                0xff9DA4AB,
                              ),
                            ),
                            Text(
                              widget.eventLocation,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                  color: Color(0xff9DA4AB)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 65,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xffFEEDEC),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          widget.eventPrice,
                          style: const TextStyle(
                              color: Color(0xffF45D43),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  height: 5.0,
                  color: Color(0xff9c9c9c),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.seatsTaken,
                          style: const TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.capacity,
                          style: const TextStyle(
                              color: Color(0xffA1A8AB),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      widget.eventTime,
                      style: const TextStyle(
                          color: Color(0xffA1A8AB),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
