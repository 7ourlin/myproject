import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'P r o f i l e  ',
      //     style: GoogleFonts.abel(
      //         color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
      //   ),
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.yellow[700],
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 130, top: 30),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("assets/images/Me.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 70),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30,
                        color: Colors.yellow[700],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
                child: InkWell(
              onTap: () {},
              child: Container(
                child: const Text(
                  "Edit your profile✏️",
                  style: TextStyle(fontFamily: 'roboto', fontSize: 20),
                ),
              ),
            )),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 1),
              child: Column(
                children: [
                  const Card(
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      leading: Icon(Icons.account_circle),
                      title: Text(
                        "User Name: ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        "Bill Gates",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const Card(
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      leading: Icon(Icons.phone_in_talk_sharp),
                      title: Text(
                        "Contact:",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      subtitle: Text(
                        "2563718673",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      leading: Icon(Icons.mail),
                      title: Text(
                        "E-mail:",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "mail@gmail.com",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      style: ListTileStyle.drawer,
                      leading: Icon(Icons.home_work),
                      title: Text(
                        "Address:",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      subtitle: Text(
                        "Wangkhei Ayangpalli near Leima Keithel",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    // customBorder: BeveledRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    onTap: () {},
                    child: Container(
                      height: 37,
                      width: 137,
                      decoration: BoxDecoration(
                          color: Colors.cyanAccent[100],
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "VIEW ORDER HISTORY",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // ListView.builder(
                  //   itemCount: 3,
                  //   itemBuilder: (context, index) {
                  //     return const ListTile();
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
