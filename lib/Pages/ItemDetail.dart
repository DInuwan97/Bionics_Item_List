import 'package:flutter/material.dart';
import './../Models/Item.dart';
class ItemDetail extends StatelessWidget{

  final Item item;
  ItemDetail(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(item.itemName),
      ),
    );
  }
  
}