import 'package:crib_stock/constants/color_constants.dart';
import 'package:crib_stock/constants/route_constants.dart';
import 'package:crib_stock/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:crib_stock/extensions/allExtensions.dart';
import 'constants/dimension_constants.dart';
import 'package:crib_stock/router.dart' as router;


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorConstants.colorWhitishGray));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
      new MaterialApp(
        onGenerateRoute: router.Router.generateRoute,
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  )

  );
  setupLocator();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          Size(DimensionConstants.screenwidth, DimensionConstants.screenheight),
      builder: () {
        return new SplashScreen(

          useLoader: false,
          seconds: 3,
          photoSize: DimensionConstants.d125,
          navigateAfterSeconds: RoutesConstants.HOME_PAGE,
          title: new Text(
            'Crib Stock',
          ).boldText(ColorConstants.colorBlack, DimensionConstants.d35.sp,
              TextAlign.center),
          backgroundColor: ColorConstants.colorbackground,
        );
      },
    );
  }
}


