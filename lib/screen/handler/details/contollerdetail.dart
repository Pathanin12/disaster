import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';

import '../../../api/eventbyidapi.dart';
import '../../../api/map/searchmap.dart';
import '../../../model/eventbyidmodel.dart';
import '../../../model/searchmap.dart';

class ContollerDetailz extends GetxController {
  final mapController = MapController().obs;
  var pageName = 'ข้อมูลรายงาน'.obs;
  var dataEvent = EventByIDModel().obs;
  var listSearchMap = <SearchMapModel>[].obs;
  var search = TextEditingController().obs;
  searchMap(String data) async {
    listSearchMap.value = await searchMapApi(data);
  }

  List<String> category = [
    "อัคคีภัย",
    "อุทกภัย",
    "วาตภัย",
    "ไฟป่า",
  ];
  List<String> StatusList = [
    "รับเรื่อง",
    "กำลังดำเนินการ",
    "เสร็จสิ้น",
  ];
  Future<void> getEvent(String id) async {
    dataEvent = EventByIDModel().obs;
    dataEvent.value = await getEventByIDApi(Id: id);
    mapController.value.move(
        LatLng(double.parse(dataEvent.value.events!.latitude!),
            double.parse(dataEvent.value.events!.longitude!)),
        14);
  }
}
