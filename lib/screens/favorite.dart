import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);
    List<Product> productsList = provider.productsList;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Favorites',
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
        body: productsList.length != 0
            ? Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
                child: GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 70,
                    ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      // BlocProvider.of<HomeCubit>(context).displayProductsHome();
                      return CustomCard(
                        product: productsList[index],
                      );
                    }),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assests/images/Loving_it.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'No Favorites yet .',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ));
  }
}
