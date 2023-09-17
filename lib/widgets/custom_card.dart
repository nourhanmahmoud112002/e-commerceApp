import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/providers/favorites_provider.dart';
import 'package:e_commerce_app/screens/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  Product product;

  // Function onTap;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsPage.id,
            arguments: widget.product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 240,
          width: 220,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10)),
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    '${widget.product.discountPercentage}% OFF',
                    style: TextStyle(
                        color: kprimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${widget.product.price}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () {
                            provider.toggleFavorites(widget.product);
                          },
                          icon: provider.isExist(widget.product)
                              ? Icon(
                                  Icons.favorite,
                                  color: kprimaryColor,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: -25,
          child: Image.network(
            widget.product.thumbnail,
            height: 110,
            width: 100,
          ),
        )
      ]),
    );
  }
}
