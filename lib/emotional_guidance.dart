import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';
import 'sadness_main.dart';
import 'package:therapist/MainPage.dart';

class EmotionalGuidancePage extends StatefulWidget {
  const EmotionalGuidancePage ({Key? key}) : super(key: key);

  @override
  State<EmotionalGuidancePage> createState() => _EmotionalGuidancePageState();
}

//set background image and buttons
class _EmotionalGuidancePageState extends State<EmotionalGuidancePage> {

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
                Components.pageTitleHeader('Emotional Guidance'),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Components.pageHeaderMenu(context, true),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'SELF TEST HERE ',
                              style: TextStyle(fontSize: 15),
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(pageIndex: 3)
                                      ),
                                    );
                                    },
                                    child: Image(
                                        image: AssetImage(
                                        "lib/assets/sadness.png"
                                    ),
                                    width: 160,
                                      height: 160,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(pageIndex: 4)
                                      ),
                                    );
                                  },
                                child: Image(
                                  image: AssetImage(
                                    "lib/assets/fear.png"
                                ),
                                  width: 160,
                                  height: 160,
                                ),
                              ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(pageIndex: 5)
                                      ),
                                    );
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          "lib/assets/anger.png"
                                      ),
                                      width: 160,
                                    height: 160,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(pageIndex: 6)
                                      ),
                                    );
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          "lib/assets/depress.png"
                                      ),
                                      width: 160,
                                    height: 160,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(pageIndex: 7)
                                      ),
                                    );
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          "lib/assets/stress.png"
                                      ),
                                      width: 160,
                                    height: 160,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(pageIndex: 8)
                                      ),
                                    );
                                  },
                                  child: Image(
                                      image: AssetImage(
                                          "lib/assets/anxiety.png"
                                      ),
                                      width: 160,
                                    height: 160,
                                  ),
                                ),
                              ),
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