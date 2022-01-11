import 'package:flutter/material.dart';

class RoundCornerShape extends StatelessWidget {
  Widget child;
  Color bgColor;
  Color strokeColor;
  double? topleftradius;
  double? topRightradius;
  double? bottomleftradius;
  double? bottomRightradius;
  double? height;
  double? width;
  double? elevation;
  Decoration? decoration;

  RoundCornerShape(
      {required this.child,
      required this.bgColor,
      this.topleftradius,
      this.topRightradius,
      this.bottomleftradius,
      this.bottomRightradius,
      this.height,
      this.width,
      this.decoration,
      this.strokeColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: decoration,
        child: Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: strokeColor),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topleftradius!),
                  topRight: Radius.circular(topRightradius!),
                  bottomLeft: Radius.circular(bottomleftradius!),
                  bottomRight: Radius.circular(bottomRightradius!))),
          color: bgColor,
          child: child,
        ));
  }
}
