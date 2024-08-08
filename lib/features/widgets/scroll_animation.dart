import 'package:event_planner/features/widgets/event_card.dart';
import 'package:flutter/material.dart';

class ScrollingWidget extends StatefulWidget {
  const ScrollingWidget({super.key});

  @override
  State<ScrollingWidget> createState() => _ScrollingWidgetState();
}

class _ScrollingWidgetState extends State<ScrollingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  final List<EventCard> _eventPaths = [
    const EventCard(
      imageUrl: "assets/images/live_concert.jpg",
      eventName: "Newport Beach Jazz Festival",
      eventLocation: "California, CA",
      eventTime: "22.01.2024 | 20:00",
      eventPrice: "\$453",
      capacity: "/1K Participant",
      eventType: "Live Concert",
      seatsTaken: '680',
    ),
    const EventCard(
      imageUrl: "assets/images/workshop_image.jpg",
      eventName: "Civil Engineering Workshop",
      eventLocation: "Prishtina, KS",
      eventTime: "30.07.2024 | 17:00",
      eventPrice: "\$350",
      capacity: "/500 Participants",
      eventType: "Workshop",
      seatsTaken: '430',
    ),
    const EventCard(
      imageUrl: "assets/images/art_exhibition.jpg",
      eventName: "Art Exhibition",
      eventLocation: "Prishtina, KS",
      eventTime: "02.08.2024 | 20:00",
      eventPrice: "\$70",
      capacity: "/80 Participants",
      eventType: "Art Exhibition",
      seatsTaken: '50',
    ),
    const EventCard(
      imageUrl: "assets/images/tour.jpeg",
      eventName: "Tour around the Ocean",
      eventLocation: "Philippines",
      eventTime: "10.08.2024 | 08:00",
      eventPrice: "\$145",
      capacity: "/50 Participants",
      eventType: "Tour",
      seatsTaken: '48',
    ),
    const EventCard(
      imageUrl: "assets/images/live_concert2.jpg",
      eventName: "Outdoor Live Concert",
      eventLocation: "Prishtina, KS",
      eventTime: "12.09.2024 | 20:00",
      eventPrice: "\$40",
      capacity: "/120 Participants",
      eventType: "Live Concert",
      seatsTaken: '100',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              -_animationController.value *
                  MediaQuery.of(context).size.width *
                  _eventPaths.length /
                  2,
              0),
          child: Row(
            children: _buildInfiniteChildren(),
          ),
        );
      },
    );
  }

  List<Widget> _buildInfiniteChildren() {
    return List.generate(_eventPaths.length * 2, (index) {
      final event = _eventPaths[index % _eventPaths.length];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: EventCard(
          imageUrl: event.imageUrl,
          eventName: event.eventName,
          eventLocation: event.eventLocation,
          eventTime: event.eventTime,
          eventPrice: event.eventPrice,
          capacity: event.capacity,
          eventType: event.eventType,
          seatsTaken: event.seatsTaken,
        ),
      );
    });
  }
}
