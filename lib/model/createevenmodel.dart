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
  bool? isActive;
  bool? isDelete;
  List<ImageList>? imageList;
  List<ImageDeleteList>? imageDeleteList;
  Deceased? deceased;
  Injured? injured;
  List<FreeFormDetailList>? freeFormDetailList;
  List<FreeFormAnswerList>? freeFormAnswerList;
  UpdateBy? updateBy;

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
        this.isActive,
        this.isDelete,
        this.imageList,
        this.imageDeleteList,
        this.deceased,
        this.injured,
        this.freeFormDetailList,
        this.freeFormAnswerList,
        this.updateBy});

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
    if (json['freeFormDetailList'] != null) {
      freeFormDetailList = <FreeFormDetailList>[];
      json['freeFormDetailList'].forEach((v) {
        freeFormDetailList!.add(new FreeFormDetailList.fromJson(v));
      });
    }
    if (json['freeFormAnswerList'] != null) {
      freeFormAnswerList = <FreeFormAnswerList>[];
      json['freeFormAnswerList'].forEach((v) {
        freeFormAnswerList!.add(new FreeFormAnswerList.fromJson(v));
      });
    }
    updateBy = json['updateBy'] != null
        ? new UpdateBy.fromJson(json['updateBy'])
        : null;
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
    if (this.freeFormDetailList != null) {
      data['freeFormDetailList'] =
          this.freeFormDetailList!.map((v) => v.toJson()).toList();
    }
    if (this.freeFormAnswerList != null) {
      data['freeFormAnswerList'] =
          this.freeFormAnswerList!.map((v) => v.toJson()).toList();
    }
    if (this.updateBy != null) {
      data['updateBy'] = this.updateBy!.toJson();
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
  List<DeceaseList>? deceaseList;
  List<UpdateDeceasedList>? updateDeceasedList;
  List<RemoveDeceasedList>? removeDeceasedList;

  Deceased(
      {this.total,
        this.male,
        this.feMale,
        this.unidentify,
        this.deceaseList,
        this.updateDeceasedList,
        this.removeDeceasedList});

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
    if (json['updateDeceasedList'] != null) {
      updateDeceasedList = <UpdateDeceasedList>[];
      json['updateDeceasedList'].forEach((v) {
        updateDeceasedList!.add(new UpdateDeceasedList.fromJson(v));
      });
    }
    if (json['removeDeceasedList'] != null) {
      removeDeceasedList = <RemoveDeceasedList>[];
      json['removeDeceasedList'].forEach((v) {
        removeDeceasedList!.add(new RemoveDeceasedList.fromJson(v));
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
    if (this.updateDeceasedList != null) {
      data['updateDeceasedList'] =
          this.updateDeceasedList!.map((v) => v.toJson()).toList();
    }
    if (this.removeDeceasedList != null) {
      data['removeDeceasedList'] =
          this.removeDeceasedList!.map((v) => v.toJson()).toList();
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

class UpdateDeceasedList {
  String? id;
  String? name;
  String? sex;
  String? age;

  UpdateDeceasedList({this.id, this.name, this.sex, this.age});

  UpdateDeceasedList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sex = json['sex'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['age'] = this.age;
    return data;
  }
}

class RemoveDeceasedList {
  String? id;

  RemoveDeceasedList({this.id});

  RemoveDeceasedList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Injured {
  int? total;
  int? male;
  int? feMale;
  int? unidentify;
  List<DeceaseList>? injureList;
  List<UpdateDeceasedList>? updateInjuredList;
  List<RemoveDeceasedList>? removeInjuredList;

  Injured(
      {this.total,
        this.male,
        this.feMale,
        this.unidentify,
        this.injureList,
        this.updateInjuredList,
        this.removeInjuredList});

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
    if (json['updateInjuredList'] != null) {
      updateInjuredList = <UpdateDeceasedList>[];
      json['updateInjuredList'].forEach((v) {
        updateInjuredList!.add(new UpdateDeceasedList.fromJson(v));
      });
    }
    if (json['removeInjuredList'] != null) {
      removeInjuredList = <RemoveDeceasedList>[];
      json['removeInjuredList'].forEach((v) {
        removeInjuredList!.add(new RemoveDeceasedList.fromJson(v));
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
    if (this.updateInjuredList != null) {
      data['updateInjuredList'] =
          this.updateInjuredList!.map((v) => v.toJson()).toList();
    }
    if (this.removeInjuredList != null) {
      data['removeInjuredList'] =
          this.removeInjuredList!.map((v) => v.toJson()).toList();
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

class FreeFormAnswerList {
  String? id;
  String? answer;
  String? fileName;
  String? image;
  String? file;
  List<FreeFormAnswerDetailList>? freeFormAnswerDetailList;

  FreeFormAnswerList(
      {this.id,
        this.answer,
        this.fileName,
        this.image,
        this.file,
        this.freeFormAnswerDetailList});

  FreeFormAnswerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    fileName = json['fileName'];
    image = json['image'];
    file = json['file'];
    if (json['freeFormAnswerDetailList'] != null) {
      freeFormAnswerDetailList = <FreeFormAnswerDetailList>[];
      json['freeFormAnswerDetailList'].forEach((v) {
        freeFormAnswerDetailList!.add(new FreeFormAnswerDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['fileName'] = this.fileName;
    data['image'] = this.image;
    data['file'] = this.file;
    if (this.freeFormAnswerDetailList != null) {
      data['freeFormAnswerDetailList'] =
          this.freeFormAnswerDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeFormAnswerDetailList {
  String? id;

  FreeFormAnswerDetailList({this.id});

  FreeFormAnswerDetailList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}


class UpdateBy {
  String? staffID;
  String? userName;
  String? name;
  String? datetime;
  List<LogList>? logList;
  String? reportDetail;
  List<ImageList>? imageList;
  List<FileList>? fileList;

  UpdateBy(
      {this.staffID,
        this.userName,
        this.name,
        this.datetime,
        this.logList,
        this.reportDetail,
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
    reportDetail = json['reportDetail'];
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
    data['reportDetail'] = this.reportDetail;
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

class FileList {
  String? fileName;
  String? file;

  FileList({this.fileName, this.file});

  FileList.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['file'] = this.file;
    return data;
  }
}
