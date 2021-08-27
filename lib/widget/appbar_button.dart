import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const AppBarButton({
    this.text,
    this.onPressed,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      style: TextButton.styleFrom(primary: Colors.white),
      onPressed: () {
        onPressed();
      },
    );
  }
}
