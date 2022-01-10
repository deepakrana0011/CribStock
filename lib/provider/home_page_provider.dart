
import 'dart:convert';

import 'package:crib_stock/enum/viewstate.dart';
import 'package:crib_stock/helper/shared_pref.dart';
import 'package:crib_stock/model/csv_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_provider.dart';

class HomePageProvider extends BaseProvider{

  final LocalStorage storage = new LocalStorage('localstorage_app');
  String scanBarcode='';
  final quantity = TextEditingController();
  List<String> records=[];


  List<dynamic> csv = [

    ["Scan Number", "Quantity"],

  ];

  List<dynamic> exportlist=[];





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

    setState(ViewState.Busy);
    records.add(scanBarcode);
    records.add(quantity.text);
    setState(ViewState.Idle);

    records=records;
    csv.add(records);
    csv=csv;
    records=[];
    /*String csvfile = jsonEncode(Csvlist(scannedList: scannedList).toJson());
    SharedPref.prefs!.setString('csv', csv);*/

    setState(ViewState.Idle);
    quantity.text='';
    scanBarcode='';
  }

  Future<void> getList(BuildContext context)  async {
    setState(ViewState.Busy);

    var CSVFILE =SharedPref.prefs?.getString('csv');
    if (CSVFILE?.isNotEmpty == true) {
      var data = Csvlist.fromJson(json.decode(CSVFILE!));
      print(data);

    }
    setState(ViewState.Idle);

  }



}