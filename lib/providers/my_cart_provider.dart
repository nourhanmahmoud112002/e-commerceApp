import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/product_details_page.dart';
import 'package:flutter/material.dart';

import '../widgets/List_item_widget.dart';

class MyCartProvider extends ChangeNotifier {
  List<Product> _productList = [];
  int totalPrice = 0;
  List<Product> get productList => _productList;
  void addItem(Product product) {
    productList.add(product);
    totalPrice +=
        (product.price - product.discountPercentage * product.price).toInt() *
            ProductDetailsPage.quantity;
    notifyListeners();
  }

  bool isExist(Product product) {
    return _productList.contains(product);
  }

  void removeItem(int index, final listkey) {
    final removedItem = _productList[index];
    totalPrice -= (_productList[index].price -
                _productList[index].discountPercentage *
                    _productList[index].price)
            .toInt() *
        ProductDetailsPage.quantity;
    _productList.removeAt(index);
    listkey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
            product: removedItem, animation: animation, onclick: () {}));

    notifyListeners();
  }
}
