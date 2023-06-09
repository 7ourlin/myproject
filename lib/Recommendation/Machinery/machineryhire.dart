import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: public_member_api_docs
class MachineryHirePage extends StatefulWidget {
  @override
  _MachineryHirePageState createState() => _MachineryHirePageState();
}

class _MachineryHirePageState extends State<MachineryHirePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    List<String> photos = [
      'assets/images/Machinery3.jpg',
      'assets/images/Machinery2.jpg',
    ];
    // final pages = List.generate(
    //   3,
    //   (index) => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(16),
    //       color: Colors.grey.shade300,
    //     ),
    //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    //     child: Container(
    //       height: 280,
    //       child: Center(
    //           child: Text(
    //         "Page $index",
    //         style: TextStyle(color: Colors.indigo),
    //       )),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemCount: photos.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        color: Colors.amber,
                        child: Image.asset(photos[index], fit: BoxFit.fill),
                      ),
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: photos.length,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  type: WormType.thinUnderground,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: Text(
                  'Worm',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
