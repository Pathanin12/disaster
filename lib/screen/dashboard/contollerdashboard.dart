import 'package:disaster/api/map/heatmapapi.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../../api/dashboardapi.dart';
import '../../api/map/searchmap.dart';
import '../../model/heatmapmodel.dart';
import '../../model/searchmap.dart';
import '../../service/config.dart';
import '../../stye/colors.dart';
import '../../stye/font.dart';

class ContollerDashBoard extends GetxController {
  RxInt Index = 0.obs;
  RxInt IndexChart = 0.obs;
  var loadSearch = false.obs;
  var dataHeatMap=HeatMapModel().obs;
  var listDate = <DateTime?>[
    DateTime.now(),
    DateTime.now(),
  ].obs;
  var dashboard = Dashboard().obs;

  var total = "0".obs;
  var waiting = "0".obs;
  var progress = "0".obs;
  var success = '0'.obs;

  List<Color> listColorChart=<Color>[
    const Color(0xfffffbd28),
    const Color(0xfffffbb21),
    const Color(0xfffffcd5b),
    const Color(0xfffffe2a0),
  ].obs;
  //
  // var listCartFireGenderAndDie=const Widget.obs;
  // var listCartFireGenderAndInj=<Widget>[].obs;
  // var listCartFireAgeAndDie=<Widget>[].obs;
  // var listCartFireAgeAndInj=<Widget>[].obs;
  //
  // var listCartFloodGenderAndDie=<Widget>[].obs;
  // var listCartFloodGenderAndInj=<Widget>[].obs;
  // var listCartFloodAgeAndDie=<Widget>[].obs;
  // var listCartFloodAgeAndInj=<Widget>[].obs;
  //
  // var listCartWindstormGenderAndDie=<Widget>[].obs;
  // var listCartWindstormGenderAndInj=<Widget>[].obs;
  // var listCartWindstormAgeAndDie=<Widget>[].obs;
  // var listCartWindstormAgeAndInj=<Widget>[].obs;
  //
  // var listCartForestFireGenderAndDie=<Widget>[].obs;
  // var listCartForestFireGenderAndInj=<Widget>[].obs;
  // var listCartForestFireAgeAndDie=<Widget>[].obs;
  // var listCartForestFireAgeAndInj=<Widget>[].obs;
  var mapController = MapController().obs;
  var heatMapController = MapController().obs;
  var search = TextEditingController().obs;
  var searchEven = TextEditingController().obs;
  var listSearchMap=<SearchMapModel>[].obs;
  searchMap(String data)async{
    listSearchMap.value=await searchMapApi(data);
  }

  var listWidgetMark = <Widget>[
    TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',

    ),
  ].obs;
  var listHeatMapWidgetMark = <Widget>[
    TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',

    ),
  ].obs;
  List<String> category = [
    "อัคคีภัย",
    "อุทกภัย",
    "วาตภัย",
    "ไฟป่า",
    'เลือกทั้งหมด'
  ];

  var selectProvince = provinceList[0].obs;
  RxString? selectLevel = 'ประเทศ'.obs;
  List<String> level = [
    "ประเทศ",
    "จังหวัด",
  ];
  var listGender=[
    "ชาย",
    "หญิง",
    "ไม่สามารถระบุเพศได้"
  ];

  List<String> AgerangeList = [
    "0-20",
    "21-40",
    "41-60",
    "60",
  ];

