import 'dart:io';

import 'package:crib_stock/base_view.dart';
import 'package:crib_stock/constants/color_constants.dart';
import 'package:crib_stock/constants/decoration.dart';
import 'package:crib_stock/constants/dimension_constants.dart';
import 'package:crib_stock/extensions/allExtensions.dart';
import 'package:crib_stock/helper/dialog_helper.dart';
import 'package:crib_stock/helper/keyboard_helper.dart';
import 'package:crib_stock/provider/export_provider.dart';
import 'package:crib_stock/provider/home_page_provider.dart';
import 'package:crib_stock/widgets/roundCornerShape.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_mail_app/open_mail_app.dart';

class Export extends StatefulWidget {
  final List<dynamic> csv;

  const Export({Key? key, required this.csv}) : super(key: key);
  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ColorConstants.colorbackground,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: ColorConstants.colorTextAppBar,
              ),
              onPressed: () {
                Navigator.pop(context);
                KeyboardHelper.hideKeyboard(context);
              },
            ),
            centerTitle: true,
          ),
          backgroundColor: ColorConstants.colorbackground,
          key: _scaffoldKey,
          body: BaseView<ExportProvider>(
            onModelReady: (provider) {

              print(widget.csv);
            },
            builder: (context, provider, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: DimensionConstants.d20.w,
                      right: DimensionConstants.d20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DimensionConstants.d110.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Crib Stock",
                          ).boldText(ColorConstants.headingColor,
                              DimensionConstants.d30.sp, TextAlign.center),
                        ],
                      ),
                      SizedBox(
                        height: DimensionConstants.d37.h,
                      ),
                      Text('Enter email address').mediumText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp,
                          TextAlign.left),
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
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 12,
                            color: ColorConstants.borderColor,
                          )
                        ]),
                        child: Center(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            cursorColor: ColorConstants.colorButtonbgColor,
                            controller: provider.emailadress,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants.d16.sp),
                            decoration: ViewDecoration.inputDecorationWithCurve(
                              "",
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      Text('Confirm email address').mediumText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp,
                          TextAlign.left),
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
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 12,
                            color: ColorConstants.borderColor,
                          )
                        ]),
                        child: Center(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            cursorColor: ColorConstants.colorButtonbgColor,
                            controller: provider.confirmemailadress,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants.d16.sp),
                            decoration: ViewDecoration.inputDecorationWithCurve(
                              "",
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d15.h,
                      ),
                      Text('Enter Export Pin').mediumText(
                          ColorConstants.colorBlack,
                          DimensionConstants.d16.sp,
                          TextAlign.left),
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
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 0.75),
                            blurRadius: 12,
                            color: ColorConstants.borderColor,
                          )
                        ]),
                        child: Center(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            cursorColor: ColorConstants.colorButtonbgColor,
                            controller: provider.pin,
                            style: ViewDecoration.textFieldStyle(
                                DimensionConstants.d16.sp),
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
                      GestureDetector(
                        onTap: () async {
                          if (provider.emailadress.text == '') {
                            DialogHelper.showMessage(
                                context, 'Please enter email address');
                          } else if (provider.emailadress.text !=
                              provider.confirmemailadress.text) {
                            DialogHelper.showMessage(
                                context, 'Email address do not matches');
                          } else if (provider.pin.text == '') {
                            DialogHelper.showMessage(
                                context, 'Please enter export pin');
                          } else if (provider.pin.text != '9182') {
                            DialogHelper.showMessage(
                                context, 'Please enter correct export pin');
                          } else {
                            provider
                                .createCsv(context, widget.csv)
                                .then((value) async {
                              if (value) {


                              }
                            });
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Send Export',
                                  ).boldText(
                                      ColorConstants.whiteColor,
                                      DimensionConstants.d16.sp,
                                      TextAlign.center),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: DimensionConstants.d24.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Open Mail App"),
          content: Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}

//
