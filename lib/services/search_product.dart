// import 'dart:convert';

import '../models/product.dart';
import 'api.dart';
// import 'package:http/http.dart' as http;

class SearchProductServices {
  Future<List<Product>> SearchOnProduct({required String productName}) async {
    List<Product> products = [];
    products = await API()
        .get(url_APi: 'https://dummyjson.com/products/search?q=$productName');

    return products;
  }
}
