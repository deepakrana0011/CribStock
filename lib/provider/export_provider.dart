import 'dart:convert';
import 'dart:io';

import 'package:crib_stock/helper/shared_pref.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';

import 'base_provider.dart';

class ExportProvider extends BaseProvider {


  final emailadress = TextEditingController();
  final confirmemailadress = TextEditingController();
  final pin = TextEditingController();

  Future<bool> createCsv(BuildContext context) async {

    var scannedList = SharedPref.getStoredData();
    List<List<dynamic>> rows = [];
    List<dynamic> row = [];
    row.add("Sr No.");
    row.add("Quantity");
    row.add("Part Number");
    rows.add(row);
    for (int i = 0; i < scannedList.data!.length; i++) {
      List<dynamic> row = [];
      row.add(i + 1);
      row.add(scannedList.data![i].quantity);
      row.add(scannedList.data![i].scanPartNumber);
      rows.add(row);
    }
    print(rows);
    String csvData = ListToCsvConverter().convert(rows);
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-${DateTime.now()}.csv";
    print(path);
    final File file = File(path);
    await file.writeAsString(csvData);

    final Email email = Email(
      recipients: [emailadress.text],
      attachmentPaths: [file.path],
    );
    await FlutterEmailSender.send(email).then((value) {
      SharedPref.prefs!.clear();
      Navigator.pushNamedAndRemoveUntil(context, "HOME_PAGE", (Route<dynamic> route) => false);
    });

    return true;
  }


}
