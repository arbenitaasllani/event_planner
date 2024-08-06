import 'package:event_planner/features/screens/choose_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class EventDetails extends StatefulWidget {
  final String imageUrl;
  final String eventName;
  final String eventLocation;
  final String eventTime;
  final String eventPrice;
  final String seatsTaken;
  final String capacity;
  final String eventType;

  const EventDetails(
      {super.key,
      required this.imageUrl,
      required this.eventName,
      required this.eventLocation,
      required this.eventTime,
      required this.eventPrice,
      required this.seatsTaken,
      required this.capacity,
      required this.eventType});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isFavorite = false;
  bool isExpanded = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        title: const Text("Event Details"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      widget.imageUrl,
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        height: 80,
                        width: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "JAN",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "22",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffF45D43),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventName,
                        style: const TextStyle(
                            fontSize: 20.5, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.eventLocation,
                            style: const TextStyle(
                                color: Color(0xff676666), fontSize: 17.0),
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            " | ",
                            style: TextStyle(
                                color: Color(0xff676666), fontSize: 17.0),
                          ),
                          const SizedBox(width: 5.0),
                          Image.asset(
                            "assets/icons/rating_star.png",
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            "4.4",
                            style: TextStyle(
                                fontSize: 17.0, color: Color(0xffFACC18)),
                          ),
                          const SizedBox(width: 5.0),
                          const Text(
                            "(512)",
                            style: TextStyle(
                                fontSize: 14.0, color: Color(0xffaeaaa9)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: toggleFavorite,
                    child: isFavorite
                        ? Image.asset(
                            "assets/icons/favorite_selected.png",
                            width: 33,
                            height: 33,
                            color: const Color(0xffF45D43),
                          )
                        : Image.asset(
                            "assets/icons/favorite_icon.png",
                            width: 30,
                            height: 30,
                            color: const Color(0xffF45D43),
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  FlutterImageStack(
                    imageSource: ImageSource.asset,
                    imageList: const [
                      "assets/images/avatar1.png",
                      "assets/images/avatar2.png",
                      "assets/images/avatar3.png",
                      "assets/images/avatar4.png",
                      "assets/images/avatar5.png",
                    ],
                    totalCount: 5,
                    itemCount: 5,
                    itemRadius: 35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "250K",
                    style: TextStyle(
                        color: Color(0xffF45D43),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    "People are Joined",
                    style: TextStyle(
                        color: Color(0xffaeaaa9),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              const Text("Description",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
              const SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff838282),
                    ),
                  ),
                  TextButton(
                    onPressed: toggleExpanded,
                    child: Text(
                      isExpanded ? 'Read Less' : 'Read More',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF35D43)),
                    ),
                  ),
                ],
              ),
              const Text("Location",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0)),
              const SizedBox(height: 10.0),
              Container(
                height: 250,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(42.6629, 21.1655),
                      initialZoom: 9.2,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // height: 70,
        color: Colors.white,
        padding:
            const EdgeInsets.only(bottom: 20.0, left: 30.0, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.eventPrice}',
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChooseSeat(
                                imageUrl: widget.imageUrl,
                                eventName: widget.eventName,
                                eventLocation: widget.eventLocation,
                                eventTime: widget.eventTime,
                                eventPrice: widget.eventPrice,
                                eventType: widget.eventType,
                              )));
                },
                child: Container(
                  // width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffF35D43),
                  ),
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
