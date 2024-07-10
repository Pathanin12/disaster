class Dashboard {
  bool? success;
  int? statusTotal;
  int? statusWaiting;
  int? statusInProgress;
  int? statusSuccess;
  List<DashBoardList>? dashBoardList;
  Fire? fire;
  Fire? flood;
  Fire? windstorm;
  Fire? forestFire;

  Dashboard(
      {this.success,
        this.statusTotal,
        this.statusWaiting,
        this.statusInProgress,
        this.statusSuccess,
        this.dashBoardList,
        this.fire,
        this.flood,
        this.windstorm,
        this.forestFire});

  Dashboard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusTotal = json['statusTotal'];
    statusWaiting = json['statusWaiting'];
    statusInProgress = json['statusInProgress'];
    statusSuccess = json['statusSuccess'];
    if (json['dashBoardList'] != null) {
      dashBoardList = <DashBoardList>[];
      json['dashBoardList'].forEach((v) {
        dashBoardList!.add(new DashBoardList.fromJson(v));
      });
    }
    fire = json['fire'] != null ? new Fire.fromJson(json['fire']) : null;
    flood = json['flood'] != null ? new Fire.fromJson(json['flood']) : null;
    windstorm =
    json['windstorm'] != null ? new Fire.fromJson(json['windstorm']) : null;
    forestFire = json['forestFire'] != null
        ? new Fire.fromJson(json['forestFire'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusTotal'] = this.statusTotal;
    data['statusWaiting'] = this.statusWaiting;
    data['statusInProgress'] = this.statusInProgress;
    data['statusSuccess'] = this.statusSuccess;
    if (this.dashBoardList != null) {
      data['dashBoardList'] =
          this.dashBoardList!.map((v) => v.toJson()).toList();
    }
    if (this.fire != null) {
      data['fire'] = this.fire!.toJson();
    }
    if (this.flood != null) {
      data['flood'] = this.flood!.toJson();
    }
    if (this.windstorm != null) {
      data['windstorm'] = this.windstorm!.toJson();
    }
    if (this.forestFire != null) {
      data['forestFire'] = this.forestFire!.toJson();
    }
    return data;
  }
}

class DashBoardList {
  String? eventID;
  int? disasterType;
  int? statusAgency;
  int? statusRelatedAgency;
  int? statusItem;
  String? datetime;
  String? relatedAgency;
  int? violence;
  String? latitude;
  String? longitude;
  String? province;
  int? iconMap;
  Deceased? deceased;
  Deceased? injured;

  DashBoardList(
      {this.eventID,
        this.disasterType,
        this.iconMap,
        this.statusAgency,
        this.statusRelatedAgency,
        this.statusItem,
        this.datetime,
        this.relatedAgency,
        this.violence,
        this.latitude,
        this.longitude,
        this.province,
        this.deceased,
        this.injured});

  DashBoardList.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    iconMap = json['iconMap'];
    disasterType = json['disasterType'];
    statusAgency = json['statusAgency'];
    statusRelatedAgency = json['statusRelatedAgency'];
    statusItem = json['statusItem'];
    datetime = json['datetime'];
    relatedAgency = json['relatedAgency'];
    violence = json['violence'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    province = json['province'];
    deceased = json['deceased'] != null
        ? new Deceased.fromJson(json['deceased'])
        : null;
    injured =
    json['injured'] != null ? new Deceased.fromJson(json['injured']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['iconMap'] = this.iconMap;
    data['disasterType'] = this.disasterType;
    data['statusAgency'] = this.statusAgency;
    data['statusRelatedAgency'] = this.statusRelatedAgency;
    data['statusItem'] = this.statusItem;
    data['datetime'] = this.datetime;
    data['relatedAgency'] = this.relatedAgency;
    data['violence'] = this.violence;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['province'] = this.province;
    if (this.deceased != null) {
      data['deceased'] = this.deceased!.toJson();
    }
    if (this.injured != null) {
      data['injured'] = this.injured!.toJson();
    }
    return data;
  }
}

class Deceased {
  int? total;
  int? male;
  int? feMale;
  int? unidentify;
  int? ageRange;

  Deceased(
      {this.total, this.male, this.feMale, this.unidentify, this.ageRange});

  Deceased.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    male = json['male'];
    feMale = json['feMale'];
    unidentify = json['unidentify'];
    ageRange = json['ageRange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['male'] = this.male;
    data['feMale'] = this.feMale;
    data['unidentify'] = this.unidentify;
    data['ageRange'] = this.ageRange;
    return data;
  }
}

class Fire {
  Gender? gender;
  Gender? ageRange;

  Fire({this.gender, this.ageRange});

  Fire.fromJson(Map<String, dynamic> json) {
    gender =
    json['gender'] != null ? new Gender.fromJson(json['gender']) : null;
    ageRange =
    json['ageRange'] != null ? new Gender.fromJson(json['ageRange']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    if (this.ageRange != null) {
      data['ageRange'] = this.ageRange!.toJson();
    }
    return data;
  }
}

class Gender {
  List<DeceasedList>? deceasedList;
  List<DeceasedList>? injuredList;

  Gender({this.deceasedList, this.injuredList});

  Gender.fromJson(Map<String, dynamic> json) {
    if (json['deceasedList'] != null) {
      deceasedList = <DeceasedList>[];
      json['deceasedList'].forEach((v) {
        deceasedList!.add(new DeceasedList.fromJson(v));
      });
    }
    if (json['injuredList'] != null) {
      injuredList = <DeceasedList>[];
      json['injuredList'].forEach((v) {
        injuredList!.add(new DeceasedList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deceasedList != null) {
      data['deceasedList'] = this.deceasedList!.map((v) => v.toJson()).toList();
    }
    if (this.injuredList != null) {
      data['injuredList'] = this.injuredList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeceasedList {
  String? name;
  int? amount;

  DeceasedList({this.name, this.amount});

  DeceasedList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}

// class Gender {
//   List<DeceasedList>? deceasedList;
//   List<DeceasedList>? injuredList;
//
//   Gender({this.deceasedList, this.injuredList});
//
//   Gender.fromJson(Map<String, dynamic> json) {
//     if (json['deceasedList'] != null) {
//       deceasedList = <Null>[];
//       json['deceasedList'].forEach((v) {
//         deceasedList!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['injuredList'] != null) {
//       injuredList = <Null>[];
//       json['injuredList'].forEach((v) {
//         injuredList!.add(new Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.deceasedList != null) {
//       data['deceasedList'] = this.deceasedList!.map((v) => v.toJson()).toList();
//     }
//     if (this.injuredList != null) {
//       data['injuredList'] = this.injuredList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
