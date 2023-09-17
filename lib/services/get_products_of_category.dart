// import 'dart:convert';

// import 'package:http/http.dart' as http;

import '../models/product.dart';
import 'api.dart';

class AllProductsOfCategoryService {
  Future<List<Product>> getAllProductsOfCategory(
      {required String categoryName}) async {
    List<Product> products = [];
    products = await API()
        .get(url_APi: 'https://dummyjson.com/products/category/$categoryName');

    return products;
  }
}
