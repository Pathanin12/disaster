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
  String? address;
  String? tambon;
  String? amphure;
  String? province;
  String? zipCode;
  String? note;
  String? createBy;
  UpdateBy? updateBy;
  bool? isActive;
  bool? isDelete;
  List<ImageList>? imageList;
  List<ImageDeleteList>? imageDeleteList;
  Deceased? deceased;
  Injured? injured;

  CreateEven(
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
        this.address,
        this.tambon,
        this.amphure,
        this.province,
        this.zipCode,
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
    datetime = json['datetime'];
    relatedAgency = json['relatedAgency'];
    responsibleAgency = json['responsibleAgency'];
    receiveFrom = json['receiveFrom'];
    violence = json['violence'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    tambon = json['tambon'];
    amphure = json['amphure'];
    province = json['province'];
    zipCode = json['zipCode'];
    note = json['note'];
    createBy = json['createBy'];
    updateBy = json['updateBy'] != null
        ? new UpdateBy.fromJson(json['updateBy'])
        : null;
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
    json['injured'] != null ? new Injured.fromJson(json['injured']) : null;
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
    data['address'] = this.address;
    data['tambon'] = this.tambon;
    data['amphure'] = this.amphure;
    data['province'] = this.province;
    data['zipCode'] = this.zipCode;
    data['note'] = this.note;
    data['createBy'] = this.createBy;
    if (this.updateBy != null) {
      data['updateBy'] = this.updateBy!.toJson();
    }
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

class UpdateBy {
  String? staffID;
  String? userName;
  String? name;
  String? datetime;
  List<LogList>? logList;
  List<ImageList>? imageList;
  List<FileList>? fileList;

  UpdateBy(
      {this.staffID,
        this.userName,
        this.name,
        this.datetime,
        this.logList,
        this.imageList,
        this.fileList});

  UpdateBy.fromJson(Map<String, dynamic> json) {
    staffID = json['staffID'];
    userName = json['userName'];
    name = json['name'];
    datetime = json['datetime'];
    if (json['logList'] != null) {
      logList = <LogList>[];
      json['logList'].forEach((v) {
        logList!.add(new LogList.fromJson(v));
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
    data['staffID'] = this.staffID;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['datetime'] = this.datetime;
    if (this.logList != null) {
      data['logList'] = this.logList!.map((v) => v.toJson()).toList();
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

class LogList {
  String? header;
  String? description;

  LogList({this.header, this.description});

  LogList.fromJson(Map<String, dynamic> json) {
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
