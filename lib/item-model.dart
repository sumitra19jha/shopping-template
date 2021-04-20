import 'package:flutter/material.dart';

class ItemModel {
  final String itemId;
  final double sellingPrice;
  final double discountPer;
  final String itemName;
  final String sellerShopName;
  final String itemDescription;
  final int sellingUnitQuantity;
  final Unit unit;
  final String imageUrl;

  ItemModel({
    @required this.itemId,
    @required this.sellingPrice,
    @required this.discountPer,
    @required this.itemName,
    @required this.sellerShopName,
    this.itemDescription,
    @required this.sellingUnitQuantity,
    @required this.unit,
    this.imageUrl,
  });
}

enum Unit {
  KG,
  GRAM,
}
