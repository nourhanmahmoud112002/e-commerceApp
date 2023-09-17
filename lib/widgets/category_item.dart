import 'package:e_commerce_app/screens/products_of_category_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCategory extends StatelessWidget {
  ItemCategory({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductsOfCategoryPage.id,
                arguments: text);
          },
          child: Container(
            // color: kprimaryColor,
            height: 50,
            width: double.infinity,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 16, top: 8),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
