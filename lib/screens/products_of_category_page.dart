// import 'package:e_commerce_app/cubits/products_of_category_cubit/cubit/products_of_category_cubit.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/search.dart';
import 'package:e_commerce_app/services/get_products_of_category.dart';
import 'package:e_commerce_app/widgets/products_screens_body.dart';
import 'package:flutter/material.dart';

class ProductsOfCategoryPage extends StatelessWidget {
  ProductsOfCategoryPage({super.key});
  String? categoryName;
  List<Product> products = [];
  static String id = 'ProductsOfCategoryPage';
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    categoryName = ModalRoute.of(context)!.settings.arguments as String;

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
              categoryName!,
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
          future: AllProductsOfCategoryService()
              .getAllProductsOfCategory(categoryName: categoryName!),
        ));
  }
}
