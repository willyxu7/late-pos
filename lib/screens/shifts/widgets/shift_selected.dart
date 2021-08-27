import 'package:flutter/material.dart';
import 'package:late_pos/models/shift_model.dart';
import 'package:late_pos/screens/shifts/widgets/shift_selected_detail.dart';

class ShiftSelected extends StatefulWidget {
  final ShiftModel shift;

  const ShiftSelected({this.shift, Key key}) : super(key: key);

  @override
  _ShiftSelectedState createState() => _ShiftSelectedState();
}

class _ShiftSelectedState extends State<ShiftSelected> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              title: Text(
                "Kasir: ${widget.shift.cashier}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                  "Mulai: ${widget.shift.initialTime} - ${widget.shift.startDate} \nAkhir: ${widget.shift.finalTime} - ${widget.shift.endDate}"),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text("Print Rekap Shift"),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Container(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShiftSelectedDetail(
                      title: "Kas Awal",
                      detail: widget.shift.initialCash.toString()),
                  ShiftSelectedDetail(
                      title: "Penjualan (Tunai)", detail: "134000"),
                  ShiftSelectedDetail(
                    title: "Void (Tunai)",
                    detail: "0",
                    isRed: true,
                  ),
                  ShiftSelectedDetail(title: "Kas Masuk", detail: "0"),
                  ShiftSelectedDetail(
                    title: "Kas Keluar",
                    detail: "0",
                    isRed: true,
                  ),
                  Divider(color: Colors.grey),
                  ShiftSelectedDetail(title: "Penerimaan Sistem", detail: "0"),
                  Container(
                      margin: EdgeInsets.only(left: 20, bottom: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "(Kas Awal + Kas Masuk + Penjualan) - (Kas Keluar + Void)"),
                          ])),
                  ShiftSelectedDetail(title: "Penerimaan Aktual", detail: "0"),
                  Container(
                      margin: EdgeInsets.only(left: 20, bottom: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("(Kas Akhir)"),
                          ])),
                  ShiftSelectedDetail(title: "Selisih", detail: "0"),
                  Container(
                      margin: EdgeInsets.only(left: 20, bottom: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("(Penerimaan Aktual - Penerimaan Sistem)"),
                          ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
