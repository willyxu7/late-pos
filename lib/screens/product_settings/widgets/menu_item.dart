import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  String name;
  Function onPress;

  MenuItem({this.name, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
          // width: MediaQuery.of(context).size.width * 0.14,
          // height: MediaQuery.of(context).size.height * 0.070,
          child: ElevatedButton(
            onPressed: () {
              onPress();
            },
            child: Align(
              alignment: Alignment.center,
              child: Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          )),
    );
  }
}

