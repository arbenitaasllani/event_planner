import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventTime;
  final String nrTickets;
  final String eventLocation;

  const TicketWidget(
      {super.key,
        required this.eventName,
        required this.eventTime,
        required this.nrTickets,
        required this.eventLocation,
        required this.eventDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
      child: Row(
        children: [
          ClipPath(
            clipper: InwardCircularCornerClipper(),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.64,
              decoration: const BoxDecoration(
                color: Color(0xffe9e9e9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventName,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Text(
                          eventDate,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff919191),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        const Text(
                          "|",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff919191),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          eventTime,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff919191),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/ticket_icon.png",
                          width: 20,
                          height: 20,
                          color: const Color(0xff171717),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          nrTickets,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff919191),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: Color(0xff919191),
                        ),
                        Text(
                          eventLocation,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff919191),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 2),
          const SizedBox(
            height: 170,
            child: DottedLine(
              direction: Axis.vertical,
              lineThickness: 2.0,
              dashLength: 4.0,
              dashColor: Colors.grey,
              dashGapLength: 4.0,
              dashGapColor: Colors.black,
            ),
          ),
          const SizedBox(width: 2),
          ClipPath(
            clipper: InwardCircularCornerClipperBlack(),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.24,
              decoration: const BoxDecoration(
                color: Color(0xff000000),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset("assets/images/barcode.png"),
                ),
              ),
            ),
          ),
        ],
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
    path.lineTo(size.width - 15, 0);
    path.arcToPoint(
      Offset(size.width, 15),
      radius: const Radius.circular(15),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - 15);
    path.arcToPoint(
      Offset(size.width - 15, size.height),
      radius: const Radius.circular(15),
      clockwise: false,
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

class InwardCircularCornerClipperBlack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 20.0;
    final path = Path();
    path.moveTo(0, 15);
    path.arcToPoint(
      const Offset(15, 0),
      radius: const Radius.circular(15),
      clockwise: false,
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
      // clockwise: false,
    );
    path.lineTo(15, size.height);
    path.arcToPoint(
      Offset(0, size.height - 15),
      radius: const Radius.circular(15),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
