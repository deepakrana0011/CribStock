
import 'package:crib_stock/constants/dimension_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'color_constants.dart';

class ViewDecoration{
  static InputDecoration inputDecorationWithCurve(
      String fieldname ,{Widget? prefixIcon,Widget? suffixIcon}) {
    return InputDecoration(

        prefixIcon: prefixIcon==null?null:prefixIcon,
        suffixIcon: suffixIcon==null?null:suffixIcon,
        prefixIconConstraints: BoxConstraints(
          maxWidth: 40,
          maxHeight: 45
        ),
        suffixIconConstraints: BoxConstraints(
            maxWidth: 40,
            maxHeight: 45

        ),

        contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 0),

        hintText: fieldname,
        filled: true,
        hintStyle: textRegular(ColorConstants.blackcolor, DimensionConstants.d16.sp),
        isDense: true,



        fillColor: ColorConstants.whiteColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.whiteColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.whiteColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorConstants.whiteColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.7),
            borderRadius: BorderRadius.all(Radius.circular(6.r))));
  }















  static TextStyle textRegular(Color color, double textSize) {
    return TextStyle(
        color: color,
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w500,
        fontSize: textSize);
  }

  static TextStyle textFieldStyle(double size) {
    return TextStyle(
        color: ColorConstants.colorTextAppBar,
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w400,
        fontSize: size);
  }



}