import 'package:flutter/material.dart';

import 'menu_item.dart';

class CatalogFilter {
  final String title;
  final Function onPress;

  const CatalogFilter({this.title, this.onPress});
}

class Catalog extends StatefulWidget {
  final List<CatalogFilter> tabs;
  final Widget content;

  const Catalog({this.tabs, this.content, Key key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  int currentIndex = 0;

  List<Widget> getCatalogItems() {
    List<Widget> tabs = [];

    for (int i = 0; i < widget.tabs.length; i++) {
      tabs.add(MenuItem(
        name: widget.tabs[i].title + (i == currentIndex ? "-active" : ""),
        onPress: () {
          widget.tabs[i].onPress();
          currentIndex = i;
          setState(() {});
        },
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getCatalogItems(),
            ),
          ),
          Expanded(
            child: Container(
              child: widget.content,
            ),
          )
        ],
      ),
    );
  }
}
