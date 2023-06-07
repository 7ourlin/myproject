import 'package:flutter/material.dart';

Drawer cdrawer() {
  return Drawer(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(70),
        bottomRight: Radius.circular(70),
      ),
    ),
    child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Icon(Icons.home),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 99, 0, 0),
                child: Row(
                  children: [],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
  );
}
