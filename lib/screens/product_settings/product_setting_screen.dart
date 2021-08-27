import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:late_pos/models/category_model.dart';
import 'package:late_pos/repositories/category_repository_interface.dart';
import 'package:late_pos/repositories/impl/category_repository.dart';
import 'package:late_pos/screens/product_settings/widgets/categories.dart';
import 'package:late_pos/screens/product_settings/widgets/product_list.dart';
import 'package:late_pos/screens/product_settings/widgets/product_selected.dart';
import 'package:late_pos/repositories/impl/product_repository.dart';
import 'package:late_pos/repositories/product_repository_interface.dart';
import 'package:late_pos/screens/category_form_screen.dart';
import 'package:late_pos/widget/my_drawer.dart';
import 'package:late_pos/screens/product_settings/widgets/catalog.dart';

import '../../models/product_model.dart';

class ProductSettingScreen extends StatefulWidget {
  @override
  _ProductSettingScreenState createState() => _ProductSettingScreenState();
}

class _ProductSettingScreenState extends State<ProductSettingScreen> {
  final IProductRepository _productRepository = ProductRepository();
  final ICategoryRepository _categoryRepository = CategoryRepository();
  int _selectedDestination = 5;
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  Widget menuChild = Container();
  ProductModel selectedProduct;
  Widget appBarActionSelected;
  String appBarActionName;

  @override
  void initState() {
    super.initState();
    productOnPress();
  }

  void productOnPress() {
    setState(() {
      appBarActionName = "Tambah Barang";
      appBarActionSelected = ProductSelected();
      products = _productRepository.getAllProducts();

      menuChild = ProductList(
        products: products,
        onTap: (product) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductSelected(product: product)));
        },
      );
    });
  }

  void categoryOnPress() {
    appBarActionName = "Tambah Kategori";
    appBarActionSelected = CategoryFormScreen(
      categories: categories,
    );

    setState(() {
      menuChild = Categories(
        categories: categories,
        onTap: (category) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CategoryFormScreen(category: category,)));
        },
      );
    });
  }

  void stockOnPress() {
    setState(() {
      products = _productRepository.getAllProducts();

      menuChild = ProductList(
        products: products,
        onTap: (product) {
          setState(() {
            selectedProduct = product;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mengelola Barang"),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => appBarActionSelected))
                    .then((value) => setState(() {}));
              },
              child: Text(
                appBarActionName,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(selectedDestination: _selectedDestination),
      body: Container(
        child: Row(children: [
          Expanded(
            child: Catalog(
              tabs: [
                CatalogFilter(
                    title: "BARANG",
                    onPress: () {
                      productOnPress();
                    }),
                CatalogFilter(
                    title: "KATEGORI",
                    onPress: () {
                      categoryOnPress();
                    }),
                CatalogFilter(
                    title: "STOCK",
                    onPress: () {
                      stockOnPress();
                    }),
              ],
              content: Container(margin: EdgeInsets.all(10), child: menuChild),
            ),
          ),
        ]),
      ),
    );
  }
}
