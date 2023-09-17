import 'package:e_commerce_app/cubits/auth_cubit/cubit/auth_cubit.dart';
// import 'package:e_commerce_app/cubits/home_cubit/cubit/home_cubit.dart';
// import 'package:e_commerce_app/cubits/products_of_category_cubit/cubit/products_of_category_cubit.dart';
import 'package:e_commerce_app/cubits/search_cubit/cubit/search_cubit.dart';
import 'package:e_commerce_app/providers/favorites_provider.dart';
import 'package:e_commerce_app/providers/my_cart_provider.dart';
import 'package:e_commerce_app/screens/Login.dart';
import 'package:e_commerce_app/screens/home.dart';
import 'package:e_commerce_app/screens/mycart_page.dart';
import 'package:e_commerce_app/screens/navigation_bar.dart';
import 'package:e_commerce_app/screens/product_details_page.dart';
import 'package:e_commerce_app/screens/product_page.dart';
import 'package:e_commerce_app/screens/products_of_category_page.dart';
import 'package:e_commerce_app/screens/search.dart';
import 'package:e_commerce_app/screens/signUp.dart';
import 'package:e_commerce_app/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(E_CommerceApp());
}

class E_CommerceApp extends StatelessWidget {
  const E_CommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        // BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => MyCartProvider()),
        // BlocProvider(create: (context) => ProductsOfCategoryCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          SignUpPage.id: (context) => SignUpPage(),
          HomePage.id: (context) => HomePage(),
          SearchPage.id: (context) => SearchPage(),
          ProductsOfCategoryPage.id: (context) => ProductsOfCategoryPage(),
          ProductPage.id: (context) => ProductPage(),
          NavigationBarPage.id: (context) => NavigationBarPage(),
          ProductDetailsPage.id: (context) => ProductDetailsPage(),
          MyCart.id: (context) => MyCart(),
        },
        home: const SplashPage(),
      ),
    );
  }
}
