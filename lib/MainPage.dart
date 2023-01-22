import 'package:flutter/material.dart';
import 'package:therapist/DashboardPage.dart';
import 'package:therapist/anger_main.dart';
import 'package:therapist/depress_main.dart';
import 'package:therapist/homepage.dart';
import 'package:therapist/emotional_guidance.dart';
import 'sadness_main.dart';
import 'fear_main.dart';
import 'stress_main.dart';
import 'anxiety_main.dart';
import 'deep_breathing.dart';
import 'package:therapist/positive_vibes.dart';
import 'images_vibes.dart';
import 'package:therapist/DashboardPage.dart';
import 'positive_quotes.dart';
import 'anxiety_definition.dart';

class MainPage extends StatefulWidget {

  final int? pageIndex;

  const MainPage({Key? key, this.pageIndex}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  int showPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.pageIndex != null){
      showPageIndex = widget.pageIndex!;
    }else{
      showPageIndex = _currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList()[showPageIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) => const MainPage(pageIndex: 9)
            ),
          );
        },
        child: Icon (Icons.hourglass_bottom_outlined, size: 35),
        backgroundColor: Colors.white,
        foregroundColor: Color.fromRGBO(247,129,90,50),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Color.fromRGBO(247, 129, 90, 50),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          // Respond to item press.
          setState(() {
            _currentIndex = value;
            showPageIndex = _currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.person),
          ), // Add new page here also or else index out of bound error
        ],
      ),
    );
  }

  List<Widget> screenList(){
    return [
      HomePage(),
      DashboardPage(),
      EmotionalGuidancePage(),
      SadnessMainPage(),
      FearMainPage(),
      AngerMainPage(),
      DepressMainPage(),
      StressMainPage(),
      AnxietyMainPage(),
      CountDownTimer(),
      PositiveVibesPage(),
      ImagesVibesPage(),
      DashboardPage(),
      PositiveQuotes(),
      AnxietyDefinitionPage(),// Add new page here
    ];
  }
}
