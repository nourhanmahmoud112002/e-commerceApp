import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategories() async {
    dynamic categories = [];
    try {
      Uri url = Uri.parse('https://dummyjson.com/products/categories');
      http.Response response = await http.get(url);
      dynamic data = jsonDecode(response.body);
      // print(response.body);
      for (int i = 0; i < data.length; i++) {
        categories.add(data[i]);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return categories;
  }
}
