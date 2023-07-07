import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle:
      //       SystemUiOverlayStyle(statusBarColor: Colors.yellow[700]),
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.menu),
      //   ),
      //   title: Text(
      //     'N o t i f i c a t i o n',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 70,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "There is no notification yet",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
