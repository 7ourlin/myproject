import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: PageView(
      //   children: [
      //     Container(
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       color: Colors.red,
      //     ),
      //     Container(
      //       color: Colors.green,
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 300),
              Text("Try to remember!!!"),
              Icon(Icons.emoji_emotions_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
