import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myproject/Home/search.dart';
import 'package:myproject/Router/router.gr.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final user = FirebaseAuth.instance.currentUser;

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        backgroundColor: Colors.green[50],
        appBarBuilder: (context, tabsRouter) {
          tabName() {
            int d = context.tabsRouter.activeIndex;
            switch (d) {
              case 0:
                return "H o m e";
              case 1:
                return "N o t i f i c a t i o n";
              case 2:
                return "W i s h l i s t";
              case 3:
                return "C a r t";
              case 4:
                return "P r o f i l e";
            }
          }

          return AppBar(
            title: Text(
              "${tabName()}",
              style: GoogleFonts.abel(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
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
          );
        },
        //drawer

        drawer: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Drawer(
            elevation: 11,
            backgroundColor:
                Theme.of(context).colorScheme.background.withOpacity(0.9),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.yellow[700],
                        backgroundImage:
                            const AssetImage("assets/images/Constructour.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Hello!    ${user!.email!}"),
                    ],
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     signOut();
                //   },
                //   icon: const Icon(Icons.logout),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton.icon(
                        label: const Text(
                          "Log Out",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 270, left: 30, right: 30, bottom: 270),
                                child: SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Are you sure to logout?",
                                                style: GoogleFonts.abel(
                                                    fontSize: 25),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Icon(Icons.logout)
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Cancel",
                                                  style:
                                                      TextStyle(fontSize: 21),
                                                )),
                                            const SizedBox(
                                              width: 90,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  signOut().whenComplete(
                                                    () {
                                                      Navigator.pop(context);
                                                    },
                                                  );
                                                  // context.router.push(
                                                  //     const MachineryHireRoute());
                                                },
                                                child: const Text(
                                                  "Confirm",
                                                  style:
                                                      TextStyle(fontSize: 21),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.logout_outlined),
                      ),
                      const Divider(),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                        label: const Text(
                          "Feedbacks",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        style: const ButtonStyle(),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 07,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          context.router.push(const AboutRoute());
                        },
                        icon: const Icon(Icons.lightbulb_outlined),
                        label: const Text(
                          "About Constructour",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

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
            decoration: const BoxDecoration(
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
                padding: const EdgeInsets.only(
                    top: 9, bottom: 9, left: 20, right: 20),
                tabBackgroundColor: Colors.blue.withOpacity(0.1),
                activeColor: Colors.black,
                // tabBorderRadius: 2
                // tabActiveBorder: Border.all(),
                selectedIndex: tabsRouter.activeIndex,
                onTabChange: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                tabs: const [
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
