import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';
import 'package:therapist/custom_app_bar.dart';
import 'package:therapist/MainPage.dart';

class SadnessMainPage extends StatefulWidget {
  const SadnessMainPage ({Key? key}) : super(key: key);

  @override
  State<SadnessMainPage > createState() => _SadnessMainPageState();
}

//set background image and buttons
class _SadnessMainPageState extends State<SadnessMainPage> {
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
                CustomAppBar(
                  title: 'Sadness',
                ),
                // Components.pageTitleHeader('My Journey'),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      // Components.pageHeaderMenu(context, true),
                      SizedBox(height: 80),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const MainPage(pageIndex: 9)),
                                );
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
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Image(
                                image: AssetImage("lib/assets/causes.png"),
                                width: 180,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Image(
                                image: AssetImage("lib/assets/solutions.png"),
                                width: 180,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
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