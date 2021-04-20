import 'package:apni_kaksha/item-model.dart';

class DummyDataSet {
  static List<ItemModel> _basmatiDataSet = [
    ItemModel(
      sellingPrice: 25,
      discountPer: 28,
      sellerShopName: "Supper Store Indrapuram",
      itemName: "Gold plus Basmati rice for healthy family",
      sellingUnitQuantity: 5,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice1.jpg',
    ),
    ItemModel(
      sellingPrice: 35,
      discountPer: 28,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 10,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice2.jpg',
    ),
    ItemModel(
      sellingPrice: 25,
      discountPer: 20,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 5,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice3.jpg',
    ),
    ItemModel(
      sellingPrice: 35,
      discountPer: 28,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 10,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice4.jpeg',
    ),
  ];

  static List<ItemModel> _kolamDataSet = [
    ItemModel(
      sellingPrice: 25,
      discountPer: 20,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 5,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice3.jpg',
    ),
    ItemModel(
      sellingPrice: 35,
      discountPer: 28,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 10,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice4.jpeg',
    ),
  ];

  static List<ItemModel> _others = [
    ItemModel(
      sellingPrice: 25,
      discountPer: 20,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 5,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice5.jpg',
    ),
    ItemModel(
      sellingPrice: 35,
      discountPer: 28,
      itemName: "Gold plus Basmati rice for healthy family",
      sellerShopName: "Supper Store Indrapuram",
      sellingUnitQuantity: 10,
      unit: Unit.KG,
      imageUrl: 'assets/Images/rice6.jpg',
    ),
  ];

  static List<List<ItemModel>> get getItemDAta {
    return [_basmatiDataSet, _kolamDataSet, _others];
  }
}
