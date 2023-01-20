import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:therapist/MainPage.dart';
import 'package:therapist/login_page.dart';
import 'description_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MaterialApp(
        initialRoute: '/main',
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>const DescriptionScreen(),
          '/main' : (context) => const MainPage(),
          '/login' : (context) => const LoginPage(),
        },
      )
  );
}