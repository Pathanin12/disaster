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
import 'package:latlong2/latlong.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import '../../../api/map/searchmap.dart';
import '../../../api/report/mainreportapi.dart';
import '../../../model/searchmap.dart';
import '../../../service/config.dart';
import '../../../stye/colors.dart';
import '../../../stye/font.dart';
import '../../detail/contollerdetail.dart';
import '../../drawer/admin/contollerdraweradmin.dart';

class ContollerFloodReport extends GetxController {
  QrPainter? _painter;
  GlobalKey _globalKey = new GlobalKey();
  var title = 'รายงานอุทกภัย'.obs;
  RxInt Index = 0.obs;
  RxInt IndexChart = 0.obs;
  RxInt maxPage = 1.obs;
  var indexNumPage = 0.obs;
  var loadSearch = false.obs;
  final mapController = MapController().obs;
  var search = TextEditingController().obs;
  var listSearchMap=<SearchMapModel>[].obs;
  searchMap(String data)async{
    listSearchMap.value=await searchMapApi(data);
  }

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

  var selectProvince = provinceList[0].obs;
  RxString? selectLevel = 'ประเทศ'.obs;
  List<String> level = [
    "ประเทศ",
    "จังหวัด",
  ];

  List<String> AgerangeList = [
    "0-20",
    "21-40",
    "41-60",
    "61 ขึ้นไป",
  ];

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
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
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
    loadSearch.value = true;
    allEvent.value = await getAllDashBoardApi(
        startDate: listDate.value.first.toString().split(" ")[0],
        endDate: listDate.value.last.toString().split(" ")[0],
        disasterType: 1,
        level: level.indexOf(selectLevel.toString()),
        provinceID: selectProvince.value.id);
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
              child: InkWell(
                onTap: (){
                  final LandingPageControllerAdmin landingPageController =
                  Get.put(LandingPageControllerAdmin(), permanent: false);
                  final ContollerDetail contollerEvent =
                  Get.put(ContollerDetail(), permanent: false);
                  contollerEvent.getEvent(element.eventID!);
                  landingPageController.tabIndex.value=7;
                },
                child: (element.disasterType == 0 && element.statusItem == 0)
                    ? SvgPicture.asset(
                  'assets/icons/svg/fire0.svg',
                )
                    : (element.disasterType == 0 && element.statusItem == 1)
                    ? SvgPicture.asset(
                  'assets/icons/svg/fire1.svg',
                )
                    : (element.disasterType == 0 && element.statusItem == 2)
                    ? SvgPicture.asset(
                  'assets/icons/svg/fire2.svg',
                )
                    : (element.disasterType == 1 && element.statusItem == 0)
                    ? SvgPicture.asset(
                  'assets/icons/svg/flood0.svg',
                )
                    : (element.disasterType == 1 &&
                    element.statusItem == 1)
                    ? SvgPicture.asset(
                  'assets/icons/svg/flood1.svg',
                )
                    : (element.disasterType == 1 &&
                    element.statusItem == 2)
                    ? SvgPicture.asset(
                  'assets/icons/svg/flood2.svg',
                )
                    : (element.disasterType == 2 &&
                    element.statusItem == 0)
                    ? SvgPicture.asset(
                  'assets/icons/svg/windstorm0.svg',
                )
                    : (element.disasterType == 2 &&
                    element.statusItem == 1)
                    ? SvgPicture.asset(
                  'assets/icons/svg/windstorm1.svg',
                )
                    : (element.disasterType == 2 &&
                    element.statusItem == 2)
                    ? SvgPicture.asset(
                  'assets/icons/svg/windstorm2.svg',
                )
                    : (element.disasterType == 3 &&
                    element.statusItem == 0)
                    ? SvgPicture.asset(
                  'assets/icons/svg/forestfire0.svg',
                )
                    : (element.disasterType ==
                    3 &&
                    element.statusItem ==
                        1)
                    ? SvgPicture.asset(
                  'assets/icons/svg/forestfire1.svg',
                )
                    : SvgPicture.asset(
                  'assets/icons/svg/forestfire2.svg',
                ),
              )
          ),
        ],
      );
      listWidgetMark.add(widget);
    }
    loadSearch.value = false;
  }

  updateMaxPage(GetAllEventModel? even) async {
    if (even != null) {
      if (even.eventList!.length > 10) {
        double calPage = 0.0;
        calPage = even.eventList!.length / 10;
        double modeCal = calPage % 1;
        int sum = int.parse(calPage.toString().split('.')[0]);
        
        
        if (modeCal > 0) {
          maxPage.value = sum + 1;
        } else {
          maxPage.value = sum;
        }
      }
    }
  }

  Widget statusWidget(BuildContext context, int status) {
    return (status == 0)
        ? Container(
      alignment: Alignment.center,
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.amber),
      child: Text(
        'รับเรื่อง',
        style: textStyle(context,
            fontSize: 15, fontWeight: FontWeight.bold, color: colorWhite),
      ),
    )
        : (status == 1)
        ? Container(
      alignment: Alignment.center,
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red),
      child: Text(
        'กำลังดำเนินการ',
        style: textStyle(context,
            fontSize: 15,
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
        style: textStyle(context,
            fontSize: 15,
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
    return ListView.builder(
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
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    event[index].eventName!,
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    category[event[index].disasterType!],
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '${DateTime.parse(event[index].datetime!).day} ${mountAbbreviation[DateTime.parse(event[index].datetime!).month]} ${DateTime.parse(event[index].datetime!).year + 543}',
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    event[index].responsibleAgency ?? '',
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${event[index].latitude!},${event[index].longitude!}',
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 2,
                    child: statusWidget(
                        context, event[index].statusRelatedAgency!)),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    event[index].relatedAgency!,
                    style: textStyle(context, fontSize: 15, color: colorBlack),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 2,
                    child: statusWidget(context, event[index].statusAgency!)),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 2,
                    child: statusWidget(context, event[index].statusItem!)),
                InkWell(
                    onTap: () {
                      _painter = QrPainter(
                        errorCorrectionLevel: QrErrorCorrectLevel.H,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Colors.black,
                        ),
                        data: '${pathQR}${event[index].eventID}',
                        version: QrVersions.auto,
                      );
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Container(
                            padding: const EdgeInsets.all(10),
                            height: 250,
                            width: 250,
                            child: RepaintBoundary(
                              child: CustomPaint(
                                  size: Size.square((180).toDouble()),
                                  key: _globalKey,
                                  painter: _painter),
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      await Clipboard.setData(
                                           ClipboardData(
                                              text: '${pathQR}${event[index].eventID}'));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.amber),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.copy,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'คัดลอก',
                                            style: textStyle(context,
                                                fontSize: 14,
                                                color: colorWhite),
                                          ),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
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
                                              BorderRadius.circular(5),
                                          color: const Color(0xfff1e5eff)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.save_alt_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'บันทึก',
                                            style: textStyle(context,
                                                fontSize: 14,
                                                color: colorWhite),
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
                  onTap: (){
                    final LandingPageControllerAdmin landingPageController =
                    Get.put(LandingPageControllerAdmin(), permanent: false);
                    final ContollerDetail contollerEvent =
                    Get.put(ContollerDetail(), permanent: false);
                    contollerEvent.getEvent(event[index].eventID!);
                    landingPageController.tabIndex.value=7;
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
    );
  }

  Future<void> _capturePng() async {
    final picData = await _painter?.toImageData((200).toDouble(),
        format: ImageByteFormat.png);
    await writeToFile(picData!);
  }

  Future<void> writeToFile(ByteData data) async {
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final blob = html.Blob([bytes]);
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
  }
}
