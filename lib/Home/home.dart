import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/Home/carousel.dart';

import '../Router/router.gr.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///List of recommendation
  List<String> recommendation = [
    "EXPLORE\n     🌟",
    "MACHINERY\n       🏗️",
    "ENGINEER\n      👷",
    "ARCHITECT\n       🧑‍🎨",
    "MATERIALS\n       🧱",
  ];

  int tabindex = 0;

  //
  final machineryStream =
      FirebaseFirestore.instance.collection('machinery').snapshots();

  final engineerStream =
      FirebaseFirestore.instance.collection('engineer').snapshots();

  final architectStream =
      FirebaseFirestore.instance.collection('architect').snapshots();

  final materialStream =
      FirebaseFirestore.instance.collection('material').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Drawer in Dashboard

      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 2, 57, 103), Colors.green],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Discover extraordinary creation...",
                        style: GoogleFonts.vollkorn(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Recommendation',
                            style: GoogleFonts.signikaNegative(
                                fontSize: 20,
                                color:
                                    const Color.fromARGB(255, 207, 228, 245)),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 63,
                          child: ListView.builder(
                            itemCount: recommendation.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                // width: 90,
                                margin: const EdgeInsets.all(3),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    side: MaterialStatePropertyAll(
                                      BorderSide(color: Colors.grey.shade300),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStatePropertyAll(
                                        tabindex == index
                                            ? Colors.grey
                                            : Colors.white), //ternaryOperator
                                  ),
                                  onPressed: () {
                                    tabindex = index;
                                    setState(() {});
                                  },
                                  child: Text(
                                    recommendation[index].toString(),
                                    style: GoogleFonts.signikaNegative(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Divider(),
                      ],
                    ),

                    //((((((  Explore   )))))

                    if (tabindex == 0)
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                  height: 400,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.teal,
                                        Colors.deepPurpleAccent
                                      ],
                                    ),
                                  ),
                                  // color: const Color.fromARGB(255, 97, 123, 95),
                                  child: const Carousel()),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 209),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        "assets/images/20_off.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      height: 150,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                          "assets/images/summer_offer.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    //(((((   Machinery   )))))

                    if (tabindex == 1)
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              "assets/images/Machinery.jpg",
                              // fit: BoxFit.fill
                            ),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text(
                                    "     Browse all",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          StreamBuilder(
                            stream: machineryStream,
                            builder: (BuildContext,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.hasData) {
                                List<Map<String, dynamic>> doc =
                                    snapshot.data!.docs.map((e) {
                                  log(e.toString());
                                  return e.data();
                                }).toList();
                                //return Text(snapshot.data.toString());
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: doc.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 3),
                                      child: InkWell(
                                        splashColor: Colors.amber,
                                        onTap: () {
                                          //use log to check data in terminal
                                          // log(doc[index].runtimeType.toString());
                                          context.router.push(
                                              DetailRoute(data: doc[index]));
                                        },
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Material(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 280,
                                                                    top: 70),
                                                            child: IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon: const Icon(
                                                                    Icons
                                                                        .favorite_border_outlined)),
                                                          ),
                                                          Container(
                                                            color: Colors
                                                                .transparent,
                                                            height: 140,
                                                            child: Row(
                                                              children: [
                                                                Image.network(
                                                                  doc[index][
                                                                      "image_url"][0],
                                                                  height: 100,
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  height: 110,
                                                                  width: 1,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              30.0,
                                                                          left:
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        doc[index]
                                                                            [
                                                                            "name"],
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    const Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        "By: Builders Co.",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              25.0),
                                                                      child: Text(
                                                                          "₹  ${doc[index]["price"]}",
                                                                          style:
                                                                              const TextStyle(color: Colors.black)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),

                          // const SizedBox(
                          //   height: 150,
                          //   width: 350,
                          // child: ElevatedButton(
                          //   style: const ButtonStyle(
                          //       backgroundColor:
                          //           MaterialStatePropertyAll(Colors.white)),
                          //   onPressed: () {
                          //     context.router.push(const MachineryHireRoute());
                          //   },
                          //   child: Row(
                          //     children: [
                          //       Image.asset(
                          //         "assets/images/Machinery1.jpg",
                          //         height: 100,
                          //       ),
                          //       const SizedBox(
                          //         width: 10,
                          //       ),
                          //       Container(
                          //         height: 110,
                          //         width: 1,
                          //         decoration: BoxDecoration(
                          //             color: Colors.grey,
                          //             borderRadius: BorderRadius.circular(20)),
                          //       ),
                          //       const Column(
                          //         children: [
                          //           Padding(
                          //             padding:
                          //                 EdgeInsets.only(top: 30.0, left: 5),
                          //             child: Text(
                          //               "Excavator",
                          //               style: TextStyle(color: Colors.black),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             height: 20,
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(left: 8.0),
                          //             child: Text(
                          //               "By: Builders Co.",
                          //               style: TextStyle(color: Colors.black),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(top: 25.0),
                          //             child: Text("₹ 123",
                          //                 style:
                          //                     TextStyle(color: Colors.black)),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // ),
                        ],
                      ),

                    //(((((   Engineer   )))))
                    if (tabindex == 2)
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Card(
                                child: Image.asset(
                                    "assets/images/Constructour.png")),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Center(
                                    child: Text(
                                  "     Browse all",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                          StreamBuilder(
                            stream: engineerStream,
                            builder: (BuildContext,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.hasData) {
                                List<Map<String, dynamic>> doc =
                                    snapshot.data!.docs.map((e) {
                                  log(e.toString());
                                  return e.data();
                                }).toList();
                                //return Text(snapshot.data.toString());
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: doc.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 3),
                                      child: InkWell(
                                        splashColor: Colors.amber,
                                        onTap: () {
                                          //use log to check data in terminal
                                          // log(doc[index].runtimeType.toString());
                                          context.router.push(
                                              DetailRoute(data: doc[index]));
                                        },
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Material(
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 280,
                                                                top: 70),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(Icons
                                                                .favorite_border_outlined)),
                                                      ),
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        height: 140,
                                                        child: Row(
                                                          children: [
                                                            Image.network(
                                                              doc[index][
                                                                  "image_url"][0],
                                                              height: 100,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              height: 110,
                                                              width: 1,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 30.0,
                                                                      left: 5),
                                                                  child: Text(
                                                                    doc[index][
                                                                        "name"],
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Text(
                                                                    "By: Builders Co.",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          25.0),
                                                                  child: Text(
                                                                      "₹  ${doc[index]["price"]}",
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          // SizedBox(
                          //   height: 150,
                          //   width: 350,
                          //   child: ElevatedButton(
                          //     style: const ButtonStyle(
                          //         backgroundColor:
                          //             MaterialStatePropertyAll(Colors.white)),
                          //     onPressed: () {},
                          //     child: Row(
                          //       children: [
                          //         Image.asset(
                          //           "assets/images/Engineer1.jpg",
                          //           height: 100,
                          //         ),
                          //         const SizedBox(
                          //           width: 10,
                          //         ),
                          //         Container(
                          //           height: 110,
                          //           width: 1,
                          //           decoration: BoxDecoration(
                          //               color: Colors.grey,
                          //               borderRadius: BorderRadius.circular(20)),
                          //         ),
                          //         const Column(
                          //           children: [
                          //             Padding(
                          //               padding:
                          //                   EdgeInsets.only(top: 30.0, left: 5),
                          //               child: Text(
                          //                 "Engineer 1",
                          //                 style: TextStyle(color: Colors.black),
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               height: 20,
                          //             ),
                          //             Padding(
                          //               padding: EdgeInsets.only(left: 8.0),
                          //               child: Text(
                          //                 "By: Builders Co.",
                          //                 style: TextStyle(color: Colors.black),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                        ],
                      ),

                    //(((((   Architect   )))))
                    if (tabindex == 3)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 130,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child:
                                  Image.asset("assets/images/Constructour.png"),
                            ),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Center(
                                    child: Text(
                                  "     Browse all",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                          StreamBuilder(
                            stream: architectStream,
                            builder: (BuildContext,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.hasData) {
                                List<Map<String, dynamic>> doc =
                                    snapshot.data!.docs.map((e) {
                                  log(e.toString());
                                  return e.data();
                                }).toList();
                                //return Text(snapshot.data.toString());
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: doc.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 3),
                                      child: InkWell(
                                        splashColor: Colors.amber,
                                        onTap: () {
                                          //use log to check data in terminal
                                          // log(doc[index].runtimeType.toString());
                                          context.router.push(
                                              DetailRoute(data: doc[index]));
                                        },
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Material(
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 280,
                                                                top: 70),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(Icons
                                                                .favorite_border_outlined)),
                                                      ),
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        height: 140,
                                                        child: Row(
                                                          children: [
                                                            Image.network(
                                                              doc[index][
                                                                  "image_url"][0],
                                                              height: 100,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              height: 110,
                                                              width: 1,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 30.0,
                                                                      left: 5),
                                                                  child: Text(
                                                                    doc[index][
                                                                        "name"],
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Text(
                                                                    "By: Builders Co.",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          25.0),
                                                                  child: Text(
                                                                      "₹  ${doc[index]["price"]}",
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    //(((((   Material   )))))

                    if (tabindex == 4)
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Card(
                                child: Image.asset(
                                    "assets/images/Constructour.png")),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Center(
                                    child: Text(
                                  "     Browse all",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                          StreamBuilder(
                            stream: materialStream,
                            builder: (BuildContext,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.hasData) {
                                List<Map<String, dynamic>> doc =
                                    snapshot.data!.docs.map((e) {
                                  log(e.toString());
                                  return e.data();
                                }).toList();
                                //return Text(snapshot.data.toString());
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: doc.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 3),
                                      child: InkWell(
                                        splashColor: Colors.amber,
                                        onTap: () {
                                          //use log to check data in terminal
                                          // log(doc[index].runtimeType.toString());
                                          context.router.push(
                                              DetailRoute(data: doc[index]));
                                        },
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Material(
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 280,
                                                                top: 70),
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(Icons
                                                                .favorite_border_outlined)),
                                                      ),
                                                      Container(
                                                        color:
                                                            Colors.transparent,
                                                        height: 140,
                                                        child: Row(
                                                          children: [
                                                            Image.network(
                                                              doc[index][
                                                                  "image_url"][0],
                                                              height: 100,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              height: 110,
                                                              width: 1,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 30.0,
                                                                      left: 5),
                                                                  child: Text(
                                                                    doc[index][
                                                                        "name"],
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              8.0),
                                                                  child: Text(
                                                                    "By: Builders Co.",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          25.0),
                                                                  child: Text(
                                                                      "₹  ${doc[index]["price"]}",
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                          //   SizedBox(
                          //     height: 150,
                          //     width: 350,
                          //     child: ElevatedButton(
                          //       style: const ButtonStyle(
                          //           backgroundColor:
                          //               MaterialStatePropertyAll(Colors.white)),
                          //       onPressed: () {},
                          //       child: Row(
                          //         children: [
                          //           Image.asset(
                          //             "assets/images/Excavator 2.jpg",
                          //             height: 100,
                          //           ),
                          //           const SizedBox(
                          //             width: 10,
                          //           ),
                          //           Container(
                          //             height: 110,
                          //             width: 1,
                          //             decoration: BoxDecoration(
                          //                 color: Colors.grey,
                          //                 borderRadius:
                          //                     BorderRadius.circular(20)),
                          //           ),
                          //           const Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               Padding(
                          //                 padding:
                          //                     EdgeInsets.only(top: 30.0, left: 5),
                          //                 child: Text(
                          //                   "AAC Bricks",
                          //                   style: TextStyle(
                          //                       color: Colors.black,
                          //                       fontSize: 17),
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: 15,
                          //               ),
                          //               Padding(
                          //                 padding: EdgeInsets.only(left: 5.0),
                          //                 child: Text(
                          //                   "By: Builders Co.",
                          //                   style:
                          //                       TextStyle(color: Colors.blueGrey),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          //   const SizedBox(height: 20),
                          //   Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 10.0, vertical: 3),
                          //     child: InkWell(
                          //       splashColor: Colors.amber,
                          //       onTap: () {},
                          //       child: Column(
                          //         children: [
                          //           Column(
                          //             children: [
                          //               Material(
                          //                 color: Colors.white.withOpacity(0.5),
                          //                 child: Container(
                          //                   color: Colors.transparent,
                          //                   height: 140,
                          //                   child: Row(
                          //                     children: [
                          //                       Image.asset(
                          //                         "assets/images/Excavator 2.jpg",
                          //                         height: 100,
                          //                       ),
                          //                       const SizedBox(
                          //                         width: 10,
                          //                       ),
                          //                       Container(
                          //                         height: 110,
                          //                         width: 1,
                          //                         decoration: BoxDecoration(
                          //                             color: Colors.black,
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     20)),
                          //                       ),
                          //                       const Column(
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Padding(
                          //                             padding: EdgeInsets.only(
                          //                                 top: 30.0, left: 5),
                          //                             child: Text(
                          //                               "Cement",
                          //                               style: TextStyle(
                          //                                   color: Colors.black,
                          //                                   fontSize: 17),
                          //                             ),
                          //                           ),
                          //                           SizedBox(
                          //                             height: 10,
                          //                           ),
                          //                           Padding(
                          //                             padding: EdgeInsets.only(
                          //                                 left: 5.0),
                          //                             child: Text(
                          //                               "By: Builders Co.",
                          //                               style: TextStyle(
                          //                                   color: Colors.black),
                          //                             ),
                          //                           ),
                          //                           Padding(
                          //                             padding: EdgeInsets.only(
                          //                                 top: 25.0, left: 11),
                          //                             child: Text("₹  1500/bag",
                          //                                 style: TextStyle(
                          //                                     color:
                          //                                         Colors.black)),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          //   const SizedBox(height: 20),
                          //   Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 10.0, vertical: 3),
                          //     child: InkWell(
                          //       splashColor: Colors.amber,
                          //       onTap: () {},
                          //       child: Column(
                          //         children: [
                          //           Column(
                          //             children: [
                          //               Material(
                          //                 color: Colors.white.withOpacity(0.5),
                          //                 child: Stack(
                          //                   children: [
                          //                     IconButton(
                          //                         padding: const EdgeInsets.only(
                          //                             left: 300),
                          //                         onPressed: () {},
                          //                         icon: const Icon(Icons
                          //                             .favorite_border_sharp)),
                          //                     Container(
                          //                       color: Colors.transparent,
                          //                       height: 140,
                          //                       child: Row(
                          //                         children: [
                          //                           Image.asset(
                          //                             "assets/images/Excavator 2.jpg",
                          //                             height: 100,
                          //                           ),
                          //                           const SizedBox(
                          //                             width: 10,
                          //                           ),
                          //                           Container(
                          //                             height: 110,
                          //                             width: 1,
                          //                             decoration: BoxDecoration(
                          //                                 color: Colors.black,
                          //                                 borderRadius:
                          //                                     BorderRadius
                          //                                         .circular(20)),
                          //                           ),
                          //                           const Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     EdgeInsets.only(
                          //                                         top: 30.0,
                          //                                         left: 5),
                          //                                 child: Text(
                          //                                   "50mm Iron Rod",
                          //                                   style: TextStyle(
                          //                                       color:
                          //                                           Colors.black,
                          //                                       fontSize: 17),
                          //                                 ),
                          //                               ),
                          //                               SizedBox(
                          //                                 height: 10,
                          //                               ),
                          //                               Padding(
                          //                                 padding:
                          //                                     EdgeInsets.only(
                          //                                         left: 5.0),
                          //                                 child: Text(
                          //                                   "By: Builders Co.",
                          //                                   style: TextStyle(
                          //                                       color:
                          //                                           Colors.black),
                          //                                 ),
                          //                               ),
                          //                               Padding(
                          //                                 padding:
                          //                                     EdgeInsets.only(
                          //                                         top: 25.0,
                          //                                         left: 11),
                          //                                 child: Text(
                          //                                     "₹  60,000/tonne",
                          //                                     style: TextStyle(
                          //                                         color: Colors
                          //                                             .black)),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
