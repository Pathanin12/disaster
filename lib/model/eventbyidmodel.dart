class EventByIDModel {
  bool? success;
  Events? events;
  List<PeopleNewList>? peopleNewList;

  EventByIDModel({this.success, this.events, this.peopleNewList});

  EventByIDModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    events =
    json['events'] != null ? new Events.fromJson(json['events']) : null;
    if (json['peopleNewList'] != null) {
      peopleNewList = <PeopleNewList>[];
      json['peopleNewList'].forEach((v) {
        peopleNewList!.add(new PeopleNewList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.events != null) {
      data['events'] = this.events!.toJson();
    }
    if (this.peopleNewList != null) {
      data['peopleNewList'] =
          this.peopleNewList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
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
  Deceased? deceased;
  Deceased? injured;
  List<ImageList>? imageList;

  Events(
      {this.eventID,
        this.disasterType,
        this.eventName,
        this.statusAgency,
        this.statusRelatedAgency,
        this.statusItem,
        this.datetime,
        this.relatedAgency,
        this.responsibleAgency,
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
        this.deceased,
        this.injured,
        this.imageList});

  Events.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    disasterType = json['disasterType'];
    eventName = json['eventName'];
    statusAgency = json['statusAgency'];
    statusRelatedAgency = json['statusRelatedAgency'];
    statusItem = json['statusItem'];
    datetime = json['datetime'];
    relatedAgency = json['relatedAgency'];
    responsibleAgency = json['responsibleAgency'];
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
    deceased = json['deceased'] != null
        ? new Deceased.fromJson(json['deceased'])
        : null;
    injured =
    json['injured'] != null ? new Deceased.fromJson(json['injured']) : null;
    if (json['imageList'] != null) {
      imageList = <ImageList>[];
      json['imageList'].forEach((v) {
        imageList!.add(new ImageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['disasterType'] = this.disasterType;
    data['eventName'] = this.eventName;
    data['statusAgency'] = this.statusAgency;
    data['statusRelatedAgency'] = this.statusRelatedAgency;
    data['statusItem'] = this.statusItem;
    data['datetime'] = this.datetime;
    data['relatedAgency'] = this.relatedAgency;
    data['responsibleAgency'] = this.responsibleAgency;
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
    if (this.deceased != null) {
      data['deceased'] = this.deceased!.toJson();
    }
    if (this.injured != null) {
      data['injured'] = this.injured!.toJson();
    }
    if (this.imageList != null) {
      data['imageList'] = this.imageList!.map((v) => v.toJson()).toList();
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

class ImageList {
  String? pathImage;
  String? imageName;

  ImageList({this.pathImage, this.imageName});

  ImageList.fromJson(Map<String, dynamic> json) {
    pathImage = json['pathImage'];
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pathImage'] = this.pathImage;
    data['imageName'] = this.imageName;
    return data;
  }
}

class PeopleNewList {
  String? name;
  bool? anonymous;
  String? note;
  String? createDatetime;
  List<ImageList>? imageNewsList;

  PeopleNewList(
      {this.name,
        this.anonymous,
        this.note,
        this.createDatetime,
        this.imageNewsList});

  PeopleNewList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    anonymous = json['anonymous'];
    note = json['note'];
    createDatetime = json['createDatetime'];
    if (json['imageNewsList'] != null) {
      imageNewsList = <ImageList>[];
      json['imageNewsList'].forEach((v) {
        imageNewsList!.add(new ImageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['anonymous'] = this.anonymous;
    data['note'] = this.note;
    data['createDatetime'] = this.createDatetime;
    if (this.imageNewsList != null) {
      data['imageNewsList'] =
          this.imageNewsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
