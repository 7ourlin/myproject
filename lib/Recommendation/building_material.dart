import 'package:flutter/material.dart';

class BuildingMaterialPage extends StatefulWidget {
  const BuildingMaterialPage({super.key});

  @override
  State<BuildingMaterialPage> createState() => _BuildingMaterialPageState();
}

class _BuildingMaterialPageState extends State<BuildingMaterialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Material'),
    );
  }
}
