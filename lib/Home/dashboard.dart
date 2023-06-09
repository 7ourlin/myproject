import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myproject/Home/search.dart';
import 'package:myproject/Navigation%20Bar/notification.dart';
import 'package:myproject/Router/router.gr.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final user = FirebaseAuth.instance.currentUser;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        backgroundColor: Colors.green[50],
        // appBarBuilder: (context, tabsRouter) {
        //   return AppBar(
        //     systemOverlayStyle:
        //         SystemUiOverlayStyle(statusBarColor: Colors.yellow[700]),
        //     title: Text(
        //       'C o n s t r u c T o u r',
        //       style: GoogleFonts.abel(
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 22),
        //     ),
        //     iconTheme: const IconThemeData(color: Colors.black),
        //     elevation: 0,
        //     centerTitle: true,
        //     backgroundColor: Colors.yellow[700],
        //     actions: [
        //       IconButton(
        //         onPressed: () {
        //           showSearch(
        //             context: context,
        //             delegate: MySearchDelegate(),
        //           );
        //         },
        //         icon: const Icon(Icons.search),
        //       )
        //     ],
        //   );
        // },
        //drawer

        // drawer: Padding(
        //   padding: const EdgeInsets.only(bottom: 100),
        //   child: Drawer(
        //     shape: const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(00),
        //         bottomRight: Radius.circular(70),
        //         bottomLeft: Radius.circular(00),
        //       ),
        //     ),
        //     child: ListView(
        //       children: [
        //         DrawerHeader(
        //           child: Column(
        //             children: [
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               CircleAvatar(
        //                 radius: 50,
        //                 backgroundColor: Colors.yellow[700],
        //                 backgroundImage:
        //                     AssetImage("assets/images/Constructour.png"),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text("logged in as: ${user!.email!}"),
        //             ],
        //           ),
        //         ),
        //         // IconButton(
        //         //   onPressed: () {
        //         //     signOut();
        //         //   },
        //         //   icon: const Icon(Icons.logout),
        //         // ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 50),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               SizedBox(
        //                 height: 30,
        //               ),
        //               Text(
        //                 "Feedbacks",
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.bold),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Text(
        //                 "About",
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.bold),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

//routes

        routes: const [
          HomeRoute(),
          NotificationRoute(),
          WishlistRoute(),
          CartRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
            ),
            height: 45,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GNav(
                color: Colors.grey,
                iconSize: 25,
                padding:
                    EdgeInsets.only(top: 9, bottom: 9, left: 20, right: 20),
                tabBackgroundColor: Colors.blue.withOpacity(0.1),
                activeColor: Colors.black,
                // tabBorderRadius: 2
                // tabActiveBorder: Border.all(),
                selectedIndex: tabsRouter.activeIndex,
                onTabChange: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                tabs: [
                  GButton(
                    icon: Icons.home,
                  ),
                  GButton(
                    icon: Icons.notifications,
                  ),
                  GButton(
                    icon: Icons.favorite,
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                  ),
                  GButton(
                    icon: Icons.person_rounded,
                  ),
                ],
              ),
            ),
          );
          //  CustomNavigationBar(
          //   currentIndex: tabsRouter.activeIndex,
          //   onTap: (index) {
          //     tabsRouter.setActiveIndex(index);
          //   },
          //   items: [
          //     CustomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //     ),
          //     CustomNavigationBarItem(
          //       icon: Icon(Icons.star_purple500),
          //     ),
          //     CustomNavigationBarItem(
          //       icon: Icon(Icons.trolley),
          //     ),
          //     CustomNavigationBarItem(
          //       icon: Icon(Icons.person),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
