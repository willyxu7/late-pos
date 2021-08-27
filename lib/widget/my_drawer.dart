import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:late_pos/screens/daily_reports/daily_report_screen.dart';
import 'package:late_pos/screens/product_settings/product_setting_screen.dart';
import 'package:late_pos/screens/orders/order_screen.dart';
import 'package:late_pos/screens/shifts/shift_screen.dart';
import 'package:late_pos/screens/transaction_histories/transaction_history_screen.dart';

class MyDrawer extends StatefulWidget {
  final int selectedDestination;

  const MyDrawer({Key key, this.selectedDestination}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "La Teras",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Order"),
                  selected: widget.selectedDestination == 0,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => OrderScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings_backup_restore_outlined),
                  title: Text("Riwayat Transaksi"),
                  selected: widget.selectedDestination == 1,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionHistoryScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text("Laporan Harian"),
                  selected: widget.selectedDestination == 2,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DailyReportScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.access_time_outlined),
                  title: Text("Shift"),
                  selected: widget.selectedDestination == 3,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ShiftScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people_alt),
                  title: Text("Ganti Operator"),
                  selected: widget.selectedDestination == 4,
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.coffee),
                  title: Text("Mengelola Barang"),
                  selected: widget.selectedDestination == 5,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductSettingScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Pengaturan"),
                  selected: widget.selectedDestination == 6,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
