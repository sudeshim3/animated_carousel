import 'package:flutter/material.dart';

final imageList = [
  "assets/images/avenger_men.jpg",
  "assets/images/avenger_woman.jpg",
  "assets/images/black_widow.jpg",
  "assets/images/captain_marvel.jpg",
  "assets/images/scarlet_witch.jpg"
];

final colorList = [
  Colors.green,
  Colors.amber.shade50,
  Colors.lightBlue,
  Colors.deepOrangeAccent,
  Colors.teal
];

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  PageController pageController;
  var initialPage = 0;

  int currentPage;

  @override
  void initState() {
    super.initState();
    pageController = new PageController(
        initialPage: initialPage, keepPage: true, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: PageView.builder(
            pageSnapping: true,
            physics: BouncingScrollPhysics(),
            onPageChanged: onPageChanged,
            itemBuilder: (conext, index) {
              return itemBuilder(index);
            },
            controller: pageController,
            itemCount: 5));
  }

  Widget itemBuilder(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = index - pageController.page;
          value = (1 - value.abs()).clamp(0.0, 1.0);
          print("pagecontroller is  is ${value}");
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0, top: 40.0),
                height: 500.0 * Curves.easeIn.transform(value),
                color: Colors.transparent,
                child: child,
              ));
        } else {
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0, top: 40.0),
                height: 500.0 * Curves.easeIn.transform(index == 0 ? value : value * 0.5),
                color: Colors.transparent,
                child: child,
              ));
        }
//        if (index == 0) print("$index .. ${pageController.page}");

      },
      child: Material(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                imageList[index],
                fit: BoxFit.fitHeight,
              )),
        ),
      ),
    );
  }

  onPageChanged(int index) {
    setState(() {
      print(index);
      currentPage = index;
    });
  }
}
