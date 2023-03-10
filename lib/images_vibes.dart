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
    "lib/assets/relaximage1.jpg",
    "lib/assets/relaximage2.jpg",
    "lib/assets/relaximage3.png",
    "lib/assets/relaximage4.jpg",
    "lib/assets/relaximage5.jpg",
    "lib/assets/relaximage6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/background_image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                CustomAppBar(title: 'Relaxing Images'),
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 180),
                          CarouselSlider.builder(
                            itemCount: listPaths.length,
                            options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.9,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentPos = index;
                                  });
                                }
                            ),
                            itemBuilder: (BuildContext,index,context){
                              return MyImageView(listPaths[index]);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listPaths.map((url) {
                              int index = listPaths.indexOf(url);
                              return Container(
                                width: 10.0,
                                height: 10.0,
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
              ],
            ),
          ),
        ),
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
