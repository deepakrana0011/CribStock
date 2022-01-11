import 'dart:convert';

import 'package:crib_stock/model/csv_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static const EXPORT_LIST= "EXPORT_LIST";

  static SharedPreferences? prefs;


  static void updateDataInSharedPref(ScannedList scannedList){
    String scannedListString = jsonEncode(scannedList.toJson());
    SharedPref.prefs!.setString(SharedPref.EXPORT_LIST, scannedListString);
  }

  static ScannedList getStoredData(){
    var cartDetailString = SharedPref.prefs!.getString(SharedPref.EXPORT_LIST);
    var scannedList = ScannedList.fromJson(json.decode(cartDetailString));
    return scannedList;
  }

  static clearSharePref() async {
    SharedPref.prefs!.setString(SharedPref.EXPORT_LIST, null);

  }

}