import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'package:therapist/MainPage.dart';

class SadnessSolutionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SadnessSolutionsPageState();
  }
}

class SadnessSolutionsPageState extends State<SadnessSolutionsPage> {

  int currentPos = 0;
  List<String> listPaths = [
    "lib/assets/SolutionsSadness1.png",
    "lib/assets/SolutionsSadness2.png",
    "lib/assets/SolutionsSadness3.png",
    "lib/assets/SolutionsSadness4.png",
    "lib/assets/SolutionsSadness5.png",
    "lib/assets/SolutionsSadness6.png",
    "lib/assets/SolutionsSadness7.png",
    "lib/assets/SolutionsSadness8.png",
    "lib/assets/SolutionsSadness9.png",
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
                  CustomAppBar(title: 'Solutions'),
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
