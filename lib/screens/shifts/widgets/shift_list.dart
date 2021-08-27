import 'package:flutter/material.dart';
import 'package:late_pos/models/shift_model.dart';

class ShiftList extends StatelessWidget {
  final List titles;
  final List<ShiftModel> shifts;
  final Function(ShiftModel) onTap;

  const ShiftList({Key key, this.titles, this.shifts, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: shifts.length,
            itemBuilder: (content, index) {
              return Card(
                margin: EdgeInsets.all(5),
                elevation: 5,
                child: InkWell(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(color: Colors.grey),
                              child: Text(
                                shifts[index].startDate,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text(titles[0])),
                          Expanded(child: Text(titles[1])),
                          Expanded(child: Text(titles[2])),
                          Expanded(child: Text(titles[3])),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            shifts[index].cashier,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            shifts[index].status,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            shifts[index].initialTime,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            shifts[index].finalTime,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    onTap(shifts[index]);
                  },
                ),
              );
            }));
  }
}
