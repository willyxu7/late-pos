import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.now(),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
