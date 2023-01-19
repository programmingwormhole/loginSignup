import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  List imageList = [
    {
      'id': 1,
      'path':
      'https://img.freepik.com/free-vector/sale-banner-with-product-description_1361-1333.jpg?w=2000'
    },
    {
      'id': 2,
      'path':
      'https://static.vecteezy.com/system/resources/thumbnails/006/795/097/small/sale-banner-or-poster-with-realistic-podium-in-orange-and-blue-color-business-illustration-free-vector.jpg'
    },
    {
      'id': 3,
      'path':
      'https://static.vecteezy.com/system/resources/previews/003/692/287/original/big-sale-discount-promotion-banner-template-with-blank-product-podium-scene-graphic-free-vector.jpg'
    },
  ];


  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: Text(
          'Slider And Bottom Bar',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: imageList
                    .map(
                      (e) => Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            e['path'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 95,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                              Colors.blueAccent.withOpacity(0.3)),
                          onPressed: () {},
                          child: Text('Shop Now'),
                        ),
                      ),
                    ],
                  ),
                )
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(autoPlay: true),
              ),
              // Positioned(
              //   right: 150,
              //   bottom: 30,
              //   child: CarouselIndicator(
              //     color: Colors.white.withOpacity(0.5),
              //     cornerRadius: 50,
              //     activeColor: Colors.red,
              //     count: imageList.length,
              //     index: currentIndex,
              //   ),
              // ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.add_circle_outline,
              size: 55,
              color: Colors.red,
            ),
            Icon(
              Icons.chat,
              color: Colors.black,
              size: 30,
            ),
            Icon(
              Icons.supervised_user_circle_sharp,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
