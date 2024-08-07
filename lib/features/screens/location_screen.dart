import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationScreen extends StatelessWidget {
  final String imageUrl;
  final String eventName;
  final String eventLocation;
  final String eventTime;
  final String eventPrice;
  final String seatsTaken;
  final String capacity;
  final String eventType;

  const LocationScreen(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(42.643, 21.100),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [
                            const LatLng(42.644752, 21.114189),
                            const LatLng(42.642311, 21.080354),
                          ],
                          color: const Color(0xffF45D43),
                          strokeWidth: 4.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
              // height: MediaQuery.of(context).size.height * 0.36,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imageUrl,
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
                                  Text(eventType),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFEEDEC),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      eventPrice,
                                      style: const TextStyle(
                                        color: Color(0xffF45D43),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                eventName,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(eventLocation),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 20.0, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffFEEDEC),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 23.0,
                              color: Color(0xffF45D43),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Location"),
                            Text(
                              "Elisian dorano street",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15, top: 5, bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffFEEDEC),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.circle,
                              size: 17.0,
                              color: Color(0xffF45D43),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Destination"),
                            Text(
                              "1234 Main St Los Angeles, CA",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17.0),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                // width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffF35D43),
                ),
                child: const Center(
                  child: Text(
                    "Ride",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
