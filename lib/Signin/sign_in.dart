import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Router/router.gr.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  //text editing controllers
  final profileNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  bool visibility1 = false;

  bool visibility2 = false;

  final _formKey = GlobalKey<FormState>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // CollectionReference users = FirebaseFirestore.instance.collection('users');

//  final CollectionReference<Map<String, dynamic>> collectionReference =
//     FirebaseFirestore.instance.collection('user');

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void addUser() async {
    var data = {
      "name": profileNameController.text,
      "contact": "empty",
      "email": emailController.text,
      "address": "empty",
    };
    try {
      log(data.toString());
      await firestore
          .collection('users')
          .doc(emailController.text)
          .set(data)
          .whenComplete(() {
        EasyLoading.showSuccess("Account Created");
        Navigator.pop(context);
        EasyLoading.dismiss();
      });
    } catch (e) {
      EasyLoading.showError("error");
    }
  }

  //sign user in method
  Future signUserIn() async {
    if (passwordConfirmed()) {
      EasyLoading.show(status: "Please wait. . .");
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .whenComplete(() {
          addUser();
        });
      } on FirebaseAuthException catch (e) {
        EasyLoading.showError(e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  //logo
                  const Icon(
                    Icons.person_add_alt,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //welcome back
                  Text(
                    "Make your account here :)",
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
                          controller: profileNameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: "User Name",
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        //email textfield
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            hintText: "name@example.com",
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
                          obscureText: !visibility1,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: visibility1
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility1 = !visibility1;
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
                                        visibility1 = !visibility1;
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
                        const SizedBox(height: 20),

                        //confirm password
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          obscureText: !visibility2,
                          controller: confirmpasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: visibility2
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visibility2 = !visibility2;
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
                                        visibility2 = !visibility2;
                                      });
                                    },
                                    icon: const Icon(Icons.visibility_off,
                                        color: Colors.grey),
                                  ),
                            hintText: "confirm password",
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const SizedBox(
                          height: 10,
                        ),

                        // sign in button
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.brown)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                signUserIn();
                              } else {
                                EasyLoading.showError(
                                    'Please fill in the form');
                              }
                            },
                            child: const Text(
                              'CREATE ACCOUNT',
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

                  const SizedBox(height: 20),

                  //google+apple sign in button
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
                            "  Google Account",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  //not a member? register now

                  GestureDetector(
                    onTap: () {
                      context.router.push(
                        const AuthflowRoute(),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
