import 'package:flutter/material.dart';
import 'package:late_pos/models/product_model.dart';
import 'package:late_pos/repositories/impl/product_repository.dart';
import 'package:late_pos/repositories/product_repository_interface.dart';
import 'package:late_pos/screens/sale/widgets/catalog_product.dart';
import 'package:late_pos/screens/sale/widgets/catalog_product_selected.dart';
import 'package:late_pos/screens/transaction_saved/transaction_saved_screen.dart';
import 'package:late_pos/widget/appbar_button.dart';
import 'package:late_pos/widget/my_drawer.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key key}) : super(key: key);

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final IProductRepository _productRepository = ProductRepository();
  int _selectedDestination = 0;
  List<ProductModel> _selectedProducts = [];
  List<ProductModel> _products = [];
  bool isLoading = true;

  void initData() async {
    _products = await _productRepository.getProducts();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarButton(
            text: "TRANSAKSI BARU",
            onPressed: () {
              print("transaksi baru");
            },
          ),
          AppBarButton(
            text: "DISKON",
            onPressed: () {
              print("diskon");
            },
          ),
          AppBarButton(
            text: "TERSIMPAN",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TransactionSavedScreen()));
            },
          )
        ],
      ),
      drawer: MyDrawer(
        selectedDestination: _selectedDestination,
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) : Container(
        child: Row(
          children: [
            Expanded(
              child: CatalogProduct(
                products: _products,
                onTap: (product) {
                  _selectedProducts.add(product);
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: CatalogProductSelected(products: _selectedProducts,),)
          ],
        ),
      ),
    );
  }
}
