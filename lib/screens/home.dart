import 'package:e_commerce_app/screens/search.dart';
import 'package:e_commerce_app/services/get_all_products.dart';
import 'package:flutter/material.dart';
import '../widgets/products_screens_body.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Product>? products;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Discovery ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: const Icon(
                Icons.search,
              ),
              color: Colors.black,
            ),
          ]),
      body: ProductsScreenBody(
        future: AllProductServices().getAllProducts(),
      ),
    );
  }
}
