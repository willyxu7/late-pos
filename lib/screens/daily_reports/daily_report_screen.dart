import 'package:flutter/material.dart';
import 'package:late_pos/screens/daily_reports/daily_report_selected.dart';
import 'package:late_pos/screens/daily_reports/date_picker.dart';
import 'package:late_pos/widget/my_drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class DailyReportScreen extends StatefulWidget {
  const DailyReportScreen({Key key}) : super(key: key);

  @override
  _DailyReportScreenState createState() => _DailyReportScreenState();
}

class _DailyReportScreenState extends State<DailyReportScreen> {
  int _selectedDestination = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laporan Harian"),
      ),
      drawer: MyDrawer(selectedDestination: _selectedDestination,),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: DatePicker(),
          ),
          Expanded(
            flex: 2,
            child: DailyReportSelected(),
          )
        ],
      )
    );
  }
}
