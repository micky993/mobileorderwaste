// To parse this JSON data, do
//
//     final loginres = loginresFromJson(jsonString);

import 'dart:collection';
import 'dart:convert';

class Loginres {
  Metadata metadata;
  String versionId;
  String fittVehicle;
  String perNr;
  String vehicleId;
  String role;
  String name;

  Loginres(
      {this.metadata,
      this.versionId,
      this.fittVehicle,
      this.perNr,
      this.vehicleId,
      this.role,
      this.name});

  List<Loginres> jsondecode(jsonString) {
    List<Loginres> list = (json.decode(jsonString) as LinkedHashMap)
        .values
        .map((data) => Loginres.fromJson(data))
        .toList();
    return list;
  }

  factory Loginres.fromJson(Map<String, dynamic> json) => Loginres(
        //metadata: Metadata.fromJson(json["__metadata"]),
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
