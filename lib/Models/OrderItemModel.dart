// To parse this JSON data, do
//
//     final orderItems = orderItemsFromJson(jsonString);

import 'dart:convert';

OrderItems orderItemsFromJson(String str) =>
    OrderItems.fromJson(json.decode(str));

String orderItemsToJson(OrderItems data) => json.encode(data.toJson());

class OrderItems {
  OrderItems({
    this.d,
  });

  D d;

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
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
    this.robtyp,
    this.tidnr,
    this.action,
    this.robtypDesc,
    this.contCount,
    this.contCountResult,
    this.contType,
    this.contTypeDesc,
    this.slCity,
    this.wdPlantCity,
    this.confType,
    this.confType2,
    this.slCountry,
    this.wdPlantCountry,
    this.endTimeTs,
    this.vehicleId,
    this.geoposDirection,
    this.geoposLatitude,
    this.geoposLongitude,
    this.geoposSpeed,
    this.geoposSpeedUnit,
    this.geoposTimestamp,
    this.geoposValidity,
    this.groupDistrict,
    this.groupDistrictDesc,
    this.groupStreet,
    this.groupStreetDesc,
    this.orderId,
    this.slHouseNum,
    this.wdPlantHouseNum,
    this.slHouseNumAdd,
    this.wdPlantHouseNumAdd,
    this.slLatitude,
    this.wdPlantLatitude,
    this.slLongitude,
    this.wdPlantLongitude,
    this.customerName,
    this.slName,
    this.wdPlantName,
    this.customerNameAdd,
    this.slNameAdd,
    this.wdPlantNameAdd,
    this.chiusuraAvvNegativa,
    this.objVersion,
    this.orderItemNr,
    this.orderNr,
    this.orderText,
    this.orderItemId,
    this.slPostCode,
    this.wdPlantPostCode,
    this.routeSequence,
    this.serviceType,
    this.serviceTypeDesc,
    this.servlocSl,
    this.startTimeTs,
    this.status,
    this.statusTime,
    this.slStreet,
    this.wdPlantStreet,
    this.timeFrame,
    this.vTj02,
    this.wasteTypeDesc,
    this.wdPlantDesc,
    this.wdPlantNr,
    this.zaddService,
    this.zconftype,
    this.zediffctxt,
    this.zflagRfid,
    this.zflagold,
    this.zinevasa,
    this.notaChiusura,
    this.codiceProblemaConf,
    this.zposwdoOrig,
    this.tipoAvviso,
    this.codiceProblema,
    this.descrCodiceProblema,
    this.descrCodiceProblemaConf,
    this.zqmncod,
    this.zqmnum,
    this.descrAvviso,
    this.statoAvviso,
    this.ztxtcdma,
    this.zwdoOrig,
  });

  Metadata metadata;
  String robtyp;
  String tidnr;
  String action;
  String robtypDesc;
  int contCount;
  String contCountResult;
  String contType;
  String contTypeDesc;
  String slCity;
  String wdPlantCity;
  String confType;
  String confType2;
  String slCountry;
  String wdPlantCountry;
  String endTimeTs;
  String vehicleId;
  String geoposDirection;
  String geoposLatitude;
  String geoposLongitude;
  String geoposSpeed;
  String geoposSpeedUnit;
  dynamic geoposTimestamp;
  String geoposValidity;
  String groupDistrict;
  String groupDistrictDesc;
  String groupStreet;
  String groupStreetDesc;
  String orderId;
  String slHouseNum;
  String wdPlantHouseNum;
  String slHouseNumAdd;
  String wdPlantHouseNumAdd;
  String slLatitude;
  String wdPlantLatitude;
  String slLongitude;
  String wdPlantLongitude;
  String customerName;
  String slName;
  String wdPlantName;
  String customerNameAdd;
  String slNameAdd;
  String wdPlantNameAdd;
  bool chiusuraAvvNegativa;
  String objVersion;
  String orderItemNr;
  String orderNr;
  String orderText;
  String orderItemId;
  String slPostCode;
  String wdPlantPostCode;
  String routeSequence;
  String serviceType;
  String serviceTypeDesc;
  String servlocSl;
  String startTimeTs;
  String status;
  dynamic statusTime;
  String slStreet;
  String wdPlantStreet;
  String timeFrame;
  String vTj02;
  String wasteTypeDesc;
  String wdPlantDesc;
  String wdPlantNr;
  bool zaddService;
  String zconftype;
  String zediffctxt;
  String zflagRfid;
  String zflagold;
  String zinevasa;
  String notaChiusura;
  String codiceProblemaConf;
  String zposwdoOrig;
  String tipoAvviso;
  String codiceProblema;
  String descrCodiceProblema;
  String descrCodiceProblemaConf;
  String zqmncod;
  String zqmnum;
  String descrAvviso;
  String statoAvviso;
  String ztxtcdma;
  String zwdoOrig;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        metadata: Metadata.fromJson(json["__metadata"]),
        robtyp: json["Robtyp"],
        tidnr: json["Tidnr"],
        action: json["Action"],
        robtypDesc: json["RobtypDesc"],
        contCount: json["ContCount"],
        contCountResult: json["ContCountResult"],
        contType: json["ContType"],
        contTypeDesc: json["ContTypeDesc"],
        slCity: json["SLCity"],
        wdPlantCity: json["WDPlantCity"],
        confType: json["ConfType"],
        confType2: json["ConfType2"],
        slCountry: json["SLCountry"],
        wdPlantCountry: json["WDPlantCountry"],
        endTimeTs: json["EndTimeTS"],
        vehicleId: json["VehicleId"],
        geoposDirection: json["GeoposDirection"],
        geoposLatitude: json["GeoposLatitude"],
        geoposLongitude: json["GeoposLongitude"],
        geoposSpeed: json["GeoposSpeed"],
        geoposSpeedUnit: json["GeoposSpeedUnit"],
        geoposTimestamp: json["GeoposTimestamp"],
        geoposValidity: json["GeoposValidity"],
        groupDistrict: json["GroupDistrict"],
        groupDistrictDesc: json["GroupDistrictDesc"],
        groupStreet: json["GroupStreet"],
        groupStreetDesc: json["GroupStreetDesc"],
        orderId: json["OrderId"],
        slHouseNum: json["SLHouseNum"],
        wdPlantHouseNum: json["WDPlantHouseNum"],
        slHouseNumAdd: json["SLHouseNumAdd"],
        wdPlantHouseNumAdd: json["WDPlantHouseNumAdd"],
        slLatitude: json["SLLatitude"],
        wdPlantLatitude: json["WDPlantLatitude"],
        slLongitude: json["SLLongitude"],
        wdPlantLongitude: json["WDPlantLongitude"],
        customerName: json["CustomerName"],
        slName: json["SLName"],
        wdPlantName: json["WDPlantName"],
        customerNameAdd: json["CustomerNameAdd"],
        slNameAdd: json["SLNameAdd"],
        wdPlantNameAdd: json["WDPlantNameAdd"],
        chiusuraAvvNegativa: json["ChiusuraAvvNegativa"],
        objVersion: json["ObjVersion"],
        orderItemNr: json["OrderItemNr"],
        orderNr: json["OrderNr"],
        orderText: json["OrderText"],
        orderItemId: json["OrderItemId"],
        slPostCode: json["SLPostCode"],
        wdPlantPostCode: json["WDPlantPostCode"],
        routeSequence: json["RouteSequence"],
        serviceType: json["ServiceType"],
        serviceTypeDesc: json["ServiceTypeDesc"],
        servlocSl: json["ServlocSL"],
        startTimeTs: json["StartTimeTS"],
        status: json["Status"],
        statusTime: json["StatusTime"],
        slStreet: json["SLStreet"],
        wdPlantStreet: json["WDPlantStreet"],
        timeFrame: json["TimeFrame"],
        vTj02: json["VTj02"],
        wasteTypeDesc: json["WasteTypeDesc"],
        wdPlantDesc: json["WDPlantDesc"],
        wdPlantNr: json["WDPlantNr"],
        zaddService: json["ZaddService"],
        zconftype: json["Zconftype"],
        zediffctxt: json["Zediffctxt"],
        zflagRfid: json["ZflagRfid"],
        zflagold: json["Zflagold"],
        zinevasa: json["Zinevasa"],
        notaChiusura: json["NotaChiusura"],
        codiceProblemaConf: json["CodiceProblemaConf"],
        zposwdoOrig: json["ZposwdoOrig"],
        tipoAvviso: json["TipoAvviso"],
        codiceProblema: json["CodiceProblema"],
        descrCodiceProblema: json["DescrCodiceProblema"],
        descrCodiceProblemaConf: json["DescrCodiceProblemaConf"],
        zqmncod: json["Zqmncod"],
        zqmnum: json["Zqmnum"],
        descrAvviso: json["DescrAvviso"],
        statoAvviso: json["StatoAvviso"],
        ztxtcdma: json["Ztxtcdma"],
        zwdoOrig: json["ZwdoOrig"],
      );

  Map<String, dynamic> toJson() => {
        "__metadata": metadata.toJson(),
        "Robtyp": robtyp,
        "Tidnr": tidnr,
        "Action": action,
        "RobtypDesc": robtypDesc,
        "ContCount": contCount,
        "ContCountResult": contCountResult,
        "ContType": contType,
        "ContTypeDesc": contTypeDesc,
        "SLCity": slCity,
        "WDPlantCity": wdPlantCity,
        "ConfType": confType,
        "ConfType2": confType2,
        "SLCountry": slCountry,
        "WDPlantCountry": wdPlantCountry,
        "EndTimeTS": endTimeTs,
        "VehicleId": vehicleId,
        "GeoposDirection": geoposDirection,
        "GeoposLatitude": geoposLatitude,
        "GeoposLongitude": geoposLongitude,
        "GeoposSpeed": geoposSpeed,
        "GeoposSpeedUnit": geoposSpeedUnit,
        "GeoposTimestamp": geoposTimestamp,
        "GeoposValidity": geoposValidity,
        "GroupDistrict": groupDistrict,
        "GroupDistrictDesc": groupDistrictDesc,
        "GroupStreet": groupStreet,
        "GroupStreetDesc": groupStreetDesc,
        "OrderId": orderId,
        "SLHouseNum": slHouseNum,
        "WDPlantHouseNum": wdPlantHouseNum,
        "SLHouseNumAdd": slHouseNumAdd,
        "WDPlantHouseNumAdd": wdPlantHouseNumAdd,
        "SLLatitude": slLatitude,
        "WDPlantLatitude": wdPlantLatitude,
        "SLLongitude": slLongitude,
        "WDPlantLongitude": wdPlantLongitude,
        "CustomerName": customerName,
        "SLName": slName,
        "WDPlantName": wdPlantName,
        "CustomerNameAdd": customerNameAdd,
        "SLNameAdd": slNameAdd,
        "WDPlantNameAdd": wdPlantNameAdd,
        "ChiusuraAvvNegativa": chiusuraAvvNegativa,
        "ObjVersion": objVersion,
        "OrderItemNr": orderItemNr,
        "OrderNr": orderNr,
        "OrderText": orderText,
        "OrderItemId": orderItemId,
        "SLPostCode": slPostCode,
        "WDPlantPostCode": wdPlantPostCode,
        "RouteSequence": routeSequence,
        "ServiceType": serviceType,
        "ServiceTypeDesc": serviceTypeDesc,
        "ServlocSL": servlocSl,
        "StartTimeTS": startTimeTs,
        "Status": status,
        "StatusTime": statusTime,
        "SLStreet": slStreet,
        "WDPlantStreet": wdPlantStreet,
        "TimeFrame": timeFrame,
        "VTj02": vTj02,
        "WasteTypeDesc": wasteTypeDesc,
        "WDPlantDesc": wdPlantDesc,
        "WDPlantNr": wdPlantNr,
        "ZaddService": zaddService,
        "Zconftype": zconftype,
        "Zediffctxt": zediffctxt,
        "ZflagRfid": zflagRfid,
        "Zflagold": zflagold,
        "Zinevasa": zinevasa,
        "NotaChiusura": notaChiusura,
        "CodiceProblemaConf": codiceProblemaConf,
        "ZposwdoOrig": zposwdoOrig,
        "TipoAvviso": tipoAvviso,
        "CodiceProblema": codiceProblema,
        "DescrCodiceProblema": descrCodiceProblema,
        "DescrCodiceProblemaConf": descrCodiceProblemaConf,
        "Zqmncod": zqmncod,
        "Zqmnum": zqmnum,
        "DescrAvviso": descrAvviso,
        "StatoAvviso": statoAvviso,
        "Ztxtcdma": ztxtcdma,
        "ZwdoOrig": zwdoOrig,
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
