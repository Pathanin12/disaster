import 'dart:io';
import 'dart:js';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:html' as html;
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:disaster/model/getalleventmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:latlong2/latlong.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../../../api/map/searchmap.dart';
import '../../../api/report/mainreportapi.dart';
import '../../../model/profileusermodel.dart';
import '../../../model/searchmap.dart';
import '../../../service/config.dart';
import '../../../stye/colors.dart';
import '../../../stye/font.dart';
import '../../detail/contollerdetail.dart';
import '../../drawer/admin/contollerdraweradmin.dart';

class ContollerMainReport extends GetxController {
  QrPainter? _painter;
  final tooltipController = JustTheController();
  GlobalKey _globalKey = new GlobalKey();
  var title = 'ดูรายงาน'.obs;
  RxInt Index = 0.obs;
  RxInt IndexChart = 0.obs;
  RxInt maxPage = 1.obs;
  var responsibleAgency = TextEditingController().obs;
  var indexNumPage = 0.obs;
  var loadSearch = false.obs;
  var listDate = <DateTime?>[
    DateTime.now(),
    DateTime.now(),
  ].obs;
  var allEvent = GetAllEventModel().obs;
  var listWidgetMark = <Widget>[
    TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',
    ),
  ].obs;
  final mapControllers = MapController().obs;
  var search = TextEditingController().obs,
      searchEven = TextEditingController().obs,
      searchAgency = TextEditingController().obs;
  var listSearchMap = <SearchMapModel>[].obs;
  searchMap(String data) async {
    listSearchMap.value = await searchMapApi(data);
  }

  var selectViolence = "เลือกทั้งหมด".obs;
  var listViolence = ["เล็กน้อย", "ปานกลาง", "รุนแรง", "เลือกทั้งหมด"].obs;
  var selectProvince = provinceList[0].obs;
  RxString? selectLevel = 'ประเทศ'.obs;
  List<String> level = [
    "ประเทศ",
    "จังหวัด",
  ];
  List<String> StatusList = [
    "รับเรื่อง",
    "กำลังดำเนินการ",
    "เสร็จสิ้น",
    "เลือกสถานะ"
  ];
  var selectStatusItem = 'เลือกสถานะ'.obs;
  var selectStatusAgency = 'เลือกสถานะ'.obs;
  List<String> AgerangeList = [
    "0-20",
    "21-40",
    "41-60",
    "61 ขึ้นไป",
  ];
  WidgetsToImageController controllerImage = WidgetsToImageController();
  late MapShapeSource mapSource = const MapShapeSource.asset(
    "assets/world_map.json",
    shapeDataField: "name",
  );

  RxString? selectCategory = 'เลือกทั้งหมด'.obs;

  Future<void> selectDate(BuildContext context) async {
    final values = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
        dayTextStyle: textStyle(context,
            color: Colors.black, fontWeight: FontWeight.w700),
        calendarType: CalendarDatePicker2Type.range,
        selectedDayHighlightColor: Colors.amber,
        closeDialogOnCancelTapped: true,
        firstDayOfWeek: 1,
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        controlsTextStyle: textStyle(
          context,
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerAlignModePicker: true,
        customModePickerIcon: const SizedBox(),
        selectedDayTextStyle:
            TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600),
        dayTextStylePredicate: ({required date}) {
          TextStyle? textStyle;
          if (date.weekday == DateTime.saturday ||
              date.weekday == DateTime.sunday) {
            textStyle =
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
          }
          if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
            textStyle =
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
          }
          return textStyle;
        },
        dayBuilder: ({
          required date,
          textStyle,
          decoration,
          isSelected,
          isDisabled,
          isToday,
        }) {
          Widget? dayWidget;
          if (date.day % 3 == 0 && date.day % 9 != 0) {
            dayWidget = Container(
              decoration: decoration,
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Text(
                      MaterialLocalizations.of(context).formatDecimal(date.day),
                      style: textStyle,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 27.5),
                    //   child: Container(
                    //     height: 4,
                    //     width: 4,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //       color: isSelected == true
                    //           ? Colors.white
                    //           : Colors.grey[500],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }
          return dayWidget;
        },
        yearBuilder: ({
          required year,
          decoration,
          isCurrentYear,
          isDisabled,
          isSelected,
          textStyle,
        }) {
          return Center(
            child: Container(
              decoration: decoration,
              height: 36,
              width: 72,
              child: Center(
                child: Semantics(
                  selected: isSelected,
                  button: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${year}',
                        style: textStyle,
                      ),
                      if (isCurrentYear == true)
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black26,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      dialogSize: const Size(400, 450),
      borderRadius: BorderRadius.circular(15),
      value: listDate.value,
      dialogBackgroundColor: Colors.white,
    );
    if (values != null) {
      // ignore: avoid_print
      listDate.value = values;
    }
  }

  List<String> category = ["อัคคีภัย", "อุทกภัย", "วาตภัย", "ไฟป่า"];
  Future<void> setLocation() async {
    final LandingPageControllerAdmin landingPageController =
        Get.put(LandingPageControllerAdmin(), permanent: false);
    if (landingPageController.dataUser!.value.profile != null) {
      print('1111111111');
      loadSearch.value = true;
      allEvent.value = await getAllDashBoardApi(
          startDate: listDate.first.toString().split(" ")[0],
          endDate: listDate.last.toString().split(" ")[0],
          searchEvent: searchEven.value.text.trim(),
          level: (landingPageController.dataUser!.value.profile!.role == 1)
              ? level.indexOf(selectLevel.toString())
              : 1,
          provinceID: (landingPageController.dataUser!.value.profile!.role == 1)
              ? selectProvince.value.id
              : provinceList
                  .where((element) =>
                      element.nameTh ==
                      landingPageController
                          .dataUser!.value.profile!.provinceName)
                  .toList()[0]
                  .id,
          statusItem: StatusList.indexOf(selectStatusItem.value),
          statusAgency: StatusList.indexOf(selectStatusAgency.value),
          responsibleAgency: searchAgency.value.text,
          violence: listViolence.indexOf(selectViolence.value));
      // print('/////////////');
      // print(allEvent.value.eventList!.map((e) => e.province));
      updateMaxPage(allEvent.value);
      listWidgetMark = <Widget>[
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ].obs;

      for (var element in allEvent.value.eventList!) {
        Widget widget = MarkerLayer(
          markers: [
            Marker(
                point: LatLng(double.parse(element.latitude!),
                    double.parse(element.longitude!)),
                width: 80,
                height: 80,
                child: JustTheTooltip(
                  controller: tooltipController,
                  child: InkWell(
                    onTap: () {
                      final LandingPageControllerAdmin landingPageController =
                          Get.put(LandingPageControllerAdmin(),
                              permanent: false);
                      final ContollerDetail contollerEvent =
                          Get.put(ContollerDetail(), permanent: false);
                      contollerEvent.getEvent(element.eventID!);
                      landingPageController.tabIndex.value = 3;
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/svg/fire0.svg',
                            color: (element.statusItem == 0)
                                ? Colors.amber
                                : (element.statusItem == 1)
                                    ? Colors.red
                                    : Colors.green,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Positioned(
                            top: 15,
                            left: 25,
                            child: SvgPicture.asset(
                              listIconType[element.iconMap ?? 0],
                              width: 30,
                              height: 30,
                            ))
                      ],
                    ),
                  ),
                  content: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${element.province.toString()}',
                            style: textStyle(Get.context!,
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${element.eventName.toString()}',
                            style: textStyle(Get.context!, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        );
        listWidgetMark.add(widget);
      }

      loadSearch.value = false;
    } else {
      print('22222222');
      loadSearch.value = true;

      do {
        allEvent.value = await getAllDashBoardApi(
            startDate: listDate.first.toString().split(" ")[0],
            endDate: listDate.last.toString().split(" ")[0],
            searchEvent: searchEven.value.text.trim(),
            level: (landingPageController.dataUser!.value.profile!.role == 1)
                ? level.indexOf(selectLevel.toString())
                : 1,
            provinceID:
                (landingPageController.dataUser!.value.profile!.role == 1)
                    ? selectProvince.value.id
                    : provinceList
                        .where((element) =>
                            element.nameTh ==
                            landingPageController
                                .dataUser!.value.profile!.provinceName)
                        .toList()[0]
                        .id,
            statusItem: StatusList.indexOf(selectStatusItem.value),
            statusAgency: StatusList.indexOf(selectStatusAgency.value),
            responsibleAgency: searchAgency.value.text,
            violence: listViolence.indexOf(selectViolence.value));

        print('/////////////');
        print(allEvent.value.eventList!.map((e) => e.province));
        updateMaxPage(allEvent.value);
        listWidgetMark = <Widget>[
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ].obs;

        for (var element in allEvent.value.eventList!) {
          Widget widget = MarkerLayer(
            markers: [
              Marker(
                  point: LatLng(double.parse(element.latitude!),
                      double.parse(element.longitude!)),
                  width: 80,
                  height: 80,
                  child: JustTheTooltip(
                    controller: tooltipController,
                    child: InkWell(
                      onTap: () {
                        final LandingPageControllerAdmin landingPageController =
                            Get.put(LandingPageControllerAdmin(),
                                permanent: false);
                        final ContollerDetail contollerEvent =
                            Get.put(ContollerDetail(), permanent: false);
                        contollerEvent.getEvent(element.eventID!);
                        landingPageController.tabIndex.value = 3;
                      },
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/icons/svg/fire0.svg',
                              color: (element.statusItem == 0)
                                  ? Colors.amber
                                  : (element.statusItem == 1)
                                      ? Colors.red
                                      : Colors.green,
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Positioned(
                              top: 15,
                              left: 25,
                              child: SvgPicture.asset(
                                listIconType[element.iconMap ?? 0],
                                width: 30,
                                height: 30,
                              ))
                        ],
                      ),
                    ),
                    content: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${element.province.toString()}',
                              style: textStyle(Get.context!,
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${element.eventName.toString()}',
                              style: textStyle(Get.context!, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          );
          listWidgetMark.add(widget);
        }
      } while (landingPageController.dataUser!.value.profile == null);

      loadSearch.value = false;
    }
  }

  updateMaxPage(GetAllEventModel? even) async {
    if (even != null) {
      if (even.eventList!.length > 10) {
        double calPage = 0.0;
        calPage = even.eventList!.length / 10;
        double modeCal = calPage % 1;
        int sum = int.parse(calPage.toString().split('.')[0]);
        print(indexNumPage.value);
        if (modeCal > 0) {
          maxPage.value = sum + 1;
        } else {
          maxPage.value = sum;
        }
      }
    }
  }

  Widget statusWidget(BuildContext context, int status) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (status == 0)
        ? Container(
            alignment: Alignment.center,
            height: 30,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.amber),
            child: Text(
              'รับเรื่อง',
              textAlign: TextAlign.center,
              style: textStyle(context,
                  fontSize: 25, fontWeight: FontWeight.bold, color: colorWhite),
            ),
          )
        : (status == 1)
            ? Container(
                alignment: Alignment.center,
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
                child: Text(
                  'กำลังดำเนินการ',
                  textAlign: TextAlign.center,
                  style: textStyle(context,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: colorWhite),
                ),
              )
            : Container(
                alignment: Alignment.center,
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: colorGreen),
                child: Text(
                  'ส่งแล้ว',
                  textAlign: TextAlign.center,
                  style: textStyle(context,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: colorWhite),
                ),
              );
  }

  pageTableReport(BuildContext context) {
    if (indexNumPage.value == maxPage.value - 1) {
      List<EventList> data = allEvent.value.eventList!
          .getRange(10 * indexNumPage.value, allEvent.value.eventList!.length)
          .toList();
      return tableReport(context, data);
    } else if (indexNumPage.value < maxPage.value - 1) {
      if (allEvent.value.eventList!.length < 10) {
        List<EventList> data = allEvent.value.eventList!
            .getRange(10 * indexNumPage.value, allEvent.value.eventList!.length)
            .toList();
        return tableReport(context, data);
      } else {
        List<EventList> data = allEvent.value.eventList!
            .getRange(10 * indexNumPage.value, (10 * indexNumPage.value) + 10)
            .toList();
        return tableReport(context, data);
      }
    }

    return const SizedBox();
  }

  dialogEdit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: const Scaffold(
              body: SizedBox(),
            ),
          );
        },
      ),
    );
  }

  tableReport(BuildContext context, List<EventList> event) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
                width: (MediaQuery.of(context).size.width < 1130)
                    ? MediaQuery.of(context).size.width * 0.95
                    : MediaQuery.of(context).size.width * 0.79,
                height: 470,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 1800,
                            height: 65,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'ลำดับที่',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'ชื่อรายการ',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'วันที่รับเรื่อง',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'หน่วยงานที่รับผิดชอบ',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'พิกัด',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'สถานะหน่วยงาน',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'หน่วยงานที่เกี่ยวข้อง',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'สถานะของหน่วยงานที่เกี่ยวข้อง',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'สถานะของรายการ',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            color: colorGrey,
                          ),
                          Container(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: event.length,
                              itemBuilder: (context, index) => Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            event[index].seq!.toString(),
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            event[index].eventName!,
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            '${DateTime.parse(event[index].datetime!).day} ${mountAbbreviation[DateTime.parse(event[index].datetime!).month - 1]} ${DateTime.parse(event[index].datetime!).year}',
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            event[index].responsibleAgency ??
                                                '',
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${event[index].latitude!},${event[index].longitude!}',
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: statusWidget(context,
                                                event[index].statusAgency!)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            event[index].relatedAgency!,
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: statusWidget(
                                                context,
                                                event[index]
                                                    .statusRelatedAgency!)),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: statusWidget(context,
                                                event[index].statusItem!)),
                                        InkWell(
                                            onTap: () {
                                              _painter = QrPainter(
                                                errorCorrectionLevel:
                                                    QrErrorCorrectLevel.H,
                                                eyeStyle: const QrEyeStyle(
                                                    eyeShape: QrEyeShape.square,
                                                    color: Colors.black),
                                                emptyColor: Colors.white,
                                                data:
                                                    '${pathQR}${event[index].eventID}',
                                                version: QrVersions.auto,
                                                gapless: true,
                                              );
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  content: WidgetsToImage(
                                                    controller: controllerImage,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      height: 250,
                                                      width: 250,
                                                      color: Colors.white,
                                                      child: RepaintBoundary(
                                                        child: CustomPaint(
                                                            size: Size.square(
                                                                (180)
                                                                    .toDouble()),
                                                            key: _globalKey,
                                                            painter: _painter),
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                            onTap: () async {
                                                              await Clipboard.setData(
                                                                  ClipboardData(
                                                                      text:
                                                                          '${pathQR}${event[index].eventID}'));
                                                            },
                                                            child: Container(
                                                              height: 40,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: Colors
                                                                      .amber),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const Icon(
                                                                    Icons.copy,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  Text(
                                                                    'คัดลอก',
                                                                    style: textStyle(
                                                                        context,
                                                                        fontSize:
                                                                            25,
                                                                        color:
                                                                            colorWhite),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                            onTap: () async {
                                                              // File('my_image.jpg').writeAsBytes(bytes!);
                                                              _capturePng();
                                                            },
                                                            // onTap: ()async{
                                                            //   dynamic externalDir='/Storage/emulated/0/Download/QR_Code';
                                                            //   RenderRepaintBoundary bounndary = _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                                                            //   var image =await bounndary.toImage(pixelRatio: 3.0);
                                                            //   final whitePaint = Paint()..color=Colors.white;
                                                            //   final recorder=PictureRecorder();
                                                            //   final canvas =Canvas(recorder,Rect.fromLTWH(0,0,image.width.toDouble(),image.height.toDouble(),));
                                                            //   canvas.drawRect(Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), whitePaint);
                                                            //   canvas.drawImage(image, Offset.zero, Paint());
                                                            //   final picture = recorder.endRecording();
                                                            //   final img = await picture.toImage(image.width, image.height);
                                                            //   ByteData? byteData=await img.toByteData(format: ImageByteFormat.png);
                                                            //   Uint8List pngBytes = byteData!.buffer.asUint8List();
                                                            //   String fileName='qr_code';
                                                            //   final file = await File('$externalDir/$fileName.png').create();
                                                            //   Navigator.pop(context);
                                                            // },
                                                            child: Container(
                                                              height: 40,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: const Color(
                                                                      0xfff1e5eff)),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .save_alt_rounded,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  Text(
                                                                    'บันทึก',
                                                                    style: textStyle(
                                                                        context,
                                                                        fontSize:
                                                                            25,
                                                                        color:
                                                                            colorWhite),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: SizedBox(
                                              width: 40,
                                              child: Icon(
                                                CupertinoIcons.share,
                                                color: colorGrey,
                                                size: 20,
                                              ),
                                            )),
                                        InkWell(
                                          onTap: () {
                                            final LandingPageControllerAdmin
                                                landingPageController = Get.put(
                                                    LandingPageControllerAdmin(),
                                                    permanent: false);
                                            final ContollerDetail
                                                contollerEvent = Get.put(
                                                    ContollerDetail(),
                                                    permanent: false);
                                            contollerEvent.getEvent(
                                                event[index].eventID!);
                                            landingPageController
                                                .tabIndex.value = 3;
                                            // dialogEdit(context);
                                          },
                                          child: SizedBox(
                                            width: 40,
                                            child: Icon(
                                              Icons.edit_note,
                                              color: colorGrey,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 2,
                                      color: colorGrey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            width: 1800,
                            // height: 200,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                )),
          ],
        )
        // Container(
        //   child: ListView.builder(itemBuilder: (context, index) => Container(width: 250,),)
        //
        // )
        //   ListView.builder(
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: event.length,
        //     itemBuilder: (context, index) => Container(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Row(
        //             children: [
        //               Expanded(
        //                 flex: 1,
        //                 child: Text(
        //                   event[index].seq!.toString(),
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 3,
        //                 child: Text(
        //                   event[index].eventName!,
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 1,
        //                 child: Text(
        //                   category[event[index].disasterType!],
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 1,
        //                 child: Text(
        //                   '${DateTime.parse(event[index].datetime!).day} ${mountAbbreviation[DateTime.parse(event[index].datetime!).month - 1]} ${DateTime.parse(event[index].datetime!).year + 543}',
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: Text(
        //                   event[index].responsibleAgency ?? '',
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 1,
        //                 child: Text(
        //                   listViolence[event[index].violence!],
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: Text(
        //                   '${event[index].latitude!},${event[index].longitude!}',
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                   flex: 2,
        //                   child: statusWidget(context, event[index].statusAgency!)),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: Text(
        //                   event[index].relatedAgency!,
        //                   style: textStyle(context,
        //                       fontSize: 15,
        //                       color: colorBlack),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                   flex: 2,
        //                   child: statusWidget(
        //                       context, event[index].statusRelatedAgency!)),
        //               const SizedBox(
        //                 width: 5,
        //               ),
        //               Expanded(
        //                   flex: 2,
        //                   child: statusWidget(context, event[index].statusItem!)),
        //               InkWell(
        //                   onTap: () {
        //                     _painter = QrPainter(
        //                       errorCorrectionLevel: QrErrorCorrectLevel.H,
        //                       eyeStyle: const QrEyeStyle(
        //                           eyeShape: QrEyeShape.square, color: Colors.black),
        //                       emptyColor: Colors.white,
        //                       data: '${pathQR}${event[index].eventID}',
        //                       version: QrVersions.auto,
        //                       gapless: true,
        //                     );
        //                     showDialog(
        //                       context: context,
        //                       builder: (context) => AlertDialog(
        //                         content: WidgetsToImage(
        //                           controller: controllerImage,
        //                           child: Container(
        //                             padding: const EdgeInsets.all(10),
        //                             height: 250,
        //                             width: 250,
        //                             color: Colors.white,
        //                             child: RepaintBoundary(
        //                               child: CustomPaint(
        //                                   size: Size.square((180).toDouble()),
        //                                   key: _globalKey,
        //                                   painter: _painter),
        //                             ),
        //                           ),
        //                         ),
        //                         actions: [
        //                           Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               InkWell(
        //                                   onTap: () async {
        //                                     await Clipboard.setData(ClipboardData(
        //                                         text:
        //                                             '${pathQR}${event[index].eventID}'));
        //                                   },
        //                                   child: Container(
        //                                     height: 40,
        //                                     width: 100,
        //                                     decoration: BoxDecoration(
        //                                         borderRadius:
        //                                             BorderRadius.circular(5),
        //                                         color: Colors.amber),
        //                                     child: Row(
        //                                       mainAxisAlignment:
        //                                           MainAxisAlignment.center,
        //                                       children: [
        //                                         const Icon(
        //                                           Icons.copy,
        //                                           size: 20,
        //                                           color: Colors.white,
        //                                         ),
        //                                         const SizedBox(
        //                                           width: 4,
        //                                         ),
        //                                         Text(
        //                                           'คัดลอก',
        //                                           style: textStyle(context,
        //                                               fontSize: 15,
        //                                               color: colorWhite),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   )),
        //                               const SizedBox(
        //                                 width: 10,
        //                               ),
        //                               InkWell(
        //                                   onTap: () async {
        //                                     // File('my_image.jpg').writeAsBytes(bytes!);
        //                                     _capturePng();
        //                                   },
        //                                   // onTap: ()async{
        //                                   //   dynamic externalDir='/Storage/emulated/0/Download/QR_Code';
        //                                   //   RenderRepaintBoundary bounndary = _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        //                                   //   var image =await bounndary.toImage(pixelRatio: 3.0);
        //                                   //   final whitePaint = Paint()..color=Colors.white;
        //                                   //   final recorder=PictureRecorder();
        //                                   //   final canvas =Canvas(recorder,Rect.fromLTWH(0,0,image.width.toDouble(),image.height.toDouble(),));
        //                                   //   canvas.drawRect(Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), whitePaint);
        //                                   //   canvas.drawImage(image, Offset.zero, Paint());
        //                                   //   final picture = recorder.endRecording();
        //                                   //   final img = await picture.toImage(image.width, image.height);
        //                                   //   ByteData? byteData=await img.toByteData(format: ImageByteFormat.png);
        //                                   //   Uint8List pngBytes = byteData!.buffer.asUint8List();
        //                                   //   String fileName='qr_code';
        //                                   //   final file = await File('$externalDir/$fileName.png').create();
        //                                   //   Navigator.pop(context);
        //                                   // },
        //                                   child: Container(
        //                                     height: 40,
        //                                     width: 100,
        //                                     decoration: BoxDecoration(
        //                                         borderRadius:
        //                                             BorderRadius.circular(5),
        //                                         color: const Color(0xfff1e5eff)),
        //                                     child: Row(
        //                                       mainAxisAlignment:
        //                                           MainAxisAlignment.center,
        //                                       children: [
        //                                         const Icon(
        //                                           Icons.save_alt_rounded,
        //                                           size: 20,
        //                                           color: Colors.white,
        //                                         ),
        //                                         const SizedBox(
        //                                           width: 4,
        //                                         ),
        //                                         Text(
        //                                           'บันทึก',
        //                                           style: textStyle(context,
        //                                               fontSize: 15,
        //                                               color: colorWhite),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   )),
        //                             ],
        //                           ),
        //                         ],
        //                       ),
        //                     );
        //                   },
        //                   child: SizedBox(
        //                     width: 40,
        //                     child: Icon(
        //                       CupertinoIcons.share,
        //                       color: colorGrey,
        //                       size: 20,
        //                     ),
        //                   )),
        //               InkWell(
        //                 onTap: () {
        //                   final LandingPageControllerAdmin landingPageController =
        //                       Get.put(LandingPageControllerAdmin(), permanent: false);
        //                   final ContollerDetail contollerEvent =
        //                       Get.put(ContollerDetail(), permanent: false);
        //                   contollerEvent.getEvent(event[index].eventID!);
        //                   landingPageController.tabIndex.value = 7;
        //                   // dialogEdit(context);
        //                 },
        //                 child: SizedBox(
        //                   width: 40,
        //                   child: Icon(
        //                     Icons.edit_note,
        //                     color: colorGrey,
        //                     size: 20,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           Divider(
        //             height: 2,
        //             color: colorGrey,
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        );
  }

  Future<void> _capturePng() async {
    // final picData = await _painter?.toImageData((878).toDouble(),
    //     format: ImageByteFormat.png);
    Uint8List? bytes = await controllerImage.capture();

    await writeToFile(bytes!);
  }

  Future<void> writeToFile(Uint8List data) async {
    // final bytes =
    //     data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final blob = html.Blob([data]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'qr_code.png';
    html.document.body!.children.add(anchor);

    anchor.click();

    html.document.body!.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Widget numPage(BuildContext context) {
    return NumberPaginator(
      initialPage: indexNumPage.value,
      config: const NumberPaginatorUIConfig(
          buttonSelectedForegroundColor: Colors.white,
          buttonUnselectedBackgroundColor: Colors.white,
          buttonSelectedBackgroundColor: Colors.amber,
          buttonUnselectedForegroundColor: Colors.black),
      numberPages: maxPage.value,
      onPageChange: (int index) {
        indexNumPage.value = index;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    setLocation();
  }

  @override
  void dispose() {
    super.dispose();
    mapControllers.value.dispose();
  }
}
