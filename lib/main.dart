import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:late_pos/screens/sale/sale_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  double displayWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return MaterialApp(home: SaleScreen());
  }
}
