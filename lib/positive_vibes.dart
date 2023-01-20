import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'sadness_main.dart';
import 'package:therapist/MainPage.dart';

class PositiveVibesPage extends StatefulWidget {
  const PositiveVibesPage({Key? key}) : super(key: key);

  @override
  State<PositiveVibesPage>createState() => _PositiveVibesPageState();
}

//set background image and buttons
class _PositiveVibesPageState extends State<PositiveVibesPage> {
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
                CustomAppBar(title: 'Positive Vibes'),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const MainPage(pageIndex: 11)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/images.png"),
                                width: 160,
                                height: 180,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Image(
                                image: AssetImage("lib/assets/quotes.png"),
                                width: 160,
                                height: 180,
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
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                    builder: (context) =>
                                const MainPage(pageIndex: 12)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/videos.png"),
                                width: 160,
                                height: 180,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Image(
                                image: AssetImage("lib/assets/music.png"),
                                width: 160,
                                height: 180,
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
