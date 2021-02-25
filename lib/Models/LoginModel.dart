// To parse this JSON data, do
//
//     final loginRes = loginResFromJson(jsonString);

import 'dart:convert';

LoginRes loginResFromJson(String str) => LoginRes.fromJson(json.decode(str));

String loginResToJson(LoginRes data) => json.encode(data.toJson());

class LoginRes {
  LoginRes({
    this.d,
  });

  D d;

  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
        d: D.fromJson(json["d"]),
      );

  Map<String, dynamic> toJson() => {
        "d": d.toJson(),
      };
}

class D {
  D({
    this.metadata,
    this.versionId,
    this.fittVehicle,
    this.perNr,
    this.vehicleId,
    this.role,
    this.name,
  });

  Metadata metadata;
  String versionId;
  String fittVehicle;
  String perNr;
  String vehicleId;
  String role;
  String name;

  factory D.fromJson(Map<String, dynamic> json) => D(
        metadata: Metadata.fromJson(json["__metadata"]),
        versionId: json["VersionId"],
        fittVehicle: json["FittVehicle"],
        perNr: json["PerNr"],
        vehicleId: json["VehicleId"],
        role: json["Role"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "__metadata": metadata.toJson(),
        "VersionId": versionId,
        "FittVehicle": fittVehicle,
        "PerNr": perNr,
        "VehicleId": vehicleId,
        "Role": role,
        "Name": name,
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
