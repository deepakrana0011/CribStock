import 'package:crib_stock/constants/color_constants.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:crib_stock/extensions/allExtensions.dart';



class DialogHelper {
  static final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );



  static Future showDialogWithTwoButtons(
    BuildContext context,
    String title,
    String positiveGilroySemiBoldText,
    String negativeGilroySemiBoldText,
    String content, {
    required VoidCallback positiveButtonPress,
    required VoidCallback negativeButtonPress,
    barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(content),
          shape: border,
          actions: <Widget>[
            FlatButton(
              child: Text(negativeGilroySemiBoldText).mediumText(
                  ColorConstants.colorButtonbgColor, 18, TextAlign.center),
              textColor: Colors.black87,
              onPressed: () {
                if (negativeButtonPress != null) {
                  negativeButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            ),
            FlatButton(
              child: Text(positiveGilroySemiBoldText).mediumText(
                  ColorConstants.colorButtonbgColor, 18, TextAlign.center),
              onPressed: () {
                if (positiveButtonPress != null) {
                  positiveButtonPress();
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                }
              },
            )
          ],
        );
      },
    );
  }






  static showMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: ColorConstants.colorButtonbgColor,
      duration: Duration(seconds: 2),
    )..show(context);
  }
}
