import 'dart:io';

import 'package:crib_stock/enum/viewstate.dart';
import 'package:crib_stock/helper/shared_pref.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_provider.dart';

class ExportProvider extends BaseProvider {
  final LocalStorage storage = new LocalStorage('localstorage_app');

  final emailadress = TextEditingController();
  final confirmemailadress = TextEditingController();
  final pin = TextEditingController();


  Future<bool> createCsv(BuildContext context,  csv) async {
    setState(ViewState.Busy);
    print(csv);

    String csvData = ListToCsvConverter().convert(csv);
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-${DateTime.now()}.csv";
    print(path);
    final File file = File(path);
    await file.writeAsString(csvData);
    final Email email = Email(
      recipients: [emailadress.text],
      attachmentPaths: [file.path],

    );

    await FlutterEmailSender.send(email);
   /* Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(path: path);
        },
      ),
    );*/
   
    return true;
  }
  Future<void> getList(BuildContext context)  async {

    setState(ViewState.Busy);
    var ready = await storage.ready;
    print('searching ${'name'} is $ready');
     storage.getItem('name');
    print(storage.getItem('name'));
    setState(ViewState.Idle);

  }
}