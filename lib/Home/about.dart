import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          "A b o u t  ",
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 111,
            color: Colors.grey[400],
            child: Center(
              child: CircleAvatar(
                foregroundColor: Colors.black,
                radius: 44,
                // backgroundColor: Colors.white,
                child: Image.asset("assets/images/Constructour.png"),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 530,
                width: 360,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "   About Constructour",
                      style: GoogleFonts.abel(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11.0, top: 5, right: 11),
                      child: Text(
                        " This app has been developed as a project for our flutter course completion with an aim to provide construction related services at the tip of your finger.",
                        style: TextStyle(fontSize: 19),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
