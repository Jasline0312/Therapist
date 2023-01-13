import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class DepressMainPage extends StatefulWidget {
  const DepressMainPage ({Key? key}) : super(key: key);

  @override
  State<DepressMainPage > createState() => _DepressMainPageState();
}

//set background image and buttons
class _DepressMainPageState extends State<DepressMainPage> {

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
                Components.pageTitleHeader('Depress'),
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