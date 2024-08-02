import 'dart:ui';

import 'package:event_planner/features/screens/event_details.dart';
import 'package:event_planner/features/widgets/button_widget.dart';
import 'package:event_planner/features/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1D2F),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 0.0, right: 0.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    // color: Color(0xfff1f1f1),
                    decoration: BoxDecoration(
                        color: const Color(0xfff1f1f1),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Center(
                        child: Text(
                      "A",
                      style: TextStyle(
                          color: Color(0xff262436),
                          fontSize: 40.0,
                          fontWeight: FontWeight.w800),
                    )),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Prishtina, Kosova",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/icons/notification_icon.png",
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Hello, Arbenita",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 30),
              child: Text(
                "Let's find various events around you",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 55.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff25223C),
                    borderRadius: BorderRadius.circular(40),
                    border:
                        Border.all(color: const Color(0xff3D3D3F), width: 2.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/search_icon.png",
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                          child: Text(
                        "Search...",
                        style:
                            TextStyle(color: Color(0xff848B95), fontSize: 18.0),
                      )),
                      Image.asset(
                        "assets/icons/filter_icon.png",
                        width: 25,
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ButtonWidget(text: "Live Concert"),
                    ButtonWidget(text: "Art Exhibition"),
                    ButtonWidget(text: "Workshop"),
                    ButtonWidget(text: "Tour"),
                    ButtonWidget(text: "Others"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Popular Event",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                print("see all button pressed");
                              },
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 16.0, color: Color(0xff3D3D3F)),
                              ),
                            ),
                          ],
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
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
                                imageUrl: "assets/images/art_exhibition.jpg",
                                eventName: "Art Exhibition",
                                eventLocation: "Prishtina, KS",
                                eventTime: "02.08.2024 | 20:00",
                                eventPrice: "\$70",
                                capacity: "/80 Participants",
                                eventType: "Art Exhibition",
                                seatsTaken: '50',
                              ),
                            ],
                          ),
                        ),
                      ],
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
