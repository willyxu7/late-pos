import 'package:flutter/material.dart';

class ShiftSelectedDetail extends StatelessWidget {
  final String title;
  final String detail;
  final bool isRed;

  const ShiftSelectedDetail({this.title, this.detail, this.isRed = false, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            detail,
            style: isRed
                ? TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 16)
                : TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}