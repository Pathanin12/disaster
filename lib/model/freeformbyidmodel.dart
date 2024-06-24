class EventAllFreeFormByIDModel {
  bool? success;
  Events? events;
  List<PeopleNewList>? peopleNewList;

  EventAllFreeFormByIDModel({this.success, this.events, this.peopleNewList});

  EventAllFreeFormByIDModel.fromJson(Map<String, dynamic> json) {
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
  String? eventName;
  int? statusAgency;
  int? statusItem;
  String? datetime;
  String? responsibleAgency;
  String? latitude;
  String? longitude;
  String? address;
  String? amphure;
  String? tambon;
  String? province;
  String? zipCode;
  String? createBy;
  List<FreeFormDetailList>? freeFormDetailList;
  List<LogList>? logList;
  bool? isActive;
  bool? isDelete;

  Events(
      {this.eventID,
        this.eventName,
        this.statusAgency,
        this.statusItem,
        this.datetime,
        this.responsibleAgency,
        this.latitude,
        this.longitude,
        this.address,
        this.amphure,
        this.tambon,
        this.province,
        this.zipCode,
        this.createBy,
        this.freeFormDetailList,
        this.logList,
        this.isActive,
        this.isDelete});

  Events.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    eventName = json['eventName'];
    statusAgency = json['statusAgency'];
    statusItem = json['statusItem'];
    datetime = json['datetime'];
    responsibleAgency = json['responsibleAgency'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    amphure = json['amphure'];
    tambon = json['tambon'];
    province = json['province'];
    zipCode = json['zipCode'];
    createBy = json['createBy'];
    if (json['freeFormDetailList'] != null) {
      freeFormDetailList = <FreeFormDetailList>[];
      json['freeFormDetailList'].forEach((v) {
        freeFormDetailList!.add(new FreeFormDetailList.fromJson(v));
      });
    }
    if (json['logList'] != null) {
      logList = <LogList>[];
      json['logList'].forEach((v) {
        logList!.add(new LogList.fromJson(v));
      });
    }
    isActive = json['isActive'];
    isDelete = json['isDelete'];
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
    data['amphure'] = this.amphure;
    data['tambon'] = this.tambon;
    data['province'] = this.province;
    data['zipCode'] = this.zipCode;
    data['createBy'] = this.createBy;
    if (this.freeFormDetailList != null) {
      data['freeFormDetailList'] =
          this.freeFormDetailList!.map((v) => v.toJson()).toList();
    }
    if (this.logList != null) {
      data['logList'] = this.logList!.map((v) => v.toJson()).toList();
    }
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
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

// class FileList {
//   String? fileName;
//   String? file;
//
//   FileList({this.fileName, this.file});
//
//   FileList.fromJson(Map<String, dynamic> json) {
//     fileName = json['fileName'];
//     file = json['file'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fileName'] = this.fileName;
//     data['file'] = this.file;
//     return data;
//   }
// }


class LogList {
  String? staffID;
  String? userName;
  String? name;
  String? datetime;
  List<LogDetailList>? logDetailList;
  String? reportDetail;
  List<ImageList>? imageList;
  List<FileList>? fileList;

  LogList(
      {this.staffID,
        this.userName,
        this.name,
        this.datetime,
        this.logDetailList,
        this.reportDetail,
        this.imageList,
        this.fileList});

  LogList.fromJson(Map<String, dynamic> json) {
    staffID = json['staffID'];
    userName = json['userName'];
    name = json['name'];
    datetime = json['datetime'];
    if (json['logDetailList'] != null) {
      logDetailList = <LogDetailList>[];
      json['logDetailList'].forEach((v) {
        logDetailList!.add(new LogDetailList.fromJson(v));
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
    if (this.logDetailList != null) {
      data['logDetailList'] =
          this.logDetailList!.map((v) => v.toJson()).toList();
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
  String? image;
  String? pathImage;
  String? imageName;

  ImageList({this.image, this.pathImage, this.imageName});

  ImageList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    pathImage = json['pathImage'];
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['pathImage'] = this.pathImage;
    data['imageName'] = this.imageName;
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

class PeopleNewList {
  String? name;
  bool? anonymous;
  String? note;
  String? createDatetime;
  List<ImageNewsList>? imageNewsList;

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
      imageNewsList = <ImageNewsList>[];
      json['imageNewsList'].forEach((v) {
        imageNewsList!.add(new ImageNewsList.fromJson(v));
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

class ImageNewsList {
  String? pathImage;
  String? imageName;

  ImageNewsList({this.pathImage, this.imageName});

  ImageNewsList.fromJson(Map<String, dynamic> json) {
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
