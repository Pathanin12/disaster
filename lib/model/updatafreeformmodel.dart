class UpdateEventFreeForm {
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
  List<FreeFormAnswerList>? freeFormAnswerList;
  UpdateBy? updateBy;

  UpdateEventFreeForm(
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
        this.freeFormDetailList,
        this.freeFormAnswerList,
        this.updateBy});

  UpdateEventFreeForm.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? file;
  List<FreeFormAnswerDetailList>? freeFormAnswerDetailList;

  FreeFormAnswerList(
      {this.id,
        this.answer,
        this.image,
        this.file,
        this.freeFormAnswerDetailList});

  FreeFormAnswerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
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
