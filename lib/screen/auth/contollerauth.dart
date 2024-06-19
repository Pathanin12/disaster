import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class ContollerAuth extends GetxController {
 var r =  ''.obs;

 @override
  void onInit() {
    // TODO: implement onInit
    r.value=Get.parameters['value']??'';
  }
}