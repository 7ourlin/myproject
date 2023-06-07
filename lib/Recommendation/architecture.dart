import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ArchitecturePage extends StatefulWidget {
  const ArchitecturePage({super.key});

  @override
  State<ArchitecturePage> createState() => _ArchitecturePageState();
}

class _ArchitecturePageState extends State<ArchitecturePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Architecture'),
    );
  }
}
