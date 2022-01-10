class Csvlist {
  Csvlist({
    required this.scannedList,
  });

  List<ScannedList> scannedList;

  factory Csvlist.fromJson(Map<String, dynamic> json) => Csvlist(
    scannedList: List<ScannedList>.from(json["scannedList"].map((x) => ScannedList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "scannedList": List<dynamic>.from(scannedList.map((x) => x.toJson())),
  };
}

class ScannedList {
  ScannedList({
    required this.quantity,
    required this.scanNumber,
  });

  int quantity;
  String scanNumber;

  factory ScannedList.fromJson(Map<String, dynamic> json) => ScannedList(
    quantity: json["quantity"],
    scanNumber: json["scanNumber"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "scanNumber": scanNumber,
  };
}