import 'package:e_commerce_app/screens/search.dart';
import 'package:flutter/material.dart';
import '../services/search_product.dart';
import '../widgets/products_screens_body.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  static String id = 'ProductPage';
  @override
  Widget build(BuildContext context) {
    String productName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Text(
            productName,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SearchPage.id);
                },
                icon: const Icon(Icons.search)),
          ]),
      body: ProductsScreenBody(
          future: SearchProductServices()
              .SearchOnProduct(productName: productName)),
    );
  }
}
