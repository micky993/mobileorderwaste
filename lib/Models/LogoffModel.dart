// To parse this JSON data, do
//
//     final logoff = logoffFromJson(jsonString);

import 'dart:convert';

Logoff logoffFromJson(String str) => Logoff.fromJson(json.decode(str));

String logoffToJson(Logoff data) => json.encode(data.toJson());

class Logoff {
  Logoff({
    this.d,
  });

  D d;

  factory Logoff.fromJson(Map<String, dynamic> json) => Logoff(
        d: D.fromJson(json["d"]),
      );

  Map<String, dynamic> toJson() => {
        "d": d.toJson(),
      };
}

class D {
  D({
    this.versionId,
    this.vehicleId,
  });

  String versionId;
  String vehicleId;

  factory D.fromJson(Map<String, dynamic> json) => D(
        versionId: json["VersionId"],
        vehicleId: json["VehicleId"],
      );

  Map<String, dynamic> toJson() => {
        "VersionId": versionId,
        "VehicleId": vehicleId,
      };
}
