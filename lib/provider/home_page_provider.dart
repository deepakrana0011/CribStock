
import 'package:crib_stock/enum/viewstate.dart';
import 'package:crib_stock/helper/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_provider.dart';

class HomePageProvider extends BaseProvider{

  String scanBarcode='';
  final quantity = TextEditingController();
  List<dynamic> records=[];
  List<String> exportlist=[];
  List csv=[];



  Future<void> scanBarcodeNormal() async {

    setState(ViewState.Busy);
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
setState(ViewState.Idle);
      scanBarcode = barcodeScanRes;

  }

  Future<void> addrecords() async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(ViewState.Busy);
    records.add(scanBarcode);
    records.add(quantity.text);
    setState(ViewState.Idle);
    exportlist.add(records.cast().toString());
    setState(ViewState.Idle);
    records=[];

    exportlist=exportlist;
    print(exportlist);
    setState(ViewState.Idle);
    preferences.setStringList('csv', exportlist);
    quantity.text='';
    scanBarcode='';

  }

  Future<void> getList(BuildContext context) async {
    setState(ViewState.Busy);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    csv=preferences.getStringList('csv');
    setState(ViewState.Idle);
    print(csv);
  }



}