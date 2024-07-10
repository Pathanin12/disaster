import 'package:get/get.dart';

import '../../api/systemadminapi/sytemadmin.dart';
import '../../model/systemmodel.dart';

class ContollerSystemAdmin extends GetxController {
  var title ='จัดการผู้ใช้'.obs;
  var dataAdmin = SystemAdminModel().obs;
  var dropdownListAdmin =<String>[].obs;

  var listAdmin=[
    "admin",
    "organizer",
    "guest"
  ].obs;

  getData()async{
    dataAdmin.value =await getAllAdmin();
    dataAdmin.value.userList!.forEach((element) {
      dropdownListAdmin.add(listAdmin[element.role!-1]);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}