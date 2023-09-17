import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class API {
  Future<List<Product>> get({required String url_APi}) async {
    List<Product> products = [];
    try {
      Uri url = Uri.parse(url_APi);
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data['products']);
      for (int i = 0; i < data['products'].length; i++) {
        products.add(Product.fromjson(data['products'][i]));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return products;
  }
}
