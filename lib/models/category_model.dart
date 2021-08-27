import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  String name;
  String description;

  CategoryModel({this.id, @required this.name,
    this.description
  });
}