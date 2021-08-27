import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final String confirmButtonText;

  const ConfirmDialog({
    this.labelText,
    this.confirmButtonText,
    this.initialValue = "",
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          Container(
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: labelText),
                  initialValue: initialValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'CANCEL');
                          },
                          child: const Text("BATAL")),
                    ),
                    Container(
                      width: 30,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text(confirmButtonText)),
                    )
                  ],
                )
              ],
            )),
            width: 500,
            height: 200,
          )
        ],
      ),
    );
  }
}
