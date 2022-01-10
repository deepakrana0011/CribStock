class ScannedList {
  ScannedList({
    this.data,
  });

  List<ScannedData>? data;

  factory ScannedList.fromJson(Map<String, dynamic> json) => ScannedList(
        data: List<ScannedData>.from(json["data"].map((x) => ScannedData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
      };
}

class ScannedData {
  ScannedData({
    this.quantity,
    this.scanPartNumber,
  });

  String? quantity;
  String? scanPartNumber;

  factory ScannedData.fromJson(Map<String, dynamic> json) => ScannedData(
        quantity: json["quantity"],
        scanPartNumber:
            json["scanPartNumber"] == null ? null : json["scanPartNumber"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "scanPartNumber": scanPartNumber == null ? null : scanPartNumber,
      };
}
