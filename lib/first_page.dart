import 'package:flutter/material.dart';

final imageList = [
  "assets/images/avenger_men.jpg",
  "assets/images/avenger_woman.jpg",
  "assets/images/black_widow.jpg",
  "assets/images/captain_marvel.jpg",
  "assets/images/scarlet_witch.jpg"];

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
    pageController = new PageController(initialPage: initialPage, keepPage: true, viewportFraction: 0.8);
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
          onPageChanged: onPageChanged,
          itemBuilder: (conext, index) {
        return itemBuilder(index);
      },
          controller: pageController,
      itemCount: 3)
    );
  }

  Widget itemBuilder(int index) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0,top: 40.0),
        height: 500.0,
        color: Colors.transparent,
      child: Material(elevation: 5.0, shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(imageList[index], fit: BoxFit.cover,)),
      ),),),
    );
  }

  onPageChanged(int index) {
    setState(() {
      print(index);
      currentPage = index;
    });
  }
}
