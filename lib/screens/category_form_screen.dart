import 'package:flutter/material.dart';
import 'package:late_pos/models/category_model.dart';

class CategoryFormScreen extends StatefulWidget {
  final CategoryModel category;
  final List<CategoryModel> categories;

  const CategoryFormScreen({this.category, this.categories, Key key})
      : super(key: key);

  @override
  _CategoryFormScreenState createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _name.text = widget.category.name;
      _description.text = widget.category.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kategori"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(labelText: "Nama Kategori"),
                ),
                TextFormField(
                  controller: _description,
                  decoration: InputDecoration(labelText: "Deskripsi"),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.categories.add(CategoryModel(
                        name: _name.text, description: _description.text));
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Simpan"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
