import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MachineryPage extends StatefulWidget {
  const MachineryPage({super.key});

  @override
  State<MachineryPage> createState() => _MachineryPageState();
}

class _MachineryPageState extends State<MachineryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Machinery'),
    );
  }
}
