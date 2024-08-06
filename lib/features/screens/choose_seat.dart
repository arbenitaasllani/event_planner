import 'package:event_planner/features/models/seat_model.dart';
import 'package:event_planner/features/screens/ticket_details.dart';
import 'package:flutter/material.dart';

List<Seat> generateSeats() {
  List<Seat> seats = [];
  List<int> seatCounts = [3, 5, 5, 5, 5, 3];

  for (int row = 0; row < seatCounts.length; row++) {
    int seatsPerRow = seatCounts[row];
    for (int number = 0; number < seatsPerRow; number++) {
      bool isNonSelectable =
          (row == 0 || row == seatCounts.length - 1) && (number < 3);
      seats.add(
          Seat(row: row, number: number, isNonSelectable: isNonSelectable));
    }
  }

  return seats;
}

List<Seat> generateSeatsRight() {
  List<Seat> seats = [];
  List<int> seatCounts = [3, 5, 5, 5, 5, 3];

  for (int row = 0; row < seatCounts.length; row++) {
    int seatsPerRow = seatCounts[row];
    for (int number = 0; number < seatsPerRow; number++) {
      bool isNonSelectable =
          (row == 0 || row == seatCounts.length - 1) && (number < 3);
      seats.add(
          Seat(row: row, number: number, isNonSelectable: isNonSelectable));
    }
  }

  return seats;
}

class ChooseSeat extends StatefulWidget {
  final String imageUrl;
  final String eventName;
  final String eventLocation;
  final String eventTime;
  final String eventPrice;
  final String eventType;

  const ChooseSeat({
    Key? key,
    required this.imageUrl,
    required this.eventName,
    required this.eventLocation,
    required this.eventTime,
    required this.eventPrice,
    required this.eventType,
  }) : super(key: key);

  @override
  State<ChooseSeat> createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  List<Seat> seats = generateSeats();
  List<Seat> seatsRight = generateSeatsRight();
  List<Seat> selectedSeats = [];
  bool isButtonEnabled = false;

  void bookSeat(int index) {
    setState(() {
      seats[index].isBooked = !seats[index].isBooked;
      if (seats[index].isBooked) {
        selectedSeats.add(seats[index]);
      } else {
        selectedSeats.remove(seats[index]);
      }
      isButtonEnabled = selectedSeats.isNotEmpty;
    });
  }

  void bookSeatRight(int index) {
    setState(() {
      seatsRight[index].isBooked = !seatsRight[index].isBooked;
      if (seatsRight[index].isBooked) {
        selectedSeats.add(seatsRight[index]);
      } else {
        selectedSeats.remove(seatsRight[index]);
      }
      isButtonEnabled = selectedSeats.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> seatCounts = [3, 5, 5, 5, 5, 3];
    List<String> rowLabels = ['A', 'B', 'C', 'D', 'E', 'F'];

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: const Text("Choose Seat"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 150,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.imageUrl,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.eventType),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFEEDEC),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    widget.eventPrice,
                                    style: const TextStyle(
                                      color: Color(0xffF45D43),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.eventName,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 19.0, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                                Text(widget.eventLocation),
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
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                "Choose Seat",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width * 0.75, 60),
                  painter: MyPainter(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: List.generate(seatCounts.length, (rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: List.generate(seatCounts[rowIndex],
                                      (seatIndex) {
                                    int index = seatCounts
                                        .take(rowIndex)
                                        .fold(0, (sum, count) => sum + count) +
                                        seatIndex;
                                    return GestureDetector(
                                      onTap: () => bookSeat(index),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.5, vertical: 5.0),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: seats[index].isBooked
                                                ? const Color(0xffF45D43)
                                                : const Color(0xffE3E7EB),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: seats[index].isBooked
                                                ? Text(
                                                "${rowLabels[rowIndex]}${seats[index].number}")
                                                : const Text(""),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      children: List.generate(seatCounts.length, (rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: List.generate(seatCounts[rowIndex],
                                      (seatIndex) {
                                    int index = seatCounts
                                        .take(rowIndex)
                                        .fold(0, (sum, count) => sum + count) +
                                        seatIndex;
                                    return GestureDetector(
                                      onTap: () => bookSeatRight(index),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2.5, vertical: 5.0),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: seatsRight[index].isBooked
                                                ? const Color(0xffF45D43)
                                                : const Color(0xffE3E7EB),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: seatsRight[index].isBooked
                                                ? Text(
                                                "${rowLabels[rowIndex]}${seatsRight[index].number}")
                                                : const Text(""),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 18.0,
                    color: Color(0xffE3E7EB),
                  ),
                  SizedBox(width: 5.0),
                  Text("Available"),
                  SizedBox(width: 25.0),
                  Icon(
                    Icons.circle,
                    size: 18.0,
                    color: Color(0xffF45D43),
                  ),
                  SizedBox(width: 5.0),
                  Text("Selected"),
                ],
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        "Selected Seats",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    for (var seat in selectedSeats)
                      Text(
                        "${rowLabels[seat.row]}${seat.number},",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: isButtonEnabled
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TicketDetails(
                        imageUrl: widget.imageUrl,
                        eventName: widget.eventName,
                        eventLocation: widget.eventLocation,
                        eventTime: widget.eventTime,
                        eventPrice: widget.eventPrice,
                        eventType: widget.eventType,
                        seatsSelected: selectedSeats,
                      ),
                    ),
                  );
                }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? Colors.grey
                          : const Color(0xffF35D43);
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: const SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffF45D43)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
          size.width / 2, size.height * -0.3, size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
