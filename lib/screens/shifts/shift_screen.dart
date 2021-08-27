import 'package:flutter/material.dart';
import 'package:late_pos/models/shift_model.dart';
import 'package:late_pos/screens/shifts/widgets/shift_list.dart';
import 'package:late_pos/widget/confirm_dialog.dart';
import 'package:late_pos/widget/my_drawer.dart';
import 'package:late_pos/screens/shifts/widgets/shift_selected.dart';

class ShiftScreen extends StatefulWidget {
  const ShiftScreen({Key key}) : super(key: key);

  @override
  _ShiftScreenState createState() => _ShiftScreenState();
}

class _ShiftScreenState extends State<ShiftScreen> {
  int _selectedDestination = 3;
  List titles = ["Kasir", "Status", "Jam Mulai", "Jam Akhir"];
  List<ShiftModel> shifts = [
    ShiftModel(
        cashier: "Willy",
        status: "Tertutup",
        initialTime: "09.00",
        finalTime: "21.00",
        startDate: "1 Agustus 2021",
        endDate: "1 Agustus 2021",
        initialCash: 500000),
    ShiftModel(
        cashier: "Merry",
        status: "Tertutup",
        initialTime: "10.00",
        finalTime: "22.00",
        startDate: "2 Agustus 2021",
        endDate: "2 Agustus 2021",
        initialCash: 700000),
  ];

  ShiftModel _selectedShift;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedShift = shifts[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shift"),
        actions: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ConfirmDialog(
                        labelText: "KAS AWAL SHIFT",
                        confirmButtonText: "MULAI SHIFT",
                        initialValue: "0",
                      );
                    });
              },
              child: Text("BUKA SHIFT"))
        ],
      ),
      drawer: MyDrawer(
        selectedDestination: _selectedDestination,
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ShiftList(
                titles: titles,
                shifts: shifts,
                onTap: (content) {
                  _selectedShift = content;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: ShiftSelected(shift: _selectedShift),
            )
          ],
        ),
      ),
    );
  }
}
