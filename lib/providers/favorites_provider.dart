import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Product> _productsList = [];
  List<Product> get productsList => _productsList;
  bool isExist(Product product) {
    return _productsList.contains(product);
  }

  void toggleFavorites(Product product) {
    if (isExist(product)) {
      _productsList.remove(product);
    } else {
      _productsList.add(product);
    }
    notifyListeners();
  }
}
