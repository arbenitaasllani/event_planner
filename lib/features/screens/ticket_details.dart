import 'package:dotted_line/dotted_line.dart';
import 'package:event_planner/features/models/seat_model.dart';
import 'package:event_planner/features/screens/home_screen.dart';
import 'package:event_planner/features/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TicketDetails extends StatefulWidget {
  final String imageUrl;
  final String eventName;
  final String eventLocation;
  final String eventTime;
  final String eventPrice;
  final String eventType;
  final List<Seat> seatsSelected;

  const TicketDetails({
    super.key,
    required this.imageUrl,
    required this.eventName,
    required this.eventLocation,
    required this.eventTime,
    required this.eventPrice,
    required this.eventType,
    required this.seatsSelected,
  });

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  String _seatsToString() {
    return widget.seatsSelected
        .map((seat) => '${seat.rowLabel}${seat.number}')
        .join(', ');
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      const SnackBar(
        content: Text(
          'Ticket was downloaded successfully',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D1D2F),
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1D2F),
        iconTheme: const IconThemeData(
          color: Color(0xffFFFFFF),
        ),
        title: const Text(
          "Ticket Details",
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            ClipPath(
              clipper: InwardCircularCornerClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.54,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Column(children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(widget.imageUrl),
                        ),
                        Positioned(
                          top: 15,
                          left: 10,
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xffFEFEFE),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Center(
                                child: Text(
                                  widget.eventType,
                                  style: const TextStyle(
                                    fontSize: 15.0,
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
                    const SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.eventName,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: 55,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color(0xffFEEDEC),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              widget.eventPrice,
                              style: const TextStyle(
                                color: Color(0xffF45D43),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ticket Holder",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff8C939B),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff8C939B),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Arbenita Asllani",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff343434),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.eventTime,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff343434),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff8C939B),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Seats",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff8C939B),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.eventLocation,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff343434),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            _seatsToString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff343434),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashLength: 4.0,
                  dashColor: Color(0xff8C939B),
                  dashGapLength: 4.0,
                  dashGapColor: Colors.white,
                ),
              ),
            ),
            ClipPath(
              clipper: InwardCircularCornerClipperBarcode(),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.37,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/bar_code.png",
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      const SizedBox(height: 10.0),
                      const Text("Scan the barcode"),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => {
                _showToast(context),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const NavigationScreen()),
                    (d) => false)
              },
              child: Container(
                // width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffF35D43),
                ),
                child: const Center(
                  child: Text(
                    "Download Ticket",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

class InwardCircularCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 20.0;
    final path = Path();
    path.moveTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
      // clockwise: false,
    );
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
      // clockwise: false,
    );
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class InwardCircularCornerClipperBarcode extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 20.0;
    final path = Path();
    path.moveTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
      // clockwise: false,
    );
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
      // clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
