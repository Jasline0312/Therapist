import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'package:therapist/MainPage.dart';

class AnxietyCausesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnxietyCausesPageState();
  }
}

class AnxietyCausesPageState extends State<AnxietyCausesPage> {

  int currentPos = 0;
  List<String> listPaths = [
    "lib/assets/CausesAnxiety1.png",
    "lib/assets/CausesAnxiety2.png",
    "lib/assets/CausesAnxiety3.png",
    "lib/assets/CausesAnxiety4.png",
    "lib/assets/CausesAnxiety5.png",
    "lib/assets/CausesAnxiety6.png",
    "lib/assets/CausesAnxiety7.png",
    "lib/assets/CausesAnxiety8.png",
    "lib/assets/CausesAnxiety9.png",
    "lib/assets/CausesAnxiety10.png",
    "lib/assets/CausesAnxiety11.png",
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
