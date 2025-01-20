// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:Mob_Project/signUp/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/colorsPallete.dart';
import '../../../core/shared_components.dart';
import '../../domain/entities/user.dart';
import '../cubit/login_cubit.dart';
import '../widgets/sharedcomponent_login.dart';
import '../../../core/dependency_injiction.dart' as di;

class Login extends StatelessWidget {
  Login({super.key});

  var loginFormKey = GlobalKey<FormState>();

  double sigmaX = 5; // from 0-10
  double sigmaY = 5; // from 0-10
  double opacity = 0.2;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: BlocProvider(
        create: (context) => di.s1<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: null,
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/login.jpg"),
                        fit: BoxFit.cover),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.45),
                          ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: sigmaX, sigmaY: sigmaY),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 0, 0, 1)
                                        .withOpacity(opacity),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: Text("Sign In",
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text("Enter Your Email and Password",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                    const SizedBox(height: 20),
                                    defaultFormField(
                                        controller: LoginCubit.get(context)
                                            .usernameController,
                                        type: TextInputType.emailAddress,
                                        ispassword: false,
                                        ontap: () {},
                                        textStyle: TextStyle(color: white),
                                        filled: true,
                                        fillColor:
                                            Colors.grey.withOpacity(0.25),
                                        labelText: "Email",
                                        labelStyle: const TextStyle(
                                            color: Color(0xFFFFFFFF)),
                                        hintStyle: const TextStyle(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        prefixicon:
                                            const Icon(Icons.email_outlined),
                                        prefixIconColor: white,
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'Email must not be empty';
                                          } else if (!RegExp(
                                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(value)) {
                                            return 'Unvalid Email Format';
                                          } else {
                                            return null;
                                          }
                                        }),
                                    const SizedBox(height: 10),
                                    defaultFormField(
                                        controller: LoginCubit.get(context)
                                            .passwordController,
                                        type: TextInputType.visiblePassword,
                                        ispassword:
                                            LoginCubit.get(context).isnotShown,
                                        ontap: () {},
                                        textStyle: TextStyle(color: white),
                                        filled: true,
                                        fillColor:
                                            Colors.grey.withOpacity(0.25),
                                        labelText: "Password",
                                        labelStyle: TextStyle(color: white),
                                        hintStyle: TextStyle(
                                          color: white,
                                        ),
                                        prefixicon: const Icon(Icons.lock),
                                        prefixIconColor: white,
                                        suffixicon:
                                            LoginCubit.get(context).isnotShown
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                        suffixPress: () {
                                          LoginCubit.get(context)
                                              .changeVisibility();
                                        },
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'Password must not be empty';
                                          } else {
                                            return null;
                                          }
                                        }),
                                    const SizedBox(height: 30),
                                    MyButton(onTap: () {
                                      if (loginFormKey.currentState!
                                          .validate()) {
                                        User user = User(
                                            email: LoginCubit.get(context)
                                                .usernameController
                                                .text,
                                            password: LoginCubit.get(context)
                                                .passwordController
                                                .text);
                                        di
                                            .s1<LoginCubit>()
                                            .logIn(user, context);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => MainHome()),
                                        // );
                                      }
                                    }),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                         context,
                                         MaterialPageRoute(builder: (context) => SignUp()),
                                         );
                                      },
                                      child: Text('Sign up'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
