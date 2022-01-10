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

class HomePageProvider extends BaseProvider {
  final LocalStorage storage = new LocalStorage('localstorage_app');
  String scanBarcode = '';
  final quantity = TextEditingController();

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

  Future<void> addRecords() async {
    var data = ScannedData();
    data.quantity = quantity.text;
    data.scanPartNumber = scanBarcode;
    var exportListString = SharedPref.prefs!.getString(SharedPref.EXPORT_LIST);
    if (exportListString != null) {
      var scannedList = ScannedList.fromJson(json.decode(exportListString));
      scannedList.data!.add(data);
      SharedPref.updateDataInSharedPref(scannedList);
    } else {
      List<ScannedData> firstItemToList = [];
      firstItemToList.add(data);
      var scannedList = ScannedList();
      scannedList.data = firstItemToList;
      SharedPref.updateDataInSharedPref(scannedList);
    }
  }
}
