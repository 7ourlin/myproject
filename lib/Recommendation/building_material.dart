import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BuildingMaterialPage extends StatefulWidget {
  const BuildingMaterialPage({super.key});

  @override
  State<BuildingMaterialPage> createState() => _BuildingMaterialPageState();
}

class _BuildingMaterialPageState extends State<BuildingMaterialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Material'),
    );
  }
}
