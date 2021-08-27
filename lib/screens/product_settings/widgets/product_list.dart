import 'package:flutter/material.dart';
import 'package:late_pos/models/product_model.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onTap;

  ProductList({this.products, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.wine_bar),
            title: Text(products[index].name),
            subtitle: Text(
                "Harga: ${products[index].price}\nKategori: ${products[index].category}"),
            onTap: () {
              onTap(products[index]);
            },
          ),
        );
      },
    );
  }
}
