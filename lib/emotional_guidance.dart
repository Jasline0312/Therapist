import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/custom_app_bar.dart';
import 'components.dart';
import 'sadness_main.dart';
import 'package:therapist/MainPage.dart';
import 'package:url_launcher/url_launcher.dart';

class EmotionalGuidancePage extends StatefulWidget {
  const EmotionalGuidancePage({Key? key}) : super(key: key);

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
                CustomAppBar(title: 'Emotional Guidance'),
                Expanded(
                  flex: 12,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      TextButton(
                        onPressed: () async{
                          final String url='https://maic.qld.gov.au/wp-content/uploads/2016/07/DASS-21.pdf';
                            await launch(
                                url);
                        },
                        child: const Text(
                          'SELF TEST HERE ',
                          style: TextStyle(fontSize: 15),
                        ),
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
                                          const MainPage(pageIndex: 3)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/sadness.png"),
                                width: 160,
                                height: 180,
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
                                          const MainPage(pageIndex: 4)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/fear.png"),
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
                                          const MainPage(pageIndex: 5)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/anger.png"),
                                width: 160,
                                height: 180,
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
                                          const MainPage(pageIndex: 6)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/depress.png"),
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
                                          const MainPage(pageIndex: 7)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/stress.png"),
                                width: 160,
                                height: 180,
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
                                          const MainPage(pageIndex: 8)),
                                );
                              },
                              child: Image(
                                image: AssetImage("lib/assets/anxiety.png"),
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
