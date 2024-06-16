class CreateEven {
  String? eventID;
  int? disasterType;
  String? eventName;
  int? statusAgency;
  int? statusRelatedAgency;
  int? statusItem;
  String? datetime;
  String? relatedAgency;
  String? responsibleAgency;
  String? receiveFrom;
  int? violence;
  String? latitude;
  String? longitude;
  String? province;
  String? note;
  String? createBy;
  String? updateBy;
  bool? isActive;
  bool? isDelete;
  List<ImageList>? imageList;
  List<ImageDeleteList>? imageDeleteList;
  Deceased? deceased;
  Deceased? injured;

  CreateEven(
      {this.eventID,
        this.disasterType,
        this.eventName,
        this.statusAgency,
        this.statusRelatedAgency,
        this.statusItem,
        this.responsibleAgency,
        this.datetime,
        this.relatedAgency,
        this.receiveFrom,
        this.violence,
        this.latitude,
        this.longitude,
        this.province,
        this.note,
        this.createBy,
        this.updateBy,
        this.isActive,
        this.isDelete,
        this.imageList,
        this.imageDeleteList,
        this.deceased,
        this.injured});

  CreateEven.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    disasterType = json['disasterType'];
    eventName = json['eventName'];
    statusAgency = json['statusAgency'];
    statusRelatedAgency = json['statusRelatedAgency'];
    statusItem = json['statusItem'];
    responsibleAgency=json['responsibleAgency'];
    datetime = json['datetime'];
    relatedAgency = json['relatedAgency'];
    receiveFrom = json['receiveFrom'];
    violence = json['violence'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    province = json['province'];
    note = json['note'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    if (json['imageList'] != null) {
      imageList = <ImageList>[];
      json['imageList'].forEach((v) {
        imageList!.add(new ImageList.fromJson(v));
      });
    }
    if (json['imageDeleteList'] != null) {
      imageDeleteList = <ImageDeleteList>[];
      json['imageDeleteList'].forEach((v) {
        imageDeleteList!.add(new ImageDeleteList.fromJson(v));
      });
    }
    deceased = json['deceased'] != null
        ? new Deceased.fromJson(json['deceased'])
        : null;
    injured =
    json['injured'] != null ? new Deceased.fromJson(json['injured']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['disasterType'] = this.disasterType;
    data['eventName'] = this.eventName;
    data['statusAgency'] = this.statusAgency;
    data['statusRelatedAgency'] = this.statusRelatedAgency;
    data['statusItem'] = this.statusItem;
    data['responsibleAgency']=this.responsibleAgency;
    data['datetime'] = this.datetime;
    data['relatedAgency'] = this.relatedAgency;
    data['receiveFrom'] = this.receiveFrom;
    data['violence'] = this.violence;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['province'] = this.province;
    data['note'] = this.note;
    data['createBy'] = this.createBy;
    data['updateBy'] = this.updateBy;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    if (this.imageList != null) {
      data['imageList'] = this.imageList!.map((v) => v.toJson()).toList();
    }
    if (this.imageDeleteList != null) {
      data['imageDeleteList'] =
          this.imageDeleteList!.map((v) => v.toJson()).toList();
    }
    if (this.deceased != null) {
      data['deceased'] = this.deceased!.toJson();
    }
    if (this.injured != null) {
      data['injured'] = this.injured!.toJson();
    }
    return data;
  }
}

class ImageList {
  String? image;

  ImageList({this.image});

  ImageList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class ImageDeleteList {
  String? imageName;

  ImageDeleteList({this.imageName});

  ImageDeleteList.fromJson(Map<String, dynamic> json) {
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageName'] = this.imageName;
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
