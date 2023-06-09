import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/Home/carousel.dart';
import 'package:myproject/Home/search.dart';
import 'package:myproject/Router/router.gr.dart';

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
  final user = FirebaseAuth.instance.currentUser;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.yellow[700],
            statusBarIconBrightness: Brightness.light),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        // ),

        title: Text(
          'C o n s t r u c T o u r',
          style: GoogleFonts.abel(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),

//Drawer in Dashboard
      drawer: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(00),
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(00),
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.yellow[700],
                      backgroundImage:
                          AssetImage("assets/images/Constructour.png"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("logged in as: ${user!.email!}"),
                  ],
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     signOut();
              //   },
              //   icon: const Icon(Icons.logout),
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Feedbacks",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "About",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
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
                  style: GoogleFonts.signikaNegative(
                      color: Colors.black, fontSize: 20),
                ),
              ),
              Column(
                children: [
                  SizedBox(
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
                                      ? Colors.amber
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
                            child: Carousel(),
                          ),
                        ),
                        SizedBox(
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
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                              child: Image.asset(
                                  "assets/images/Constructour.png")),
                        ),
                        Row(
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              context.router.push(MachineryHireRoute());
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Machinery1.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(height: 20),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              // context.router.push(),
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Machinery2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Machinery3.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        Row(
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Engineer1.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Engineer 1",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(height: 20),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Engineer2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Engineer 2",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Engineer3.jpeg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Engineer 3",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                          child: Card(
                              child: Image.asset(
                                  "assets/images/Constructour.png")),
                        ),
                        Row(
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Architect1.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Architect 1",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(height: 20),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Architect2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Architect 2",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Architect3.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Architect 3",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        Row(
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(height: 20),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 150,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/Excavator 2.jpg",
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 110,
                                  width: 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30.0, left: 5),
                                      child: Text(
                                        "Excavator",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
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
