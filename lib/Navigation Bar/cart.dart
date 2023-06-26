import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //Creating Storage in firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final storageRef = FirebaseStorage.instance.ref();

  final CollectionReference products =
      FirebaseFirestore.instance.collection("engineer");

  Future<void> createDocument() async {
    return await products
        .doc()
        .set(
          //un_comment out from down
          {
            "description": "4tgrsergt",
            "name": "Excavator",
            "price": "1500/hr",
            "image_url":
                "https://firebasestorage.googleapis.com/v0/b/constructour-92fa3.appspot.com/o/Excavator1.jpg?alt=media&token=7a31cf85-34b9-40f8-87f6-abb09132ff09&_gl=1*1308ljr*_ga*NzE4ODYyNzUuMTY4MjY3NTA3Nw..*_ga_CW55HF8NVT*MTY4NjY0MjY2MC4xNC4xLjE2ODY2NDgxMDcuMC4wLjA.",
          },
        )
        //up Upto there only
        //   {
        //     "description": "43tgerger",
        //     "name": "Tractor",
        //     "price": "2000",
        //     "image_url":
        //         "https://firebasestorage.googleapis.com/v0/b/constructour-92fa3.appspot.com/o/Tractor1.jpeg?alt=media&token=9036d750-20cc-47bd-b041-53c75ed61866&_gl=1*ambwbb*_ga*NzE4ODYyNzUuMTY4MjY3NTA3Nw..*_ga_CW55HF8NVT*MTY4NjY0MjY2MC4xNC4xLjE2ODY2NDgzNTIuMC4wLjA.",
        //   },
        // )
        //   {
        //     "description": "f4wt34t",
        //     "name": "Roller",
        //     "price": "3000",
        //     "image_url":
        //         "https://firebasestorage.googleapis.com/v0/b/constructour-92fa3.appspot.com/o/Roller_1.jpg?alt=media&token=0248c8a3-f8c8-4630-846b-410983fc329a&_gl=1*1bvjzhl*_ga*NzE4ODYyNzUuMTY4MjY3NTA3Nw..*_ga_CW55HF8NVT*MTY4NjY0MjY2MC4xNC4xLjE2ODY2NDgzODAuMC4wLjA.",
        //   },
        // )
        //un_comment out from down
        .then((value) => print("Product added"))
        .catchError((error) => print("Failed to add product: $error"));
  }
//up Upto there only

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 80),
              child: Icon(
                Icons.remove_shopping_cart,
                size: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 70),
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 30),
              ),
            ),
            //Use this button to update product

            // ElevatedButton(
            //     onPressed: () async {
            //       await createDocument();
            //     },
            //     child: const Text("Press Here")),
          ],
        ),
      ),
    );
  }
}
