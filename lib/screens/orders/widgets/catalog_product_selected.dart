import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:late_pos/models/product_model.dart';

class CatalogProductSelected extends StatefulWidget {
  final List<ProductModel> products;

  const CatalogProductSelected({this.products, Key key}) : super(key: key);

  @override
  _CatalogProductSelectedState createState() => _CatalogProductSelectedState();
}

class _CatalogProductSelectedState extends State<CatalogProductSelected> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 3,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: widget.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 4,
                child: Container(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.products[index].quantity--;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(widget.products[index].quantity.toString()),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.products[index].quantity++;
                                });
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((widget.products[index] == null)
                                ? ''
                                : widget.products[index].name),
                            Text((widget.products[index] == null)
                                ? ''
                                : widget.products[index].price)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                widget.products.removeWhere((product) =>
                                    product.id == widget.products[index].id);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: Ink(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: Text(
                        "SIMPAN",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    child: Ink(
                      padding: EdgeInsets.all(8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Items",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Subtotal: Rp ",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Text(
                              "Bayar",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ]),
      )
    ]);
  }
}
