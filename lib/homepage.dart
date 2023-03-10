import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'MainPage.dart';
import 'components.dart';
import 'emotional_guidance.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//set background image and buttons
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/background_image.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'My Journey',
                ),
                // Components.pageTitleHeader('My Journey'),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      // Components.pageHeaderMenu(context, true),
                      const SizedBox(height: 25),
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
                                          const MainPage(pageIndex: 2)),
                                );
                              },
                              child: Image(
                                image: AssetImage(
                                    "lib/assets/emotional_guidance_button.png"),
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
                                image: AssetImage("lib/assets/journal_button.png"),
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
                                image: AssetImage("lib/assets/mood_chart_button.png"),
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
                                image: AssetImage("lib/assets/self_reflective_button.png"),
                                width: 180,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const MainPage(pageIndex: 10)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/positive_vibes_button.png"),
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
