import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:therapist/ConfirmExitDialog.dart';

class Components {
  static Widget pageTitleHeader(String title) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontFamily: 'Lucida',
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  static Widget pageHeaderMenu(BuildContext context, bool showHomeButton){
    return StatefulBuilder(
      builder: (context, setState){
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    HapticFeedback.lightImpact();
                    ConfirmExitDialog.showConfirmExitDialog(context);
                  },
                  child: Image(
                    image: AssetImage("lib/assets/quite_button.png"),
                    height: 65,
                    width: 65,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future scaleAnimatedDialog(BuildContext context, Widget dialog){
    return showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: dialog,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

}


