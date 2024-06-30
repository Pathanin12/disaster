import 'package:get/get.dart';

import '../../api/systemadminapi/sytemadmin.dart';
import '../../model/systemmodel.dart';

class ContollerSystemAdmin extends GetxController {
  var title ='จัดการผู้ใช้'.obs;
  var dataAdmin = SystemAdminModel().obs;


  getData()async{
    dataAdmin.value =await getAllAdmin();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}