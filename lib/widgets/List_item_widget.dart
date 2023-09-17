import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  ListItemWidget(
      {super.key,
      required this.product,
      required this.animation,
      required this.onclick});
  Product product;
  final Animation<double> animation;
  final VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(product.thumbnail),
        ),
        title: Text(
          product.title,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        trailing: IconButton(
            onPressed: onclick,
            icon: Icon(
              Icons.delete,
              size: 32,
              color: kprimaryColor,
            )),
      ),
    );
  }
}
