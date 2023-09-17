import 'package:e_commerce_app/cubits/auth_cubit/cubit/auth_cubit.dart';
import 'package:e_commerce_app/screens/Login.dart';
import 'package:e_commerce_app/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage();
  static String id = 'SignUpPage';
  String? email, password, userName;
  GlobalKey<FormState> key_2 = GlobalKey();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, LoginPage.id, arguments: userName);
          isloading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMessege);
          isloading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            body: Form(
              key: key_2,
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assests/images/undraw_Sign_up_n6im.png',
                          height: 250,
                        ),
                        CustomTextField(
                          onChanged: (data) {
                            userName = data;
                          },
                          label: ' User Name',
                          icon: const Icon(
                            Icons.person,
                          ),
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
                              if (key_2.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).SignUpCubit(
                                    name: userName!,
                                    email: email!,
                                    password: password!);
                              }
                            },
                            text: 'Sign Up'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'already have an account ? ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Login',
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
