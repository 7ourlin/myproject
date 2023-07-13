import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInformationPage extends StatefulWidget {
  const UserInformationPage({super.key});

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text("gehhjv"),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user.email)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
                if (snapshot.hasData) {
                  var d = snapshot.data?.data();
                  log(d.toString());

                  if (d == null) {
                    return const Text("data");
                  } else {
                    return Column(
                      children: [
                        Text("${d["name"]}"),
                        Text("${d["address"]}"),
                      ],
                    );
                  }
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
