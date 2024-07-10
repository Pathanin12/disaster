class EventByIDModel {
  bool? success;
  Events? events;
  List<PeopleNewList>? peopleNewList;
  Graph? graph;

  EventByIDModel({this.success, this.events, this.peopleNewList, this.graph});

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
    graph = json['graph'] != null ? new Graph.fromJson(json['graph']) : null;
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
    if (this.graph != null) {
      data['graph'] = this.graph!.toJson();
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
  int? iconMap;
  String? address;
  String? tambon;
  String? amphure;
  String? province;
  String? zipCode;
  String? note;
  String? createBy;
  List<LogList>? logList;
  List<FreeFormDetailList>? freeFormDetailList;
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
        this.iconMap,
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
        this.logList,
        this.isActive,
        this.isDelete,
        this.deceased,
        this.injured,
        this.imageList,
      this.freeFormDetailList});

  Events.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    iconMap = json['iconMap'];
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
    if (json['logList'] != null) {
      logList = <LogList>[];
      json['logList'].forEach((v) {
        logList!.add(new LogList.fromJson(v));
      });
    }
    if (json['freeFormDetailList'] != null) {
      freeFormDetailList = <FreeFormDetailList>[];
      json['freeFormDetailList'].forEach((v) {
        freeFormDetailList!.add(new FreeFormDetailList.fromJson(v));
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
    data['iconMap'] = this.iconMap;
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
    if (this.logList != null) {
      data['logList'] = this.logList!.map((v) => v.toJson()).toList();
    }
    if (this.freeFormDetailList != null) {
      data['freeFormDetailList'] =
          this.freeFormDetailList!.map((v) => v.toJson()).toList();
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
class FreeFormDetailList {
  String? id;
  String? section;
  String? description;
  int? types;
  List<FreeFormSubDetailList>? freeFormSubDetailList;

  FreeFormDetailList(
      {this.id,
        this.section,
        this.description,
        this.types,
        this.freeFormSubDetailList});

  FreeFormDetailList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['id'] = this.id;
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
class ImageListDetail {
  String? image;

  ImageListDetail({this.image});

  ImageListDetail.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
class FreeFormSubDetailList {
  String? id;
  String? optionName;
  List<TextboxList>? textboxList;
  List<ImageListDetail>? imageList;
  List<FileList>? fileList;
  int? amount;
  String? color;

  FreeFormSubDetailList(
      {this.id,
        this.optionName,
        this.textboxList,
        this.imageList,
        this.fileList,
        this.amount,
        this.color});

  FreeFormSubDetailList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optionName = json['optionName'];
    if (json['textboxList'] != null) {
      textboxList = <TextboxList>[];
      json['textboxList'].forEach((v) {
        textboxList!.add(new TextboxList.fromJson(v));
      });
    }
    if (json['imageList'] != null) {
      imageList = <ImageListDetail>[];
      json['imageList'].forEach((v) {
        imageList!.add(new ImageListDetail.fromJson(v));
      });
    }
    if (json['fileList'] != null) {
      fileList = <FileList>[];
      json['fileList'].forEach((v) {
        fileList!.add(new FileList.fromJson(v));
      });
    }
    amount = json['amount'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['optionName'] = this.optionName;
    if (this.textboxList != null) {
      data['textboxList'] = this.textboxList!.map((v) => v.toJson()).toList();
    }
    if (this.imageList != null) {
      data['imageList'] = this.imageList!.map((v) => v.toJson()).toList();
    }
    if (this.fileList != null) {
      data['fileList'] = this.fileList!.map((v) => v.toJson()).toList();
    }
    data['amount'] = this.amount;
    data['color'] = this.color;
    return data;
  }
}

class TextboxList {
  String? name;
  String? answer;

  TextboxList({this.name, this.answer});

  TextboxList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['answer'] = this.answer;
    return data;
  }
}

class LogList {
  String? id;
  String? userName;
  String? name;
  String? reportDetail;
  String? datetime;
  List<LogDetailList>? logDetailList;
  List<imageListLog>? imageList;
  List<FileList>? fileList;

  LogList(
      {this.id,
        this.userName,
        this.name,
        this.datetime,
        this.reportDetail,
        this.logDetailList,
        this.imageList,
        this.fileList});

  LogList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    name = json['name'];
    reportDetail=json['reportDetail'];
    datetime = json['datetime'];
    if (json['logDetailList'] != null) {
      logDetailList = <LogDetailList>[];
      json['logDetailList'].forEach((v) {
        logDetailList!.add(new LogDetailList.fromJson(v));
      });
    }
    if (json['imageList'] != null) {
      imageList = <imageListLog>[];
      json['imageList'].forEach((v) {
        imageList!.add(new imageListLog.fromJson(v));
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
    data['reportDetail']=this.reportDetail;
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
class imageListLog {
  String? image;

  imageListLog({this.image});

  imageListLog.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
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
  String? fileName;

  FileList({this.file,this.fileName});

  FileList.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    fileName=json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['fileName']=this.fileName;
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
  String? id;
  String? name;
  int? sex;
  int? age;

  DeceaseList({this.id, this.name, this.sex, this.age});

  DeceaseList.fromJson(Map<String, dynamic> json) {
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

class Graph {
  Gender? gender;
  Gender? ageRange;

  Graph({this.gender, this.ageRange});

  Graph.fromJson(Map<String, dynamic> json) {
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
