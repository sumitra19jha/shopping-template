import 'package:apni_kaksha/Models/item-model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get getCartItemList {
    return _cartItems;
  }

  int getItemQuantity(String id) {
    int index = _cartItems.indexWhere(
      (element) => element.item.itemId == id,
    );

    if (index == -1) {
      return 0;
    }

    return _cartItems[index].quantity;
  }

  void addItem(ItemModel item) {
    int index = _cartItems.indexWhere(
      (element) => element.item.itemId == item.itemId,
    );

    if (index == -1) {
      _cartItems.add(CartItem(item, 1));
    } else {
      _cartItems[index] = CartItem(
        item,
        _cartItems[index].quantity + 1,
      );
    }

    notifyListeners();
  }

  void removeItem(ItemModel item) {
    int index = _cartItems.indexWhere(
      (element) => element.item.itemId == item.itemId,
    );

    if (index != -1) {
      int quant = _cartItems[index].quantity;
      if (quant == 1) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index] = CartItem(
          item,
          _cartItems[index].quantity - 1,
        );
      }
      notifyListeners();
    }
  }
}

class CartItem {
  final ItemModel item;
  final int quantity;

  CartItem(this.item, this.quantity);
}
