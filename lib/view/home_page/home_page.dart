import 'dart:io';

import 'package:crib_stock/base_view.dart';
import 'package:crib_stock/constants/color_constants.dart';
import 'package:crib_stock/constants/decoration.dart';
import 'package:crib_stock/constants/dimension_constants.dart';
import 'package:crib_stock/constants/route_constants.dart';
import 'package:crib_stock/enum/viewstate.dart';
import 'package:crib_stock/extensions/allExtensions.dart';
import 'package:crib_stock/helper/dialog_helper.dart';
import 'package:crib_stock/helper/keyboard_helper.dart';
import 'package:crib_stock/provider/home_page_provider.dart';
import 'package:crib_stock/widgets/roundCornerShape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scannumber = TextEditingController();


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,
          body: BaseView<HomePageProvider>(
            onModelReady: (provider) {
              provider.getList(context);
            },
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d143.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Crib Stock",
                          ).boldText(ColorConstants.headingColor, DimensionConstants.d30.sp,TextAlign.center),

                        ],
                      ) ,
                      SizedBox(
                        height: DimensionConstants.d37.h,
                      ),
                      Text('Scan Part Number').mediumText(ColorConstants.colorBlack, DimensionConstants.d16.sp, TextAlign.left),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      RoundCornerShape(
                        height: DimensionConstants.d52.h,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        child: Center(
                          child: TextFormField(

                            readOnly: true,
                            onTap: (){
                              provider.scanBarcodeNormal();
                            },

                            textCapitalization:
                            TextCapitalization.sentences,
                            cursorColor:
                            ColorConstants.colorButtonbgColor,
                            controller: scannumber,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants
                                    .d16.sp),
                            decoration: ViewDecoration.inputDecorationWithCurve(

                                provider.scanBarcode,
                              ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,

                          ),
                        ),
                      ),

                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),

                      Text('Enter Quantity').mediumText(ColorConstants.colorBlack, DimensionConstants.d16.sp, TextAlign.left),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      RoundCornerShape(
                        height: DimensionConstants.d52.h,
                        bgColor: ColorConstants.whiteColor,
                        topRightradius: DimensionConstants.d6.r,
                        topleftradius: DimensionConstants.d6.r,
                        bottomRightradius: DimensionConstants.d6.r,
                        bottomleftradius: DimensionConstants.d6.r,
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 0.75),
                                blurRadius: 12,
                                color: ColorConstants.borderColor,
                              )
                            ]
                        ),
                        child: Center(
                          child: TextFormField(


                            textCapitalization:
                            TextCapitalization.sentences,
                            cursorColor:
                            ColorConstants.colorButtonbgColor,
                            controller: provider.quantity,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants
                                    .d16.sp),
                            decoration: ViewDecoration.inputDecorationWithCurve(
                              "",
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,

                          ),
                        ),
                      ),


                      SizedBox(
                        height: DimensionConstants.d28.h,
                      ),

                      provider.state == ViewState.Busy?
                      Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.colorButtonbgColor)

                        ),
                      ): GestureDetector(
                        onTap: () {
                          if(provider.scanBarcode==''){
                            DialogHelper.showMessage(context, 'Please enter scan number');
                          }
                          else if(provider.quantity.text==''){
                            DialogHelper.showMessage(context, 'Please enter quantity');

                          }


                          else{
                            KeyboardHelper.hideKeyboard(context);
                            provider.addrecords();

                          }


                        },
                        child: RoundCornerShape(
                            height: DimensionConstants.d52.h,
                            bgColor: ColorConstants.colorButtonbgColor,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Submit',
                                  ).boldText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants.d16.sp,
                                      TextAlign.center),

                                ],
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d24.h,
                      ),


                      GestureDetector(
                        onTap: () {
                          if(provider.csv==[]){
                            DialogHelper.showMessage(context, 'You dont have anything to export');
                          }
                          else{
                            Navigator.of(context).pushNamed(
                                RoutesConstants.Export,
                                arguments: provider.exportlist
                            );

                          }


                        },
                        child: RoundCornerShape(
                            height: DimensionConstants.d52.h,
                            bgColor: ColorConstants.colorButtonbgColor,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Export',
                                  ).boldText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants.d16.sp,
                                      TextAlign.center),

                                ],
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d24.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          DialogHelper.showDialogWithTwoButtons(context, 'Exit', 'Yes', 'Cancel', 'Are you sure you want to exit?',
                              positiveButtonPress: (){
                                SystemNavigator.pop();
                              }, negativeButtonPress: () {
                                Navigator.pop(context);
                              });
                        },
                        child: RoundCornerShape(
                            height: DimensionConstants.d52.h,
                            bgColor: ColorConstants.fbbuttonColor,
                            topRightradius: DimensionConstants.d6.r,
                            topleftradius: DimensionConstants.d6.r,
                            bottomRightradius: DimensionConstants.d6.r,
                            bottomleftradius: DimensionConstants.d6.r,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Exit',
                                  ).boldText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants.d16.sp,
                                      TextAlign.center),

                                ],
                              ),
                            )
                        ),
                      ),

                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

//
