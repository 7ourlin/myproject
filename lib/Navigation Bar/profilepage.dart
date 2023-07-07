import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fs.collection("users").doc(user.email).get().then((value) {
      var d = value.data();
      // log(d.toString());   //Use this log to print data in console
      setState(() {
        data = d;
      });
    });
  }

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
        child: SingleChildScrollView(
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
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    backgroundColor: Colors.grey.shade300,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 0,
                            right: 25,
                            left: 25,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Center(
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                  prefixIcon: Icon(
                                    Icons.person_2,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                style: const TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  hintText: 'Address',
                                  prefixIcon: Icon(
                                    Icons.home,
                                    color: Colors.grey[500],
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextButton(
                                        style: ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            splashFactory: InkSparkle
                                                .constantTurbulenceSeedSplashFactory,
                                            overlayColor:
                                                MaterialStatePropertyAll(
                                                    Colors.grey.shade100)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                          ),
                                        )),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(colors: [
                                          Colors.tealAccent,
                                          Colors.deepPurple,
                                        ]),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(10, 10),
                                              blurRadius: 30,
                                              color: Colors.black
                                                  .withOpacity(0.15))
                                        ]),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          foregroundColor: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "Edit your profile✏️",
                  style: TextStyle(fontFamily: 'roboto', fontSize: 20),
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
                    Card(
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        leading: const Icon(Icons.account_circle),
                        title: const Text(
                          "User Name:  ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "${data?["name"]}",
                          style: const TextStyle(
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
                    Card(
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        leading: const Icon(Icons.mail),
                        title: const Text(
                          "E-mail:",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          "${data?["email"]}",
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        style: ListTileStyle.drawer,
                        leading: const Icon(Icons.home_work),
                        title: const Text(
                          "Address:",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "${data?["address"]}",
                          style: const TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 37,
                          width: 155,
                          decoration: BoxDecoration(
                              color: Colors.cyanAccent[100],
                              //border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: MaterialButton(
                            onPressed: () {},
                            child: const Text(
                              "VIEW ORDER HISTORY",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 37,
                          width: 111,
                          decoration: BoxDecoration(
                              color: Colors.cyanAccent[100],
                              //border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                " Get Help  :)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
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
      ),
    );
  }
}
