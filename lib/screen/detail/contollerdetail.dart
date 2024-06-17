import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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
  Future<void> getEvent(String id)async{
    dataEvent=EventByIDModel().obs;
    dataEvent.value=await getEventByIDApi(Id: id);
  }
  

}