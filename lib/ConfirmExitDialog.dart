import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components.dart';

//pop up exit dialog with yes no option
class ConfirmExitDialog{

  static Future<void> showConfirmExitDialog(BuildContext context){
    return Components.scaleAnimatedDialog(
      context,
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          width: 250,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/exit_dialog.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    HapticFeedback.lightImpact();
                    if(Platform.isAndroid){
                      SystemNavigator.pop();
                    }else{
                      exit(0);
                    }
                  },
                  child: Image(
                    image: AssetImage("lib/assets/yes_button.png"),
                    width: 120,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: (){
                    HapticFeedback.lightImpact();
                    Navigator.of(context).pop();
                  },
                  child: Image(
                    image: AssetImage("lib/assets/no_button.png"),
                    width: 120,
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