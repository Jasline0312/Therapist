import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'package:therapist/MainPage.dart';

class AnxietyDefinitionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnxietyDefinitionPageState();
  }
}

class AnxietyDefinitionPageState extends State<AnxietyDefinitionPage> {

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(title: 'Understanding'),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 180),
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
                                          size: 60,// Set Button Size here
                                          color: Colors.white,
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(
                                            Colors.blueAccent
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
                                          size: 60,
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll(
                                                Colors.blueAccent
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
            height: 180, // set image size here
            width: MediaQuery.of(context).size.width /2,
          ),
        )
    );
  }
}
