import 'package:e_commerce_app/cubits/search_cubit/cubit/search_cubit.dart';
import 'package:e_commerce_app/screens/product_page.dart';
import 'package:e_commerce_app/widgets/category_item.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  static String id = 'SearchPage';
  dynamic categoriesName = [];
  String? productName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Search',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 65, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
                onSubmitted: (data) {
                  productName = data;
                  Navigator.pushNamed(context, ProductPage.id,
                      arguments: productName);
                },
                label: 'Search',
                icon: const Icon(Icons.search)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {
                if (state is SearchSuccess) {
                  categoriesName = state.categoriesName;
                }
              },
              builder: (context, state) {
                BlocProvider.of<SearchCubit>(context).getCategoriesName();
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: categoriesName.length,
                      itemBuilder: (context, index) {
                        return ItemCategory(
                          text: categoriesName[index],
                        );
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
