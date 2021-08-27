import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_history_model.dart';
import 'package:late_pos/widget/confirm_dialog.dart';
import 'package:late_pos/widget/transaction_selected.dart';

class TransactionHistorySelected extends StatefulWidget {
  final TransactionHistoryModel transactionHistory;

  const TransactionHistorySelected({this.transactionHistory, Key key})
      : super(key: key);

  @override
  _TransactionHistorySelectedState createState() =>
      _TransactionHistorySelectedState();
}

class _TransactionHistorySelectedState
    extends State<TransactionHistorySelected> {
  @override
  Widget build(BuildContext context) {
    return TransactionSelected(transactionListModel: widget.transactionHistory,);
    // return Container(
    //   child: ListView(
    //     children: [
    //       Container(
    //           margin: EdgeInsets.all(10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text("INFORMASI TRANSAKSI"),
    //               ElevatedButton(
    //                 child: Text("Print Struk"),
    //                 onPressed: () {},
    //               ),
    //             ],
    //           )),
    //       Container(
    //           margin: EdgeInsets.all(10),
    //           child: Card(
    //             elevation: 5,
    //             child: Padding(
    //               padding: EdgeInsets.all(10),
    //               child: Column(children: [
    //                 Container(
    //                   child: Row(
    //                     children: [
    //                       Expanded(
    //                           child: Text(
    //                         "No Transaksi ${widget.transactionHistory.code}",
    //                         style: TextStyle(fontWeight: FontWeight.bold),
    //                       )),
    //                       Expanded(child: Text("PAX: 1")),
    //                       Expanded(child: Text("Customer: "))
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.only(top: 20),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [Text("PESANAN")],
    //                   ),
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.all(1),
    //                   padding: EdgeInsets.all(5),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [Text("1 Kopi Panas"), Text("5000")],
    //                   ),
    //                   decoration: BoxDecoration(color: Colors.lightBlueAccent),
    //                 ),
    //                 Container(
    //                   margin: EdgeInsets.all(1),
    //                   padding: EdgeInsets.all(5),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [Text("1 Kopi Susu Es"), Text("8000")],
    //                   ),
    //                   decoration: BoxDecoration(color: Colors.lightBlueAccent),
    //                 ),
    //               ]),
    //             ),
    //           )),
    //       Container(
    //         margin: EdgeInsets.all(10),
    //         child: Card(
    //           elevation: 5,
    //           child: Padding(
    //             padding: EdgeInsets.all(10),
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text("SUBTOTAL"),
    //                     Text("13000"),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text("TOTAL"),
    //                     Text("13000"),
    //                   ],
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text("TUNAI"),
    //                     Text("15000"),
    //                   ],
    //                 ),
    //                 Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    //                   ConstrainedBox(
    //                     child: ElevatedButton(
    //                         onPressed: () {
    //                           showDialog(
    //                               context: context,
    //                               builder: (BuildContext context) {
    //                                 return const ConfirmDialog(
    //                                   labelText: "NOTES",
    //                                   confirmButtonText: "BATALKAN",
    //                                 );
    //                               });
    //                         },
    //                         child: Text("BATALKAN")),
    //                     constraints:
    //                         BoxConstraints.tightFor(width: 150, height: 30),
    //                   )
    //                 ]),
    //               ],
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
