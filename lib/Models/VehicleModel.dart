// To parse this JSON data, do
//
//     final vehicleRes = vehicleResFromJson(jsonString);

import 'dart:convert';

VehicleRes vehicleResFromJson(String str) =>
    VehicleRes.fromJson(json.decode(str));

String vehicleResToJson(VehicleRes data) => json.encode(data.toJson());

class VehicleRes {
  VehicleRes({
    this.d,
  });

  D d;

  factory VehicleRes.fromJson(Map<String, dynamic> json) => VehicleRes(
        d: D.fromJson(json["d"]),
      );

  Map<String, dynamic> toJson() => {
        "d": d.toJson(),
      };
}

class D {
  D({
    this.results,
  });

  List<Result> results;

  factory D.fromJson(Map<String, dynamic> json) => D(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.metadata,
    this.vehicleId,
    this.fleetNum,
    this.licenseNum,
    this.fleetVin,
  });

  Metadata metadata;
  String vehicleId;
  String fleetNum;
  String licenseNum;
  String fleetVin;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        metadata: Metadata.fromJson(json["__metadata"]),
        vehicleId: json["VehicleId"],
        fleetNum: json["FleetNum"],
        licenseNum: json["LicenseNum"],
        fleetVin: json["FleetVin"],
      );

  Map<String, dynamic> toJson() => {
        "__metadata": metadata.toJson(),
        "VehicleId": vehicleId,
        "FleetNum": fleetNum,
        "LicenseNum": licenseNum,
        "FleetVin": fleetVin,
      };
}

class Metadata {
  Metadata({
    this.id,
    this.uri,
    this.type,
  });

  String id;
  String uri;
  String type;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        id: json["id"],
        uri: json["uri"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uri": uri,
        "type": type,
      };
}
