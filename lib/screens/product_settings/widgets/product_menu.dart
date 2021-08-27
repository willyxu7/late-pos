import 'package:flutter/material.dart';
import 'package:late_pos/screens/product_settings/widgets/menu_item.dart';

class ProductMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menu;

  ProductMenu({this.child, this.menu});

  @override
  _ProductMenuState createState() => _ProductMenuState();
}

class _ProductMenuState extends State<ProductMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: widget.menu,
          ),
          Container(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
