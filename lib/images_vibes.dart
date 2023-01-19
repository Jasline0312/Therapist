import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'sadness_main.dart';
import 'package:therapist/MainPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesVibesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagesVibesPageState();
  }
}

class ImagesVibesPageState extends State<ImagesVibesPage> {

  int currentPos = 0;
  List<String> listPaths = [
    "lib/assets/background_image.png",
    "lib/assets/anger.png",
    "lib/assets/anger.png",
    "lib/assets/anger.png",
    "lib/assets/anger.png",
    "lib/assets/anger.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: listPaths.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      }
                  ),
                  itemBuilder: (BuildContext,context,index){
                    return MyImageView(listPaths[index]);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listPaths.map((url) {
                    int index = listPaths.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPos == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ]
          )
      ),
    );
  }
}

class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imgPath),
        )
    );
  }

}