var selectChartX='เพศ'.obs;
  var listChartX=[
    "เพศ",
    "ช่วงอายุ"
  ].obs;

  var selectChartY='จำนวนผู้บาดเจ็บ'.obs;
  var listChartY=[
    "จำนวนผู้บาดเจ็บ",
    "จำนวนผู้เสียชีวิต"
  ].obs;

  late MapShapeSource mapSource = const MapShapeSource.asset(
    "assets/world_map.json",
    shapeDataField: "name",
  );


  RxString? selectCategory = 'เลือกทั้งหมด'.obs;

  Widget chart(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 20, right: 40),
      child: Center(
          child: Container(
              child:SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  series: <CartesianSeries<DeceasedList, String>>[
                    // Renders column chart
                    (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==0)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.fire!.gender!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==0)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.fire!.gender!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==0)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.fire!.ageRange!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==0)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.fire!.ageRange!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==1)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.flood!.gender!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==1)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.flood!.gender!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==1)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.flood!.ageRange!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==1)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.flood!.ageRange!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==2)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.windstorm!.gender!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==2)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.windstorm!.gender!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==2)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.windstorm!.ageRange!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==2)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.windstorm!.ageRange!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==3)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.forestFire!.gender!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='เพศ'&&selectChartY=='จำนวนผู้เสียชีวิต'&&IndexChart.value==3)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.forestFire!.gender!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ): (selectChartX=='ช่วงอายุ'&&selectChartY=='จำนวนผู้บาดเจ็บ'&&IndexChart.value==3)?ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.forestFire!.ageRange!.injuredList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    ):ColumnSeries<DeceasedList, String>(
                      width: 0.2,
                      dataSource: dashboard.value.forestFire!.ageRange!.deceasedList!,
                      xValueMapper: (DeceasedList data, _) => data.name,
                      yValueMapper: (DeceasedList data, _) => data.amount,
                      pointColorMapper:(datum, index) => listColorChart[index],
                    )
                  ]
              )
          )),
    );
  }

  // Widget selectChart(BuildContext context) {
  //   if (IndexChart.value == 0) {
  //     return chart(context, colorAmber);
  //   } else if (IndexChart.value == 1) {
  //     return chart(context, colorRed);
  //   } else if (IndexChart.value == 2) {
  //     return chart(context, colorGreen);
  //   } else if (IndexChart.value == 3) {
  //     return chart(context, colorGrey);
  //   }
  //   return const SizedBox();
  // }

  Future<void> setLocation() async {
    loadSearch.value = true;
    dashboard.value = await dashboardApi(
        startDate: listDate.value.first.toString().split(" ")[0],
        endDate: listDate.value.last.toString().split(" ")[0],
        disasterType: category.indexOf(selectCategory.toString()),
        level: level.indexOf(selectLevel.toString()),
        provinceID: selectProvince.value.id);
    listWidgetMark = <Widget>[
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),

    ].obs;
    total.value = dashboard.value.dashBoardList!.length.toString();
    success.value = dashboard.value.statusSuccess.toString();
    progress.value = dashboard.value.statusInProgress.toString();
    waiting.value = dashboard.value.statusWaiting.toString();
    for (var element in dashboard.value.dashBoardList!) {
      Widget widget = MarkerLayer(
        markers: [
          Marker(
            point: LatLng(double.parse(element.latitude!),
                double.parse(element.longitude!)),
            width: 80,
            height: 80,
            child:Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/svg/fire0.svg',color:(element.statusItem==0)?Colors.amber:(element.statusItem==1)?Colors.red:Colors.green,
                    width: 80,height: 80,
                  ),
                ),
                Positioned(
                    top:15,
                    left: 25,
                    child:  SvgPicture.asset(
                      listIconType[element.iconMap??0],
                      width: 30,height: 30,
                    ))
              ],
            )
          ),
        ],
      );
      listWidgetMark.add(widget);
    }
    loadSearch.value = false;
  }
  Future<void> setHeatMap()async{
    dataHeatMap.value =await getHeatMapApi();
    listHeatMapWidgetMark = <Widget>[
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
    ].obs;
    print('??????');
print(dataHeatMap.value.provincesList!.length);
  dataHeatMap.value.provincesList!.forEach((element) {
    Widget widget = MarkerLayer(
      markers: [
        Marker(
            point: LatLng(double.parse(element.lat!),
                double.parse(element.lng!)),
            width: 20,
            height: 20,
            child:Center(
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: (element.amount!>10)?const Color(0xfffd97875).withOpacity(0.8):(element.amount!>5)?const Color(0xfffF8C2BF).withOpacity(0.8):(element.amount!>2)?const Color(0xfffF7D773).withOpacity(0.8):const Color(0xfffD7D7D4).withOpacity(0.8)
                ),
              ),
            ),
        ),
      ],
    );
    if(element.amount! >0){
      listHeatMapWidgetMark.add(widget);
    }
  });
  }

  Future<void> calChart()async{
  for(int i=0;i>dashboard.value.fire!.ageRange!.deceasedList!.length;i++){


  }
  }

  @override
  void onInit() {
    super.onInit();
    setLocation();
    setHeatMap();
  }

  @override
  void dispose() {
    super.dispose();
    // mapController.value.dispose();
  }
}


