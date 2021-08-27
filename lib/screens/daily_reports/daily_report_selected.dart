import 'package:flutter/material.dart';

class DailyReportSelected extends StatefulWidget {
  const DailyReportSelected({Key key}) : super(key: key);

  @override
  _DailyReportSelectedState createState() => _DailyReportSelectedState();
}

class _DailyReportSelectedState extends State<DailyReportSelected> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Wrap(
                  spacing: 16,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Barang")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Kategori"))
                  ],
                ),
              ),
              SizedBox(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Laporan Harian")))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.blue,
                child: Center(child: const Text("Barang", style: TextStyle(color: Colors.white),)),
              )),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.blue,
                child: Center(child: const Text("Jumlah", style: TextStyle(color: Colors.white),)),
              ))
            ],
          ),
        )
      ],
    );
  }
}
