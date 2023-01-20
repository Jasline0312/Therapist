import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ConfirmExitDialog.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      color: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: 'Lucida',
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold))),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                ConfirmExitDialog.showConfirmExitDialog(context);
              },
              child: Image(
                image: AssetImage("lib/assets/quite_button.png"),
                height: 65,
                width: 65,
              ),
            ),
          )
        ],
      ),
    );
  }
}
