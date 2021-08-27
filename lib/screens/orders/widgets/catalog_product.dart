import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:late_pos/models/product_model.dart';
import 'package:late_pos/screens/product_settings/widgets/menu_item.dart';

class CatalogProduct extends StatefulWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onTap;

  const CatalogProduct({this.products, this.onTap, Key key}) : super(key: key);

  @override
  _CatalogProductState createState() => _CatalogProductState();
}

class _CatalogProductState extends State<CatalogProduct> {
  List<Widget> getCatalogMenu() {
    List<Widget> tabs = [
      MenuItem(
        name: "Semua",
        onPress: () {},
      ),
    ];

    widget.products.forEach((product) {
      tabs.add(MenuItem(
        name: product.category,
        onPress: () {},
      ));
    });

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: getCatalogMenu(),
          ),
        ),
        Expanded(
          child: GridView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: widget.products.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: 4,
                      color: Colors.lightBlueAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 32,
                                  child: Center(
                                      child: Text(widget.products[index].name)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  onTap: () {
                    widget.onTap(widget.products[index]);
                  },
                );
              }),
        ),
      ],
    ));
  }
}
