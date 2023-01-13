import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/MainPage.dart';
import 'homepage.dart';

// set description screen with buttons
class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen ({Key? key}) : super(key: key);

  @override
  State<DescriptionScreen > createState() => _DescriptionScreen ();
}

class _DescriptionScreen  extends State<DescriptionScreen > {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox.expand(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/splash_screen1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
                children: [
                  SizedBox(height: 650),
                  GestureDetector(
                    onTap: () {
                      Navigator.push((context), MaterialPageRoute(
                          builder: (context) => const welcomeScreen()),
                      );
                    },
                    child: Image(
                      image: AssetImage("lib/assets/next_button.png"),
                      width: 200,
                    ),
                  ),
                ]
            )
        ),
      ),
        ),
    );
  }
}

  class welcomeScreen extends StatelessWidget {
    const welcomeScreen ({super.key});
    Widget build (BuildContext context){
      return SafeArea(
          child: Scaffold(
        body: SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/splash_screen2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column (
                  children:[
                    SizedBox(height: 650),
                    GestureDetector(
                      onTap: (){
                        Navigator.push((context), MaterialPageRoute(
                            builder: (context) => const welcomeScreen2()),
                        );
                      },
                      child: Image(
                        image: AssetImage("lib/assets/next_button.png"),
                        width: 200,
                      ),
                    ),
                  ]
              )
          ),
        ),
          ),
      );
  }
}

class welcomeScreen2 extends StatelessWidget {
  const welcomeScreen2 ({super.key});
  Widget build (BuildContext context){
    return SafeArea(
        child: Scaffold(
          body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/splash_screen3.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column (
                children:[
                  SizedBox(height: 650),
                  GestureDetector(
                    onTap: (){
                      Navigator.push((context), MaterialPageRoute(
                          builder: (context) => const MainPage()),
                      );
                    },
                    child: Image(
                      image: AssetImage("lib/assets/getstarted_button.png"),
                      width: 200,
                    ),
                  ),
                ]
            )
        ),
      ),
        ),
    );
  }
}