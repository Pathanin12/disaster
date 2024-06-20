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
  String? address;
  String? amphure;
  String? tambon;
  String? zipCode;
  String? latitude;
  String? longitude;
  String? province;
  String? note;
  String? createBy;
  List<LogList>? logList;
  bool? isActive;
  bool? isDelete;
  Deceased? deceased;
  Injured? injured;
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
        this.address,
        this.amphure,
        this.tambon,
        this.zipCode,
        this.latitude,
        this.longitude,
        this.province,
        this.note,
        this.createBy,
        this.logList,
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
    address = json['address'];
    amphure = json['amphure'];
    tambon = json['tambon'];
    zipCode = json['zipCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    province = json['province'];
    note = json['note'];
    createBy = json['createBy'];
    if (json['logList'] != null) {
      logList = <LogList>[];
      json['logList'].forEach((v) {
        logList!.add(new LogList.fromJson(v));
      });
    }
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    deceased = json['deceased'] != null
        ? new Deceased.fromJson(json['deceased'])
        : null;
    injured =
    json['injured'] != null ? new Injured.fromJson(json['injured']) : null;
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
    data['address'] = this.address;
    data['amphure'] = this.amphure;
    data['tambon'] = this.tambon;
    data['zipCode'] = this.zipCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['province'] = this.province;
    data['note'] = this.note;
    data['createBy'] = this.createBy;
    if (this.logList != null) {
      data['logList'] = this.logList!.map((v) => v.toJson()).toList();
    }
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

class LogList {
  String? id;
  String? userName;
  String? name;
  String? datetime;
  List<LogDetailList>? logDetailList;
  List<ImageList>? imageList;
  List<FileList>? fileList;

  LogList(
      {this.id,
        this.userName,
        this.name,
        this.datetime,
        this.logDetailList,
        this.imageList,
        this.fileList});

  LogList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    name = json['name'];
    datetime = json['datetime'];
    if (json['logDetailList'] != null) {
      logDetailList = <LogDetailList>[];
      json['logDetailList'].forEach((v) {
        logDetailList!.add(new LogDetailList.fromJson(v));
      });
    }
    if (json['imageList'] != null) {
      imageList = <ImageList>[];
      json['imageList'].forEach((v) {
        imageList!.add(new ImageList.fromJson(v));
      });
    }
    if (json['fileList'] != null) {
      fileList = <FileList>[];
      json['fileList'].forEach((v) {
        fileList!.add(new FileList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['datetime'] = this.datetime;
    if (this.logDetailList != null) {
      data['logDetailList'] =
          this.logDetailList!.map((v) => v.toJson()).toList();
    }
    if (this.imageList != null) {
      data['imageList'] = this.imageList!.map((v) => v.toJson()).toList();
    }
    if (this.fileList != null) {
      data['fileList'] = this.fileList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LogDetailList {
  String? header;
  String? description;

  LogDetailList({this.header, this.description});

  LogDetailList.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['description'] = this.description;
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

class FileList {
  String? file;

  FileList({this.file});

  FileList.fromJson(Map<String, dynamic> json) {
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    return data;
  }
}

class Deceased {
  int? total;
  int? male;
  int? feMale;
  int? unidentify;
  List<DeceaseList>? deceaseList;

  Deceased(
      {this.total, this.male, this.feMale, this.unidentify, this.deceaseList});

  Deceased.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    male = json['male'];
    feMale = json['feMale'];
    unidentify = json['unidentify'];
    if (json['deceaseList'] != null) {
      deceaseList = <DeceaseList>[];
      json['deceaseList'].forEach((v) {
        deceaseList!.add(new DeceaseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['male'] = this.male;
    data['feMale'] = this.feMale;
    data['unidentify'] = this.unidentify;
    if (this.deceaseList != null) {
      data['deceaseList'] = this.deceaseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeceaseList {
  String? name;
  int? sex;
  int? age;

  DeceaseList({this.name, this.sex, this.age});

  DeceaseList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sex = json['sex'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['age'] = this.age;
    return data;
  }
}

class Injured {
  int? total;
  int? male;
  int? feMale;
  int? unidentify;
  List<DeceaseList>? injureList;

  Injured(
      {this.total, this.male, this.feMale, this.unidentify, this.injureList});

  Injured.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    male = json['male'];
    feMale = json['feMale'];
    unidentify = json['unidentify'];
    if (json['injureList'] != null) {
      injureList = <DeceaseList>[];
      json['injureList'].forEach((v) {
        injureList!.add(new DeceaseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['male'] = this.male;
    data['feMale'] = this.feMale;
    data['unidentify'] = this.unidentify;
    if (this.injureList != null) {
      data['injureList'] = this.injureList!.map((v) => v.toJson()).toList();
    }
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
