import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
