import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/providers/my_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../widgets/List_item_widget.dart';

class MyCart extends StatefulWidget {
  MyCart({super.key});
  static String id = 'MyCartPage';

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<Product> productList = [];

  final listkey = GlobalKey<AnimatedListState>();
  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCartProvider>(context);
    var product = ModalRoute.of(context)!.settings.arguments;
    //  totalPrice = (product.price - product.discountPercentage * product.price).toInt()*ProductDetailsPage.quantity;
    productList = provider.productList;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'My Cart',
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
        ),
        body: productList.length != 0
            ? Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Column(children: [
                  Expanded(
                    child: AnimatedList(
                        key: listkey,
                        initialItemCount: productList.length,
                        itemBuilder: (context, index, animation) =>
                            ListItemWidget(
                              product: productList[index],
                              animation: animation,
                              onclick: () =>
                                  provider.removeItem(index, listkey),
                            )),
                  ),
                  Text(
                    'Total Price : ${provider.totalPrice} EGP',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kprimaryColor),
                  ),
                ]),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assests/images/empty_cart.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Empty Cart .',
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ));
  }
}
