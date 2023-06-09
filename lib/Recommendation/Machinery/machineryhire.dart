import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: public_member_api_docs
class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    // List<String> photos = [
    //   'assets/images/Machinery3.jpg',
    //   'assets/images/Machinery2.jpg',
    // ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
      ),
      body: SafeArea(
        // child: Column(children: [
        //   StreamBuilder(
        //     stream:
        //         FirebaseFirestore.instance.collection('machinery').snapshots(),
        //     builder: (BuildContext,
        //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        //       if (snapshot.hasData) {
        //         List<Map<String, dynamic>> doc = snapshot.data!.map((e) {
        //           log(e.toString());
        //           return e.data();
        //         }).toList();
        //         return
        //       }
        //     },
        //   )
        // ]),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: controller,
                itemCount: widget.data['image_url'].length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      color: Colors.amber,
                      child: Image.network(widget.data['image_url'][index],
                          fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: widget.data['image_url'].length,
              effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                type: WormType.thinUnderground,
              ),
            ),
            const Divider(height: 10),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '    ${widget.data["description"]}',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Text(
                "Cost :    ₹ ${widget.data["price"]}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 50.0, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      height: 40,
                      width: 100,
                      child: const Center(child: Text("Add to wishlist")),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent,
                      ),
                      height: 40,
                      width: 100,
                      child: const Center(child: Text("Add to cart")),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
