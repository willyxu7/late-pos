import 'package:flutter/material.dart';
import 'package:late_pos/models/category_model.dart';
import 'package:late_pos/models/product_model.dart';
import 'package:late_pos/repositories/category_repository_interface.dart';
import 'package:late_pos/repositories/impl/category_repository.dart';

class ProductSelected extends StatefulWidget {
  final ProductModel product;

  const ProductSelected({Key key, this.product}) : super(key: key);

  @override
  _ProductSelectedState createState() => _ProductSelectedState();
}

class _ProductSelectedState extends State<ProductSelected> {
  final ICategoryRepository _categoryRepository = CategoryRepository();
  String _category;
  List<CategoryModel> categories = [];
  List<Variant> variants = [];
  bool isLoading = true;
  int id = 1;
  final TextEditingController _nameController = TextEditingController();

  void initData() async {
    categories = await _categoryRepository.getCategories();
      setState(() {});


    _categoryRepository.getCategories()
        .then((value) {
      categories = value;
      isLoading = false;
      setState(() {});
    });


  }

  @override
  void initState() {
    super.initState();
    initData();

    if (widget.product != null) {
      _nameController.text = widget.product.name;
      _category = widget.product.category;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Barang"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Nama Barang",
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Deskripsi",
                      ),
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(labelText: "Kategori"),
                        value: _category,
                        items: categories.map((category) {
                          return DropdownMenuItem(
                            child: Text(category.name),
                            value: category.name,
                          );
                        }).toList(),
                        onChanged: (category) {
                          setState(() {
                            _category = category;
                          });
                        }),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        "Variant",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: TextFormField(
                                    controller:
                                        TextEditingController(text: "default"),
                                    decoration: InputDecoration(
                                      labelText: "Nama Variant",
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: TextEditingController(
                                        text: 0.toString()),
                                    decoration: InputDecoration(
                                      labelText: "Harga",
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "SKU",
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Deskripsi",
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                )
                              ],
                            ),
                          ),
                          for (Variant variant in variants)
                            Container(
                              child: variant,
                            ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                          variants.add(Variant(
                            id: id,
                            onTap: (id) {
                              variants.removeWhere((variant) => variant.id == id);
                              setState(() {});
                            }
                          ));
                          id++;
                        },
                        child: Text("Tambah Variant")),
                    Center(
                        child: Container(
                      width: 700,
                      child: ElevatedButton(
                        child: Text("Simpan"),
                        onPressed: () {},
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Variant extends StatelessWidget {
  final int id;
  final Function onTap;

  const Variant({this.id, this.onTap, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Nama Variant",
            ),
          ),
        ),
        Container(
          width: 20,
        ),
        Flexible(
          flex: 1,
          child: TextFormField(
            controller: TextEditingController(text: 0.toString()),
            decoration: InputDecoration(
              labelText: "Harga",
            ),
          ),
        ),
        Container(
          width: 20,
        ),
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "SKU",
            ),
          ),
        ),
        Container(
          width: 20,
        ),
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Deskripsi",
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              onTap(id);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ))
      ],
    );
  }
}
