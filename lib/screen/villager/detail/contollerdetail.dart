import 'package:disaster/router.dart';
import 'package:disaster/stye/colors.dart';
import 'package:disaster/stye/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../api/eventbyidapi.dart';
import '../../../api/map/searchmap.dart';
import '../../../model/eventbyidmodel.dart';
import '../../../model/searchmap.dart';


class ContollerDetailVillager extends GetxController {
  var IndexChart = 0.obs;
  var mapController = MapController().obs;
  var pageName = 'ข้อมูลรายงาน'.obs;
  var dataEvent = EventByIDModel().obs;
  var listSearchMap = <SearchMapModel>[].obs;
  var search = TextEditingController().obs;
  String? eventID = Get.parameters['id'] ;
  searchMap(String data) async {
    listSearchMap.value = await searchMapApi(data);
  }
  var selectChartX = 'เพศ'.obs;
  var listChartX = ["เพศ", "ช่วงอายุ"].obs;

  var selectChartY = 'จำนวนผู้บาดเจ็บ'.obs;
  var listChartY = ["จำนวนผู้บาดเจ็บ", "จำนวนผู้เสียชีวิต"].obs;
  final listGender=[
    "ชาย",
    "หญิง",
    "ไม่ระบุ"
  ];
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
  Future<void> getEvent() async {

    mapController = MapController().obs;
    if (eventID != null) {
      dataEvent = EventByIDModel().obs;
      dataEvent.value = await getEventByIDApi(Id: eventID!);
      mapController.value.move(
          LatLng(double.parse(dataEvent.value.events!.latitude!),
              double.parse(dataEvent.value.events!.longitude!)),
          14);
    }
  }
  downloadFile(String base64,{String? fileName})async{
  final anchor = html.AnchorElement(
      href: base64)
    ..target = 'blank';

// add the name and extension
  anchor.download = fileName??'download';

// add the anchor to the document body
  html.document.body?.append(anchor);

// trigger download
  anchor.click();

// remove the anchor
  anchor.remove();
}

  List<Color> listColorChart = <Color>[
    const Color(0xfffffbd28),
    const Color(0xfffffbb21),
    const Color(0xfffffcd5b),
    const Color(0xfffffe2a0),
  ].obs;
  Widget chart(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 40),
      child: Center(
          child: Container(
              child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  series: <CartesianSeries<DeceasedList, String>>[
            // Renders column chart
            (selectChartX == 'เพศ' && selectChartY == 'จำนวนผู้บาดเจ็บ')
                ? ColumnSeries<DeceasedList, String>(
                    width: 0.2,
                    dataSource: dataEvent.value.graph!.gender!.injuredList,
                    xValueMapper: (DeceasedList data, _) => data.name,
                    yValueMapper: (DeceasedList data, _) => data.amount,
                    pointColorMapper: (datum, index) => listColorChart[index],
                  )
                : (selectChartX == 'เพศ' && selectChartY == 'จำนวนผู้เสียชีวิต')
                    ? ColumnSeries<DeceasedList, String>(
                        width: 0.2,
                        dataSource: dataEvent.value.graph!.gender!.deceasedList!,
                        xValueMapper: (DeceasedList data, _) => data.name,
                        yValueMapper: (DeceasedList data, _) => data.amount,
                        pointColorMapper: (datum, index) =>
                            listColorChart[index],
                      )
                    : (selectChartX == 'ช่วงอายุ' &&
                            selectChartY == 'จำนวนผู้บาดเจ็บ')
                        ? ColumnSeries<DeceasedList, String>(
                            width: 0.2,
                            dataSource: dataEvent.value.graph!.ageRange!.injuredList!,
                            xValueMapper: (DeceasedList data, _) => data.name,
                            yValueMapper: (DeceasedList data, _) => data.amount,
                            pointColorMapper: (datum, index) =>
                                listColorChart[index],
                          )
                        : ColumnSeries<DeceasedList, String>(
                            width: 0.2,
                            dataSource: dataEvent.value.graph!.ageRange!.deceasedList!,
                            xValueMapper: (DeceasedList data, _) => data.name,
                            yValueMapper: (DeceasedList data, _) => data.amount,
                            pointColorMapper: (datum, index) =>
                                listColorChart[index],
                          )
          ]))),
    );
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
                        padding: const EdgeInsets.only(right: 5, top: 5),
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
                            ),),
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: dataEvent.value.events!.deceased!
                                    .deceaseList!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${index + 1}. ${dataEvent.value.events!.deceased!.deceaseList![index].name} เพศ ${listGender[dataEvent.value.events!.deceased!.deceaseList![index].sex!]} อายุ ${dataEvent.value.events!.deceased!.deceaseList![index].age} ปี',
                                          style: textStyle(
                                            context,
                                            fontSize: 13,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'ผู้ได้รับบาดเจ็บ',
                                    style: textStyle(context,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: dataEvent
                                    .value.events!.injured!.injureList!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(bottom: 5, top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${index + 1}. ${dataEvent.value.events!.injured!.injureList![index].name} เพศ ${listGender[dataEvent.value.events!.injured!.injureList![index].sex!]} อายุ ${dataEvent.value.events!.injured!.injureList![index].age} ปี',
                                          style: textStyle(
                                            context,
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
                                borderRadius: BorderRadius.circular(5)),
                            height: 40,
                            width: 80,
                            child: Text(
                              'ปิด',
                              style: textStyle(context,
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEvent();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}
