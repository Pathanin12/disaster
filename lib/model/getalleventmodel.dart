class GetAllEventModel {
  bool? success;
  List<EventList>? eventList;

  GetAllEventModel({this.success, this.eventList});

  GetAllEventModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['eventList'] != null) {
      eventList = <EventList>[];
      json['eventList'].forEach((v) {
        eventList!.add(new EventList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.eventList != null) {
      data['eventList'] = this.eventList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventList {
  String? eventID;
  int? disasterType;
  String? eventName;
  int? statusAgency;
  int? statusRelatedAgency;
  int? statusItem;
  int? seq;
  String? datetime;
  String? relatedAgency;
  String? responsibleAgency;
  String? receiveFrom;
  int? violence;
  String? latitude;
  String? longitude;
  String? province;
  String? note;
  bool? isActive;
  bool? isDelete;

  EventList(
      {this.eventID,
        this.disasterType,
        this.eventName,
        this.statusAgency,
        this.statusRelatedAgency,
        this.statusItem,
        this.seq,
        this.datetime,
        this.relatedAgency,
        this.responsibleAgency,
        this.receiveFrom,
        this.violence,
        this.latitude,
        this.longitude,
        this.province,
        this.note,
        this.isActive,
        this.isDelete});

  EventList.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    disasterType = json['disasterType'];
    eventName = json['eventName'];
    statusAgency = json['statusAgency'];
    statusRelatedAgency = json['statusRelatedAgency'];
    statusItem = json['statusItem'];
    seq = json['seq'];
    datetime = json['datetime'];
    relatedAgency = json['relatedAgency'];
    responsibleAgency = json['responsibleAgency'];
    receiveFrom = json['receiveFrom'];
    violence = json['violence'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    province = json['province'];
    note = json['note'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['disasterType'] = this.disasterType;
    data['eventName'] = this.eventName;
    data['statusAgency'] = this.statusAgency;
    data['statusRelatedAgency'] = this.statusRelatedAgency;
    data['statusItem'] = this.statusItem;
    data['seq'] = this.seq;
    data['datetime'] = this.datetime;
    data['relatedAgency'] = this.relatedAgency;
    data['responsibleAgency'] = this.responsibleAgency;
    data['receiveFrom'] = this.receiveFrom;
    data['violence'] = this.violence;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['province'] = this.province;
    data['note'] = this.note;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    return data;
  }
}
