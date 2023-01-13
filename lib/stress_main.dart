import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class StressMainPage extends StatefulWidget {
  const StressMainPage ({Key? key}) : super(key: key);

  @override
  State<StressMainPage > createState() => _StressMainPageState();
}

//set background image and buttons
class _StressMainPageState extends State<StressMainPage> {

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
                Components.pageTitleHeader('Stress'),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Components.pageHeaderMenu(context, true),
                          SizedBox(height: 0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                  },
                                  child: Image(
                                    image: AssetImage(
                                        "lib/assets/understanding.png"),
                                    width: 180,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(
                                    "lib/assets/causes.png"),
                                width: 180,),
                              Image(
                                image: AssetImage(
                                    "lib/assets/solutions.png"),
                                width: 180,),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}