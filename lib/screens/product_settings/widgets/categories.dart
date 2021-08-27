import 'package:flutter/material.dart';
import 'package:late_pos/models/category_model.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> categories;
  final Function(CategoryModel) onTap;

  const Categories({@required this.categories, this.onTap, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
              title: Text(categories[index].name),
              subtitle: Text(categories[index].description),
              onTap: () {
                onTap(categories[index]);
              },
              trailing: Wrap(
                children: [
                  IconButton(icon: Icon(Icons.delete), onPressed: () {},),
                ],
              ),
          ));
        });
  }
}
