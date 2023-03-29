import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'package:therapist/MainPage.dart';

class FearCausesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FearCausesPageState();
  }
}

class FearCausesPageState extends State<FearCausesPage> {

  int currentPos = 0;
  List<String> listPaths = [
    "lib/assets/CauseFear1.png",
    "lib/assets/CauseFear2.png",
    "lib/assets/CauseFear3.png",
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(title: 'Causes'),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height:0),
                        SizedBox(
                          child: Column(
                            children: [
                              MyImageView(listPaths[currentPos]),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      currentPos != 0 ? TextButton(
                                        child: const Icon(
                                          Icons.chevron_left,
                                          size: 30,// Set Button Size here
                                          color: Colors.white,
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(
                                              Color.fromRGBO(247,129,90,50),
                                            ),
                                            shape: MaterialStatePropertyAll(
                                                CircleBorder()
                                            )
                                        ),
                                        onPressed: (){
                                          if(currentPos != 0){
                                            setState(() {
                                              currentPos -= 1;
                                            });
                                          }
                                        },
                                      ) : Container(),
                                      currentPos < (listPaths.length - 1) ? TextButton(
                                        child: const Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(
                                              Color.fromRGBO(247,129,90,50),
                                            ),
                                            shape: MaterialStatePropertyAll(
                                                CircleBorder()
                                            )
                                        ),
                                        onPressed: (){
                                          if(currentPos < (listPaths.length - 1)){
                                            setState(() {
                                              currentPos += 1;
                                            });
                                          }
                                        },
                                      ) : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          child: Image.asset(
            imgPath,
            height: 550, // set image size here
            width: 350,
          ),
        )
    );
  }
}
