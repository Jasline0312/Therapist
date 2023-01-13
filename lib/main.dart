import 'package:flutter/material.dart';
import 'package:therapist/MainPage.dart';
import 'description_screen.dart';


void main() async {
  runApp(
      MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>DescriptionScreen(),
        },
      )
  );
}