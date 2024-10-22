import 'package:flutter/material.dart';
class Item {
  final int id;
  final String name;
  final Color color;
  final int price;

  Item(this.id, this.name, {this.price = 42})
      : color = Colors.primaries[id % Colors.primaries.length];



  @override
  bool operator ==(Object other) {
    return other is Item && other.id == id;
  }
}