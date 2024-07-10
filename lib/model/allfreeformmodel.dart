// class EventAllFreeFormModel {
//   bool? success;
//   int? totalPages;
//   List<EventList>? eventList;
//
//   EventAllFreeFormModel({this.success, this.totalPages, this.eventList});
//
//   EventAllFreeFormModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     totalPages = json['totalPages'];
//     if (json['eventList'] != null) {
//       eventList = <EventList>[];
//       json['eventList'].forEach((v) {
//         eventList!.add( EventList.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     data['totalPages'] = this.totalPages;
//     if (this.eventList != null) {
//       data['eventList'] = this.eventList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class EventList {
//   String? eventID;
//   String? eventName;
//   int? statusAgency;
//   int? statusItem;
//   int? seq;
//   String? datetime;
//   String? responsibleAgency;
//   String? latitude;
//   String? longitude;
//   String? province;
//   bool? isActive;
//   bool? isDelete;
//
//   EventList(
//       {this.eventID,
//         this.eventName,
//         this.statusAgency,
//         this.statusItem,
//         this.seq,
//         this.datetime,
//         this.responsibleAgency,
//         this.latitude,
//         this.longitude,
//         this.province,
//         this.isActive,
//         this.isDelete});
//
//   EventList.fromJson(Map<String, dynamic> json) {
//     eventID = json['eventID'];
//     eventName = json['eventName'];
//     statusAgency = json['statusAgency'];
//     statusItem = json['statusItem'];
//     seq = json['seq'];
//     datetime = json['datetime'];
//     responsibleAgency = json['responsibleAgency'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     province = json['province'];
//     isActive = json['isActive'];
//     isDelete = json['isDelete'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['eventID'] = this.eventID;
//     data['eventName'] = this.eventName;
//     data['statusAgency'] = this.statusAgency;
//     data['statusItem'] = this.statusItem;
//     data['seq'] = this.seq;
//     data['datetime'] = this.datetime;
//     data['responsibleAgency'] = this.responsibleAgency;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['province'] = this.province;
//     data['isActive'] = this.isActive;
//     data['isDelete'] = this.isDelete;
//     return data;
//   }
// }
