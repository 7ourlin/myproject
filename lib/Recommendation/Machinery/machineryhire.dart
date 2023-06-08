import 'package:flutter/material.dart';

class MachineryHirePage extends StatefulWidget {
  const MachineryHirePage({super.key});

  @override
  State<MachineryHirePage> createState() => _MachineryHirePageState();
}

class _MachineryHirePageState extends State<MachineryHirePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Machinery'),
        ),
      ),
    );
  }
}
