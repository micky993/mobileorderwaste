// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    this.d,
  });

  D d;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        d: D.fromJson(json["d"]),
      );

  Map<String, dynamic> toJson() => {
        "d": d.toJson(),
      };
}

class D {
  D({
    this.results,
    this.delta,
  });

  List<Result> results;
  String delta;

  factory D.fromJson(Map<String, dynamic> json) => D(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        delta: json["__delta"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "__delta": delta,
      };
}

class Result {
  Result({
    this.metadata,
    this.customerCollection,
    this.flagPeso,
    this.posizioneCons,
    this.zmaccCaricaCont,
    this.zmacchinCarica,
    this.zposizioniAperte,
    this.routeCollection,
    this.orderId,
    this.action,
    this.containerCount,
    this.distance,
    this.distanceUnit,
    this.vehicleId,
    this.geoposDirection,
    this.geoposLatitude,
    this.geoposLongitude,
    this.geoposSpeed,
    this.geoposSpeedUnit,
    this.geoposTimestamp,
    this.geoposValidity,
    this.mileageBegin,
    this.mileageEnd,
    this.mileageLast,
    this.mileageUnitBegin,
    this.mileageUnitEnd,
    this.mileageUnitLast,
    this.objVersion,
    this.orderDate,
    this.orderNr,
    this.orderText,
    this.route,
    this.routeText,
    this.status,
    this.statusTime,
    this.wdPlantNr,
    this.wdPlantCity,
    this.wdPlantCountry,
    this.wdPlantDesc,
    this.wdPlantHouseNum,
    this.wdPlantHouseNumAdd,
    this.wdPlantLatitude,
    this.wdPlantLongitude,
    this.wdPlantName,
    this.wdPlantNameAdd,
    this.wdPlantPostCode,
    this.wdPlantStreet,
  });

  Metadata metadata;
  bool customerCollection;
  String flagPeso;
  String posizioneCons;
  bool zmaccCaricaCont;
  bool zmacchinCarica;
  bool zposizioniAperte;
  bool routeCollection;
  String orderId;
  String action;
  int containerCount;
  String distance;
  String distanceUnit;
  String vehicleId;
  String geoposDirection;
  String geoposLatitude;
  String geoposLongitude;
  String geoposSpeed;
  String geoposSpeedUnit;
  dynamic geoposTimestamp;
  String geoposValidity;
  String mileageBegin;
  String mileageEnd;
  String mileageLast;
  String mileageUnitBegin;
  String mileageUnitEnd;
  String mileageUnitLast;
  String objVersion;
  String orderDate;
  String orderNr;
  String orderText;
  String route;
  String routeText;
  String status;
  dynamic statusTime;
  String wdPlantNr;
  String wdPlantCity;
  String wdPlantCountry;
  String wdPlantDesc;
  String wdPlantHouseNum;
  String wdPlantHouseNumAdd;
  String wdPlantLatitude;
  String wdPlantLongitude;
  String wdPlantName;
  String wdPlantNameAdd;
  String wdPlantPostCode;
  String wdPlantStreet;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        metadata: Metadata.fromJson(json["__metadata"]),
        customerCollection: json["CustomerCollection"],
        flagPeso: json["FlagPeso"],
        posizioneCons: json["PosizioneCons"],
        zmaccCaricaCont: json["ZmaccCaricaCont"],
        zmacchinCarica: json["ZmacchinCarica"],
        zposizioniAperte: json["ZposizioniAperte"],
        routeCollection: json["RouteCollection"],
        orderId: json["OrderId"],
        action: json["Action"],
        containerCount: json["ContainerCount"],
        distance: json["Distance"],
        distanceUnit: json["DistanceUnit"],
        vehicleId: json["VehicleId"],
        geoposDirection: json["GeoposDirection"],
        geoposLatitude: json["GeoposLatitude"],
        geoposLongitude: json["GeoposLongitude"],
        geoposSpeed: json["GeoposSpeed"],
        geoposSpeedUnit: json["GeoposSpeedUnit"],
        geoposTimestamp: json["GeoposTimestamp"],
        geoposValidity: json["GeoposValidity"],
        mileageBegin: json["MileageBegin"],
        mileageEnd: json["MileageEnd"],
        mileageLast: json["MileageLast"],
        mileageUnitBegin: json["MileageUnitBegin"],
        mileageUnitEnd: json["MileageUnitEnd"],
        mileageUnitLast: json["MileageUnitLast"],
        objVersion: json["ObjVersion"],
        orderDate: json["OrderDate"],
        orderNr: json["OrderNr"],
        orderText: json["OrderText"],
        route: json["Route"],
        routeText: json["RouteText"],
        status: json["Status"],
        statusTime: json["StatusTime"],
        wdPlantNr: json["WDPlantNr"],
        wdPlantCity: json["WDPlantCity"],
        wdPlantCountry: json["WDPlantCountry"],
        wdPlantDesc: json["WDPlantDesc"],
        wdPlantHouseNum: json["WDPlantHouseNum"],
        wdPlantHouseNumAdd: json["WDPlantHouseNumAdd"],
        wdPlantLatitude: json["WDPlantLatitude"],
        wdPlantLongitude: json["WDPlantLongitude"],
        wdPlantName: json["WDPlantName"],
        wdPlantNameAdd: json["WDPlantNameAdd"],
        wdPlantPostCode: json["WDPlantPostCode"],
        wdPlantStreet: json["WDPlantStreet"],
      );

  Map<String, dynamic> toJson() => {
        "__metadata": metadata.toJson(),
        "CustomerCollection": customerCollection,
        "FlagPeso": flagPeso,
        "PosizioneCons": posizioneCons,
        "ZmaccCaricaCont": zmaccCaricaCont,
        "ZmacchinCarica": zmacchinCarica,
        "ZposizioniAperte": zposizioniAperte,
        "RouteCollection": routeCollection,
        "OrderId": orderId,
        "Action": action,
        "ContainerCount": containerCount,
        "Distance": distance,
        "DistanceUnit": distanceUnit,
        "VehicleId": vehicleId,
        "GeoposDirection": geoposDirection,
        "GeoposLatitude": geoposLatitude,
        "GeoposLongitude": geoposLongitude,
        "GeoposSpeed": geoposSpeed,
        "GeoposSpeedUnit": geoposSpeedUnit,
        "GeoposTimestamp": geoposTimestamp,
        "GeoposValidity": geoposValidity,
        "MileageBegin": mileageBegin,
        "MileageEnd": mileageEnd,
        "MileageLast": mileageLast,
        "MileageUnitBegin": mileageUnitBegin,
        "MileageUnitEnd": mileageUnitEnd,
        "MileageUnitLast": mileageUnitLast,
        "ObjVersion": objVersion,
        "OrderDate": orderDate,
        "OrderNr": orderNr,
        "OrderText": orderText,
        "Route": route,
        "RouteText": routeText,
        "Status": status,
        "StatusTime": statusTime,
        "WDPlantNr": wdPlantNr,
        "WDPlantCity": wdPlantCity,
        "WDPlantCountry": wdPlantCountry,
        "WDPlantDesc": wdPlantDesc,
        "WDPlantHouseNum": wdPlantHouseNum,
        "WDPlantHouseNumAdd": wdPlantHouseNumAdd,
        "WDPlantLatitude": wdPlantLatitude,
        "WDPlantLongitude": wdPlantLongitude,
        "WDPlantName": wdPlantName,
        "WDPlantNameAdd": wdPlantNameAdd,
        "WDPlantPostCode": wdPlantPostCode,
        "WDPlantStreet": wdPlantStreet,
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
