import 'package:disaster/stye/colors.dart';
import 'package:disaster/stye/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';

import '../../api/eventbyidapi.dart';
import '../../api/map/searchmap.dart';
import '../../model/eventbyidmodel.dart';
import '../../model/searchmap.dart';

class ContollerDetail extends GetxController {
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

  dialogListName(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.75,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5,top: 5),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              CupertinoIcons.multiply,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'รายชื่อ',
                              style: textStyle(context,
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(height: 10,),
                      Container(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          width: MediaQuery.of(context).size.height * 0.75,
                          height:
                              MediaQuery.of(context).size.height * 0.65 - 120,
                          child: ListView(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'ผู้เสียชีวิต',
                                    style: textStyle(context,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataEvent.value.events!.deceased!.deceaseList!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 5,top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${index+1}. ${dataEvent.value.events!.deceased!.deceaseList![index].name} เพศ ${dataEvent.value.events!.deceased!.deceaseList![index].sex} อายุ ${dataEvent.value.events!.deceased!.deceaseList![index].age} ปี',
                                          style: textStyle(context,
                                              fontSize: 13,
                                            ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 15,),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'ผู้ได้รับบาดเจ็บ',
                                    style: textStyle(context,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataEvent.value.events!.injured!.injureList!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 5,top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${index+1}. ${dataEvent.value.events!.injured!.injureList![index].name} เพศ ${dataEvent.value.events!.injured!.injureList![index].sex} อายุ ${dataEvent.value.events!.injured!.injureList![index].age} ปี',
                                          style: textStyle(context,
                                            fontSize: 13,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              color: colorBlue,
                              borderRadius: BorderRadius.circular(5)

                            ),
                            height: 40,
                            width: 80,
                            child: Text('ปิด',style: textStyle(context,fontSize: 14,color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
