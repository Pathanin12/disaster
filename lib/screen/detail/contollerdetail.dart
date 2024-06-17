import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';

import '../../api/eventbyidapi.dart';
import '../../model/eventbyidmodel.dart';

class ContollerDetail extends GetxController {
  final mapController = MapController().obs;
  var pageName='ข้อมูลรายงาน'.obs;
  var dataEvent= EventByIDModel().obs;
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
  Future<void> getEvent(String id)async{
    dataEvent=EventByIDModel().obs;
    dataEvent.value=await getEventByIDApi(Id: id);
    mapController.value.move(
        LatLng(double.parse(dataEvent.value.events!.latitude!), double.parse(dataEvent.value.events!.longitude!)), 14);
  }
  

}