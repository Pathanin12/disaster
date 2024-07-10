class EvenNameModel {
  bool? success;
  List<EventList>? eventList;

  EvenNameModel({this.success, this.eventList});

  EvenNameModel.fromJson(Map<String, dynamic> json) {
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
  String? eventName;

  EventList({this.eventID, this.eventName});

  EventList.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    eventName = json['eventName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    data['eventName'] = this.eventName;
    return data;
  }
}
