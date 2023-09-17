import 'package:e_commerce_app/screens/mycart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/cubit/auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 90),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assests/images/ui-profile-icon-vector.jpg',
                cacheHeight: 150,
                cacheWidth: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${BlocProvider.of<AuthCubit>(context).email_profile}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyCart.id);
                      },
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart)),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'My Cart',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.info)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Account Information',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.settings)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.language)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Language',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.support)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'App Support',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
