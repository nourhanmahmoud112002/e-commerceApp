// import 'dart:convert';

import '../models/product.dart';
import 'api.dart';
// import 'package:http/http.dart' as http;

class AllProductServices {
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    products = await API().get(url_APi: 'https://dummyjson.com/products');

    return products;
  }
}
