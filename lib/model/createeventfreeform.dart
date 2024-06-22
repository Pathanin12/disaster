class CreateEventFreeForm {
  String? eventID;
  String? eventName;
  int? statusAgency;
  int? statusItem;
  String? datetime;
  String? responsibleAgency;
  String? latitude;
  String? longitude;
  String? address;
  String? tambon;
  String? amphure;
  String? province;
  String? zipCode;
  String? createBy;
  List<FreeFormDetailList>? freeFormDetailList;

  CreateEventFreeForm(
      {this.eventID,
      this.eventName,
      this.statusAgency,
      this.statusItem,
      this.datetime,
      this.responsibleAgency,
      this.latitude,
      this.longitude,
      this.address,
      this.tambon,
      this.amphure,
      this.province,
      this.zipCode,
      this.createBy,
      this.freeFormDetailList});

  CreateEventFreeForm.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    eventName = json['eventName'];
    statusAgency = json['statusAgency'];
    statusItem = json['statusItem'];
    datetime = json['datetime'];
    responsibleAgency = json['responsibleAgency'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    tambon = json['tambon'];
    amphure = json['amphure'];
    province = json['province'];
    zipCode = json['zipCode'];
    createBy = json['createBy'];
    if (json['freeFormDetailList'] != null) {
      freeFormDetailList = <FreeFormDetailList>[];
      json['freeFormDetailList'].forEach((v) {
        freeFormDetailList!.add(new FreeFormDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['eventName'] = this.eventName;
    data['statusAgency'] = this.statusAgency;
    data['statusItem'] = this.statusItem;
    data['datetime'] = this.datetime;
    data['responsibleAgency'] = this.responsibleAgency;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['tambon'] = this.tambon;
    data['amphure'] = this.amphure;
    data['province'] = this.province;
    data['zipCode'] = this.zipCode;
    data['createBy'] = this.createBy;
    if (this.freeFormDetailList != null) {
      data['freeFormDetailList'] =
          this.freeFormDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeFormDetailList {
  String? section;
  String? description;
  int? types;
  List<FreeFormSubDetailList>? freeFormSubDetailList;

  FreeFormDetailList(
      {this.section, this.description, this.types, this.freeFormSubDetailList});

  FreeFormDetailList.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    description = json['description'];
    types = json['types'];
    if (json['freeFormSubDetailList'] != null) {
      freeFormSubDetailList = <FreeFormSubDetailList>[];
      json['freeFormSubDetailList'].forEach((v) {
        freeFormSubDetailList!.add(new FreeFormSubDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['description'] = this.description;
    data['types'] = this.types;
    if (this.freeFormSubDetailList != null) {
      data['freeFormSubDetailList'] =
          this.freeFormSubDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeFormSubDetailList {
  String? optionName;

  FreeFormSubDetailList({this.optionName});

  FreeFormSubDetailList.fromJson(Map<String, dynamic> json) {
    optionName = json['optionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['optionName'] = this.optionName;
    return data;
  }
}
