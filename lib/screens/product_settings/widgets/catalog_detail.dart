import 'package:flutter/material.dart';
import 'package:late_pos/models/product_model.dart';

class CatalogDetail extends StatefulWidget {
  final ProductModel product;

  const CatalogDetail({this.product, Key key}) : super(key: key);

  @override
  _CatalogDetailState createState() => _CatalogDetailState();
}

class _CatalogDetailState extends State<CatalogDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget.product == null)
          ? Text("Kosong")
          : Column(
              children: [
                Text(widget.product.name),
                Text(widget.product.price),
                Text(widget.product.category)
              ],
            ),
    );
  }
}
