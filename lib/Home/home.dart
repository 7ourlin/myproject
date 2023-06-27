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
    "Explore🌟",
    "Machinery🏗️",
    "Engineer👷",
    "Architect🧑‍🎨",
    "Material🧱",
  ];

  int tabindex = 0;

  //
  final machineryStream =
      FirebaseFirestore.instance.collection('machinery').snapshots();

  final engineerStream =
      FirebaseFirestore.instance.collection('engineer').snapshots();

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
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Discover extraordinary creation...",
                  style: GoogleFonts.vollkorn(
                      color: Colors.brown[800],
                      fontSize: 34,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Our Recommendation',
                  style: GoogleFonts.signikaNegative(fontSize: 20),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
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
                                  borderRadius: BorderRadius.circular(16),
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
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  //((((((  Explore   )))))

                  if (tabindex == 0)
                    Column(
                      children: [
                        Container(
                          height: 230,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // //////////////////////////////////////////////
                          child: Container(
                            child: const Carousel(),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 111,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                height: 111,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
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
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
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
                                        context.router.push(MachineryHireRoute(
                                            data: doc[index]));
                                      },
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Material(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                child: Container(
                                                  color: Colors.transparent,
                                                  height: 140,
                                                  child: Row(
                                                    children: [
                                                      Image.network(
                                                        doc[index]["image_url"]
                                                            [0],
                                                        height: 100,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 110,
                                                        width: 1,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 30.0,
                                                                    left: 5),
                                                            child: Text(
                                                              doc[index]
                                                                  ["name"],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 8.0),
                                                            child: Text(
                                                              "By: Builders Co.",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 25.0),
                                                            child: Text(
                                                                "₹  ${doc[index]["price"]}",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
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
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                        StreamBuilder(
                          stream: engineerStream,
                          builder: (BuildContext,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
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
                                  return InkWell(
                                    splashColor: Colors.amber,
                                    onTap: () {
                                      // context.router
                                      //     .push(const MachineryHireRoute());
                                    },
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Material(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              child: Container(
                                                color: Colors.transparent,
                                                height: 140,
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      doc[index]["image_url"]
                                                          [0],
                                                      height: 100,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      height: 110,
                                                      width: 1,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 30.0,
                                                                  left: 5),
                                                          child: Text(
                                                            doc[index]["name"],
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            "By: Builders Co.",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 25.0),
                                                          child: Text(
                                                              "₹  ${doc[index]["price"]}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      ],
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
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
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
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Architect1.jpg",
                                  height: 100,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                const Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 30.0, left: 5),
                                      child: Text(
                                        "Architect 1",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "By: Builders Co.",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                const Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "By: Builders Co.",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
