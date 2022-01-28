import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelicopterPage extends StatefulWidget {
  HelicopterPage({Key? key}) : super(key: key);

  @override
  State<HelicopterPage> createState() => _HelicopterPageState();
}

class _HelicopterPageState extends State<HelicopterPage> {
  List<dynamic> _helicopters = [
    {
      'color': Color(0xffE1E1E1),
      'image':
          'https://cdn.dribbble.com/users/418124/screenshots/16437257/media/7ce1d14ea65ad0fe0ba93434d6adc6a7.gif',
    },
    {
      'color': Color(0xffF4E9DB),
      'image':
          'https://cdn.dribbble.com/users/2258871/screenshots/14551105/media/0a08128d897a71bccd3198a0d1b77fea.gif',
    },
    {
      'color': Color(0xffFFC1C6),
      'image':
          'https://cdn.dribbble.com/users/418124/screenshots/6280170/lorisalessandria_lateformeeting_loop.gif',
    }
  ];

  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '@Raeldina',
          style: TextStyle(color: Colors.black),
        ),
      ),
     body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 250.0,
            aspectRatio: 4/3,
            // viewportFraction: 0.70,
            // enlargeCenterPage: true,
            pageSnapping: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          ),
          items: _helicopters.map((helicopter) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    // go to product view page with navigation push
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HelicopterView(
                          helicopter: helicopter,
                        ),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(0, 5)
                        )
                      ]
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Hero(
                            transitionOnUserGestures: true,
                            tag: helicopter['color'],
                            child: Container(
                              height: 250,
                              // margin: EdgeInsets.only(top: 15),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(helicopter['image'], fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList()
        ),
      ));
  }
}

class HelicopterView extends StatefulWidget {
  final dynamic helicopter;
  HelicopterView({Key? key, this.helicopter}) : super(key: key);

  @override
  State<HelicopterView> createState() => _HelicopterViewState();
}

class _HelicopterViewState extends State<HelicopterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.helicopter['color'],
      child: Hero(
        tag: widget.helicopter['color'],
         transitionOnUserGestures: true,
         child: Image.network(widget.helicopter['image']),
         ),
    );
  }
}
