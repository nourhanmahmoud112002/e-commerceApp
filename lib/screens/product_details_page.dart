import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/mycart_page.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({super.key});
  static String id = 'ProductDetailsPage';
  static int quantity = 1;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCartProvider>(context);
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          product.title,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.thumbnail),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price} EGP',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${product.discountPercentage}% OFF',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kprimaryColor),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Quantity : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ProductDetailsPage.quantity -= 1;
                        if (ProductDetailsPage.quantity <= 0) {
                          ProductDetailsPage.quantity = 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                    iconSize: 25,
                  ),
                  Text(
                    '${ProductDetailsPage.quantity}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ProductDetailsPage.quantity += 1;
                      });
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Description : ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.description,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onTap: () {
                    provider.addItem(product);

                    Navigator.pushNamed(context, MyCart.id, arguments: product);
                  },
                  text: 'Add To Cart')
            ],
          ),
        ),
      ),
    );
  }
}
