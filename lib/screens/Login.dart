import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/cubits/auth_cubit/cubit/auth_cubit.dart';
import 'package:e_commerce_app/screens/navigation_bar.dart';
import 'package:e_commerce_app/screens/signUp.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage();
  static String id = 'LoginPage';
  String? email, password;
  GlobalKey<FormState> key_1 = GlobalKey();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    var userName = ModalRoute.of(context)!.settings.arguments;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, NavigationBarPage.id);
          isloading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessege);
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            body: Form(
              key: key_1,
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assests/images/Mobile login-rafiki.png',
                          height: 300,
                        ),
                        CustomTextField(
                            onChanged: (data) {
                              email = data;
                            },
                            label: ' Email',
                            icon: const Icon(
                              Icons.email,
                            )),
                        CustomTextField(
                          onChanged: (data) {
                            password = data;
                          },
                          label: ' Password',
                          icon: const Icon(
                            Icons.lock,
                          ),
                          obscureText: true,
                        ),
                        CustomButton(
                            onTap: () async {
                              if (key_1.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).LoginCubit(
                                    email: email!,
                                    password: password!,
                                    name: userName.toString());
                              }
                            },
                            text: 'Login'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'don\'t have an account ? ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, SignUpPage.id);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: kprimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
