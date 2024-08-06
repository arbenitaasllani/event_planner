import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  @override
  _HorizontalCalendarState createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final ScrollController _scrollController = ScrollController();
  late DateTime _today;
  late int _middleIndex;
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _dates = _generateDatesForMonth(_today);
    _middleIndex = _dates.indexWhere((date) =>
    date.day == _today.day && date.month == _today.month && date.year == _today.year);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToMiddle();
    });
  }

  List<DateTime> _generateDatesForMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(daysInMonth, (index) => DateTime(date.year, date.month, index + 1));
  }

  void _scrollToMiddle() {
    final double middlePosition = (_middleIndex * 75.0) - (MediaQuery.of(context).size.width / 2) + 37.5;
    _scrollController.jumpTo(middlePosition);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Row(
        children: _dates.map((date) {
          final isToday = date.day == _today.day && date.month == _today.month && date.year == _today.year;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Container(
              width: 60.0,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isToday ? Color(0xffF45D43) : Color(0xffe9e9e9),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isToday ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  Text(
                    DateFormat.E().format(date),
                    style: TextStyle(
                      color: isToday ? Colors.white : Color(0xff676666),
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

