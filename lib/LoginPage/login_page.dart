import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Router/router.gr.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool visibility = false;

  final _formKey = GlobalKey<FormState>();

  //sign user in method

  Future logUserIn() async {
    EasyLoading.show(status: 'Please wait');
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: usernameController.text,
            password: passwordController.text,
          )
          .whenComplete(
            () => EasyLoading.showSuccess("logged in"),
          );
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.code);
      // EasyLoading.showError("Check internet connection!");
    }
  }

//dispose textfield
  @override
  void dispose() {
    //TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     IconButton(
                  //       icon: const Icon(
                  //         CupertinoIcons.home,
                  //         color: Colors.brown,
                  //       ),
                  //       onPressed: () {
                  //         context.router.push(const DashboardRoute());
                  //       },
                  //       iconSize: 25,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 2,
                  ),
                  //logo
                  Image.asset(
                    "assets/images/Constructour.png",
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    "WELCOME BACK!",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 30,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //welcome back
                  Text(
                    "THERE YOU ARE ;)",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //username textfield
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: usernameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: "mail@example.com",
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          obscureText: !visibility,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: visibility
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility = !visibility;
                                      });
                                    },
                                    icon: const Icon(Icons.visibility_off,
                                        color: Colors.grey),
                                  ),
                            hintText: "password",
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),

                        //forgot password?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.router
                                    .push(const ForgotPasswordRoute());
                              },
                              child: const Text(
                                "Oink! Forgot Password?",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.red),
                              ),
                              // 'Forgot Password?',
                              // style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        // log in button
                        SizedBox(
                          height: 55,
                          width: 200,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.brown),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                logUserIn();
                              } else {
                                EasyLoading.showError(
                                    'Please fill in the form');
                              }
                            },
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // MyTextField(
                  //   controller: usernameController,
                  //   hintText: 'Username',
                  //   obscureText: false,
                  // ),

                  //password textfield

                  // MyTextField(
                  //   controller: passwordController,
                  //   hintText: 'Password',
                  //   obscureText: true,
                  // ),

                  const SizedBox(height: 10),

                  //or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  //google sign in button
                  GestureDetector(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Google.png",
                            height: 30,
                            width: 30,
                          ),
                          const Text(
                            " oogle",
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //not a member? register now

                  GestureDetector(
                    onTap: () {
                      context.router.push(const SigninRoute());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member?',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'REGISTER NOW',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
