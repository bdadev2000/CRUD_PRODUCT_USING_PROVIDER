import 'package:add_to_cart_v1/data/data.dart';
import 'package:add_to_cart_v1/models/ProductItem.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  final List<ProductItem> _items = productItems;
  List<ProductItem> get items => _items;

  void addProduct(ProductItem productItem){
    _items.add(productItem);
    notifyListeners();
  }

  void removeProduct(ProductItem productItem){
    _items.removeWhere((element) => productItem.id == element.id);
    notifyListeners();
  }

  void updateProduct(ProductItem productItem) {
    final index = _items.indexWhere((element) => productItem.id == element.id);
    _items[index] = productItem;
    notifyListeners();
  }
}