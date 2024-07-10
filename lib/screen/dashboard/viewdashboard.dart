import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:disaster/stye/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import '../../service/config.dart';
import '../../stye/font.dart';
import '../drawer/admin/contollerdraweradmin.dart';
import 'contollerdashboard.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ContollerDashBoard contoller =
        Get.put(ContollerDashBoard(), permanent: false);
    contoller.mapController = MapController().obs;
    contoller.heatMapController = MapController().obs;
  }

  @override
  Widget build(BuildContext context) {
    final ContollerDashBoard contoller =
        Get.put(ContollerDashBoard(), permanent: false);
    final LandingPageControllerAdmin landingPageController =
    Get.put(LandingPageControllerAdmin(), permanent: false);
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
            color: colorBackground,
            padding: const EdgeInsets.only(
                left: 20, right: 20, bottom: 150, top: 20),
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text('แดชบอร์ด',
                            style: textStyle(context,
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 20,
                    ),
                    screenWidth >= 900
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 60,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('ค้นหา',
                                            style: textStyle(context,
                                                fontSize: 25)),
                                        Container(

                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 5),
                                          width: double.infinity,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: colorWhite,
                                              border: Border.all(
                                                color: Colors.black26,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          alignment: Alignment.center,
                                          child:TextFormField(
                                            controller: contoller.searchEven.value,
                                            autofocus: false,
                                            decoration: InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "ค้นหา",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25.0,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ช่วงเวลา',
                                          style:
                                              textStyle(context, fontSize: 25)),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: screenWidth >= 900 ? 15 : 20,
                                            right: screenWidth >= 900 ? 0 : 5),
                                        width: double.infinity,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: colorWhite,
                                            border: Border.all(
                                              color: Colors.black26,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: InkWell(
                                              onTap: () async {
                                                final values =
                                                    await showCalendarDatePicker2Dialog(
                                                  context: context,
                                                  config:
                                                      CalendarDatePicker2WithActionButtonsConfig(
                                                    calendarViewScrollPhysics:
                                                        const NeverScrollableScrollPhysics(),
                                                    dayTextStyle: textStyle(
                                                        context,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    calendarType:
                                                        CalendarDatePicker2Type
                                                            .range,
                                                    selectedDayHighlightColor:
                                                        Colors.amber,
                                                    closeDialogOnCancelTapped:
                                                        true,
                                                    firstDayOfWeek: 1,
                                                    weekdayLabelTextStyle:
                                                        const TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    controlsTextStyle:
                                                         textStyle(context,
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    centerAlignModePicker: true,
                                                    customModePickerIcon:
                                                        const SizedBox(),
                                                    selectedDayTextStyle:
                                                        TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                    dayTextStylePredicate: (
                                                        {required date}) {
                                                      TextStyle? textStyle;
                                                      if (date.weekday ==
                                                              DateTime
                                                                  .saturday ||
                                                          date.weekday ==
                                                              DateTime.sunday) {
                                                        textStyle = TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600);
                                                      }
                                                      if (DateUtils.isSameDay(
                                                          date,
                                                          DateTime(
                                                              2021, 1, 25))) {
                                                        textStyle = TextStyle(
                                                            color: Colors
                                                                .grey[500],
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600);
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
                                                      if (date.day % 3 == 0 &&
                                                          date.day % 9 != 0) {
                                                        dayWidget = Container(
                                                          decoration:
                                                              decoration,
                                                          child: Center(
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  MaterialLocalizations.of(
                                                                          context)
                                                                      .formatDecimal(
                                                                          date.day),
                                                                  style:
                                                                      textStyle,
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
                                                          decoration:
                                                              decoration,
                                                          height: 36,
                                                          width: 72,
                                                          child: Center(
                                                            child: Semantics(
                                                              selected:
                                                                  isSelected,
                                                              button: true,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${year}',
                                                                    style:
                                                                        textStyle,
                                                                  ),
                                                                  if (isCurrentYear ==
                                                                      true)
                                                                    Container(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .all(
                                                                              5),
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              5),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .black26,
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
                                                  dialogSize:
                                                      const Size(400, 450),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  value:
                                                      contoller.listDate.value,
                                                  dialogBackgroundColor:
                                                      Colors.white,
                                                );
                                                if (values != null) {
                                                  // ignore: avoid_print
                                                  contoller.listDate.value =
                                                      values;
                                                }
                                              },
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        '${(contoller.listDate.value.isNotEmpty) ? (contoller.listDate.value.first == contoller.listDate.value.last) ? '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year}' : '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year} - ${contoller.listDate.value.last!.day} ${mountAbbreviation[contoller.listDate.value.last!.month - 1]} ${contoller.listDate.value.last!.year}' : ''}',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 25))
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ระดับ',
                                          style:
                                              textStyle(context, fontSize: 25)),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: screenWidth >= 900 ? 0 : 5,
                                            right: screenWidth >= 900 ? 0 : 5),
                                        width: double.infinity,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: colorWhite,
                                            border: Border.all(
                                              color: Colors.black26,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              dropdownStyleData:
                                                  DropdownStyleData(
                                                maxHeight: 300,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                scrollbarTheme:
                                                    ScrollbarThemeData(
                                                  radius:
                                                      const Radius.circular(5),
                                                  thickness:
                                                      MaterialStateProperty.all<
                                                          double>(6),
                                                  thumbVisibility:
                                                      MaterialStateProperty.all<
                                                          bool>(true),
                                                ),
                                              ),
                                              autofocus: true,
                                              value:
                                                  contoller.selectLevel!.value,
                                              hint: Text(
                                                'เลือกทั้งหมด',
                                                style: textStyle(
                                                  context,
                                                    fontSize: 25.0,
                                                    color: colorGrey,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              items: contoller.level.map<
                                                      DropdownMenuItem<String>>(
                                                  (String? value) {
                                                return DropdownMenuItem<String>(
                                                  value: value!,
                                                  child: Text(
                                                    value,
                                                    style: textStyle(
                                                      context,
                                                        fontSize: 25.0,
                                                        color: colorGrey,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                );
                                              }).toList(),
                                              iconStyleData:
                                                  const IconStyleData(
                                                      icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 24,
                                              )),
                                              onChanged: (valueSelect) {
                                                contoller.heatMapController = MapController().obs;
                                                contoller.selectLevel!.value =
                                                    valueSelect!;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              if (contoller.selectLevel!.value == 'จังหวัด')
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 60,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('จังหวัด',
                                            style: textStyle(context,
                                                fontSize: 25)),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: screenWidth >= 900 ? 0 : 5,
                                              right:
                                                  screenWidth >= 900 ? 0 : 5),
                                          width: double.infinity,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: colorWhite,
                                              border: Border.all(
                                                color: Colors.black26,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton2<Province>(
                                                dropdownStyleData:
                                                    DropdownStyleData(
                                                  maxHeight: 300,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  scrollbarTheme:
                                                      ScrollbarThemeData(
                                                    radius:
                                                        const Radius.circular(
                                                            5),
                                                    thickness:
                                                        MaterialStateProperty
                                                            .all<double>(6),
                                                    thumbVisibility:
                                                        MaterialStateProperty
                                                            .all<bool>(true),
                                                  ),
                                                ),
                                                autofocus: true,
                                                value: contoller
                                                    .selectProvince.value,
                                                hint: Text(
                                                  'เลือกทั้งหมด',
                                                  style: textStyle(context,
                                                      fontSize: 25.0,
                                                      color: colorGrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                items: provinceList.map<
                                                        DropdownMenuItem<
                                                            Province>>(
                                                    (Province? value) {
                                                  return DropdownMenuItem<
                                                      Province>(
                                                    value: value!,
                                                    child: Text(
                                                      value.nameTh!,
                                                      style: textStyle(
                                                        context,
                                                          fontSize: 25.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  );
                                                }).toList(),
                                                iconStyleData:
                                                    const IconStyleData(
                                                        icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 24,
                                                )),
                                                onChanged: (valueSelect) {
                                                  contoller.selectProvince
                                                      .value = valueSelect!;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  contoller.setLocation();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.amber),
                                  child: (contoller.loadSearch.value == true)
                                      ? Center(
                                          child: LoadingAnimationWidget.inkDrop(
                                          color: Colors.white,
                                          size: 20,
                                        ))
                                      : Text(
                                          'ค้นหา',
                                          style: textStyle(context,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: colorWhite),
                                        ),
                                ),
                              ),
                              if (contoller.selectLevel!.value != 'จังหวัด')
                                const Expanded(
                                  flex: 2,
                                  child: SizedBox(),
                                ),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 65,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('ค้นหา',
                                                style: textStyle(context,
                                                    fontSize: 25)),
                                            Container(

                                              padding: EdgeInsets.only(
                                                  left: 5,
                                                  right: 5),
                                              width: double.infinity,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: colorWhite,
                                                  border: Border.all(
                                                    color: Colors.black26,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              alignment: Alignment.center,
                                              child:TextFormField(
                                                controller: contoller.searchEven.value,
                                                autofocus: false,
                                                decoration: InputDecoration.collapsed(
                                                  fillColor: colorWhite,
                                                  hintText: "ค้นหา",
                                                  hintStyle: textStyle(
                                                    context,
                                                      fontSize: 25.0,
                                                      color: colorGrey,
                                                      fontWeight: FontWeight.w400),
                                                  filled: true,

                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('ช่วงเวลา',
                                              style: textStyle(context,
                                                  fontSize: 25)),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 5),
                                            width: double.infinity,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: colorWhite,
                                                border: Border.all(
                                                  color: Colors.black26,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: InkWell(
                                                  onTap: () async {
                                                    final values =
                                                        await showCalendarDatePicker2Dialog(
                                                      context: context,
                                                      config:
                                                          CalendarDatePicker2WithActionButtonsConfig(
                                                        calendarViewScrollPhysics:
                                                            const NeverScrollableScrollPhysics(),
                                                        dayTextStyle: textStyle(
                                                            context,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        calendarType:
                                                            CalendarDatePicker2Type
                                                                .range,
                                                        selectedDayHighlightColor:
                                                            Colors.amber,
                                                        closeDialogOnCancelTapped:
                                                            true,
                                                        firstDayOfWeek: 1,
                                                        weekdayLabelTextStyle:
                                                            const TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        controlsTextStyle:
                                                             textStyle(context,
                                                          color: Colors.black,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        centerAlignModePicker:
                                                            true,
                                                        customModePickerIcon:
                                                            const SizedBox(),
                                                        selectedDayTextStyle:
                                                            TextStyle(
                                                                color: Colors
                                                                    .grey[500],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                        dayTextStylePredicate: (
                                                            {required date}) {
                                                          TextStyle? textStyle;
                                                          if (date.weekday ==
                                                                  DateTime
                                                                      .saturday ||
                                                              date.weekday ==
                                                                  DateTime
                                                                      .sunday) {
                                                            textStyle = TextStyle(
                                                                color: Colors
                                                                    .grey[500],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600);
                                                          }
                                                          if (DateUtils
                                                              .isSameDay(
                                                                  date,
                                                                  DateTime(2021,
                                                                      1, 25))) {
                                                            textStyle = TextStyle(
                                                                color: Colors
                                                                    .grey[500],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600);
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
                                                          if (date.day % 3 ==
                                                                  0 &&
                                                              date.day % 9 !=
                                                                  0) {
                                                            dayWidget =
                                                                Container(
                                                              decoration:
                                                                  decoration,
                                                              child: Center(
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      MaterialLocalizations.of(
                                                                              context)
                                                                          .formatDecimal(
                                                                              date.day),
                                                                      style:
                                                                          textStyle,
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
                                                              decoration:
                                                                  decoration,
                                                              height: 36,
                                                              width: 72,
                                                              child: Center(
                                                                child:
                                                                    Semantics(
                                                                  selected:
                                                                      isSelected,
                                                                  button: true,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        '${year}',
                                                                        style:
                                                                            textStyle,
                                                                      ),
                                                                      if (isCurrentYear ==
                                                                          true)
                                                                        Container(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              5),
                                                                          margin: const EdgeInsets
                                                                              .only(
                                                                              left: 5),
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            color:
                                                                                Colors.black26,
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
                                                      dialogSize:
                                                          const Size(400, 450),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      value: contoller
                                                          .listDate.value,
                                                      dialogBackgroundColor:
                                                          Colors.white,
                                                    );
                                                    if (values != null) {
                                                      // ignore: avoid_print
                                                      contoller.listDate.value =
                                                          values;
                                                    }
                                                  },
                                                  child: Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            '${(contoller.listDate.value.isNotEmpty) ? (contoller.listDate.value.first == contoller.listDate.value.last) ? '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year}' : '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year} - ${contoller.listDate.value.last!.day} ${mountAbbreviation[contoller.listDate.value.last!.month - 1]} ${contoller.listDate.value.last!.year}' : ''}',
                                                            style: textStyle(
                                                                context,
                                                                fontSize: 25))
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  // Expanded(
                                  //   flex: 2,
                                  //   child: Container(
                                  //     alignment: Alignment.centerLeft,
                                  //     height: 50,
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Text('ระดับ',
                                  //             style: textStyle(context,
                                  //                 fontSize: 20)),
                                  //         Container(
                                  //           padding: const EdgeInsets.only(
                                  //               left: 20, right: 5),
                                  //           width: double.infinity,
                                  //           height: 30,
                                  //           decoration: BoxDecoration(
                                  //               color: colorWhite,
                                  //               border: Border.all(
                                  //                 color: Colors.black26,
                                  //                 width: 1,
                                  //               ),
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5)),
                                  //           alignment: Alignment.center,
                                  //           child: SizedBox(
                                  //             width: double.infinity,
                                  //             child:
                                  //                 DropdownButtonHideUnderline(
                                  //               child: DropdownButton2<String>(
                                  //                 dropdownStyleData:
                                  //                     DropdownStyleData(
                                  //                   maxHeight: 300,
                                  //                   decoration: BoxDecoration(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             5),
                                  //                   ),
                                  //                   scrollbarTheme:
                                  //                       ScrollbarThemeData(
                                  //                     radius:
                                  //                         const Radius.circular(
                                  //                             5),
                                  //                     thickness:
                                  //                         MaterialStateProperty
                                  //                             .all<double>(6),
                                  //                     thumbVisibility:
                                  //                         MaterialStateProperty
                                  //                             .all<bool>(true),
                                  //                   ),
                                  //                 ),
                                  //                 autofocus: true,
                                  //                 value: contoller
                                  //                     .selectLevel!.value,
                                  //                 hint: Text(
                                  //                   'เลือกทั้งหมด',
                                  //                   style: TextStyle(
                                  //                       fontSize: 20.0,
                                  //                       color: colorGrey,
                                  //                       fontWeight:
                                  //                           FontWeight.w400),
                                  //                 ),
                                  //                 items: contoller.level.map<
                                  //                         DropdownMenuItem<
                                  //                             String>>(
                                  //                     (String? value) {
                                  //                   return DropdownMenuItem<
                                  //                       String>(
                                  //                     value: value!,
                                  //                     child: Text(
                                  //                       value,
                                  //                       style: TextStyle(
                                  //                           fontSize: 20.0,
                                  //                           color: colorGrey,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .w400),
                                  //                     ),
                                  //                   );
                                  //                 }).toList(),
                                  //                 iconStyleData:
                                  //                     const IconStyleData(
                                  //                         icon: Icon(
                                  //                   Icons.keyboard_arrow_down,
                                  //                   size: 24,
                                  //                 )),
                                  //                 onChanged: (valueSelect) {
                                  //                   contoller.selectLevel!
                                  //                       .value = valueSelect!;
                                  //                 },
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  // if (contoller.selectLevel!.value == 'จังหวัด')
                                  //   Expanded(
                                  //     flex: 2,
                                  //     child: Container(
                                  //       alignment: Alignment.centerLeft,
                                  //       height: 50,
                                  //       child: Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text('จังหวัด',
                                  //               style: textStyle(context,
                                  //                   fontSize: 20)),
                                  //           Container(
                                  //             padding: const EdgeInsets.only(
                                  //                 left: 20, right: 5),
                                  //             width: double.infinity,
                                  //             height: 30,
                                  //             decoration: BoxDecoration(
                                  //                 color: colorWhite,
                                  //                 border: Border.all(
                                  //                   color: Colors.black26,
                                  //                   width: 1,
                                  //                 ),
                                  //                 borderRadius:
                                  //                     BorderRadius.circular(5)),
                                  //             alignment: Alignment.center,
                                  //             child: SizedBox(
                                  //               width: double.infinity,
                                  //               child:
                                  //                   DropdownButtonHideUnderline(
                                  //                 child:
                                  //                     DropdownButton2<Province>(
                                  //                   dropdownStyleData:
                                  //                       DropdownStyleData(
                                  //                     maxHeight: 300,
                                  //                     decoration: BoxDecoration(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(5),
                                  //                     ),
                                  //                     scrollbarTheme:
                                  //                         ScrollbarThemeData(
                                  //                       radius: const Radius
                                  //                           .circular(5),
                                  //                       thickness:
                                  //                           MaterialStateProperty
                                  //                               .all<double>(6),
                                  //                       thumbVisibility:
                                  //                           MaterialStateProperty
                                  //                               .all<bool>(
                                  //                                   true),
                                  //                     ),
                                  //                   ),
                                  //                   autofocus: true,
                                  //                   value: contoller
                                  //                       .selectProvince.value,
                                  //                   hint: Text(
                                  //                     'เลือกทั้งหมด',
                                  //                     style: TextStyle(
                                  //                         fontSize: 20.0,
                                  //                         color: colorGrey,
                                  //                         fontWeight:
                                  //                             FontWeight.w400),
                                  //                   ),
                                  //                   items: provinceList.map<
                                  //                           DropdownMenuItem<
                                  //                               Province>>(
                                  //                       (Province? value) {
                                  //                     return DropdownMenuItem<
                                  //                         Province>(
                                  //                       value: value!,
                                  //                       child: Text(
                                  //                         value.nameTh!,
                                  //                         style: TextStyle(
                                  //                             fontSize: 20.0,
                                  //                             color: colorGrey,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     );
                                  //                   }).toList(),
                                  //                   iconStyleData:
                                  //                       const IconStyleData(
                                  //                           icon: Icon(
                                  //                     Icons.keyboard_arrow_down,
                                  //                     size: 24,
                                  //                   )),
                                  //                   onChanged: (valueSelect) {
                                  //                     contoller.selectProvince
                                  //                         .value = valueSelect!;
                                  //                   },
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     contoller.setLocation();
                                  //   },
                                  //   child: Container(
                                  //     alignment: Alignment.center,
                                  //     height: 40,
                                  //     width: 80,
                                  //     decoration: BoxDecoration(
                                  //         borderRadius:
                                  //             BorderRadius.circular(15),
                                  //         color: Colors.amber),
                                  //     child: (contoller.loadSearch.value ==
                                  //             true)
                                  //         ? Center(
                                  //             child: LoadingAnimationWidget
                                  //                 .inkDrop(
                                  //             color: Colors.white,
                                  //             size: 20,
                                  //           ))
                                  //         : Text(
                                  //             'ค้นหา',
                                  //             style: textStyle(context,
                                  //                 fontSize: 20,
                                  //                 fontWeight: FontWeight.bold,
                                  //                 color: colorWhite),
                                  //           ),
                                  //   ),
                                  // ),
                                  // if (contoller.selectLevel!.value != 'จังหวัด')
                                  //   const Expanded(
                                  //     flex: 2,
                                  //     child: SizedBox(),
                                  //   ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('ระดับ',
                                              style: textStyle(context,
                                                  fontSize: 25)),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 5),
                                            width: double.infinity,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: colorWhite,
                                                border: Border.all(
                                                  color: Colors.black26,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: double.infinity,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 300,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              5),
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  autofocus: true,
                                                  value: contoller
                                                      .selectLevel!.value,
                                                  hint: Text(
                                                    'เลือกทั้งหมด',
                                                    style: textStyle(context,
                                                        fontSize: 25.0,
                                                        color: colorGrey,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  items: contoller.level.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String? value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value!,
                                                      child: Text(
                                                        value,
                                                        style: textStyle(context,
                                                            fontSize: 25.0,
                                                            color: colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                          icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    size: 24,
                                                  )),
                                                  onChanged: (valueSelect) {
                                                    contoller.heatMapController = MapController().obs;
                                                    contoller.selectLevel!
                                                        .value = valueSelect!;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  if (contoller.selectLevel!.value == 'จังหวัด')
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('จังหวัด',
                                                style: textStyle(context,
                                                    fontSize: 25)),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth <= 515
                                                      ? 10
                                                      : 20,
                                                  right: 5),
                                              width: double.infinity,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: colorWhite,
                                                  border: Border.all(
                                                    color: Colors.black26,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: double.infinity,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child:
                                                      DropdownButton2<Province>(
                                                    dropdownStyleData:
                                                        DropdownStyleData(
                                                      maxHeight: 300,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      scrollbarTheme:
                                                          ScrollbarThemeData(
                                                        radius: const Radius
                                                            .circular(5),
                                                        thickness:
                                                            MaterialStateProperty
                                                                .all<double>(6),
                                                        thumbVisibility:
                                                            MaterialStateProperty
                                                                .all<bool>(
                                                                    true),
                                                      ),
                                                    ),
                                                    autofocus: true,
                                                    value: contoller
                                                        .selectProvince.value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: textStyle(
                                                        context,
                                                          fontSize: 25.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: provinceList.map<
                                                            DropdownMenuItem<
                                                                Province>>(
                                                        (Province? value) {
                                                      return DropdownMenuItem<
                                                          Province>(
                                                        value: value!,
                                                        child: Text(
                                                          value.nameTh!,
                                                          style: textStyle(
                                                            context,
                                                              fontSize: 25.0,
                                                              color: colorGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    iconStyleData:
                                                        const IconStyleData(
                                                            icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 24,
                                                    )),
                                                    onChanged: (valueSelect) {
                                                      contoller.selectProvince
                                                          .value = valueSelect!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      contoller.setLocation();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.amber),
                                      child: (contoller.loadSearch.value ==
                                              true)
                                          ? Center(
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                              color: Colors.white,
                                              size: 20,
                                            ))
                                          : Text(
                                              'ค้นหา',
                                              style: textStyle(context,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: colorWhite),
                                            ),
                                    ),
                                  ),
                                  if (contoller.selectLevel!.value != 'จังหวัด')
                                    const Expanded(
                                      flex: 2,
                                      child: SizedBox(),
                                    ),
                                ],
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(contoller.data[1][0],style: textStyle(context,fontSize: 20,fontWeight: FontWeight.bold,color: colorBlack),),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorWhite,
                      ),
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('ทั้งหมด',
                                        style: textStyle(context,
                                            fontSize: 25, color: colorBlack)),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text('${contoller.total.value}',
                                        style: textStyle(context,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: colorBlack)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            color: colorGrey,
                          ),
                          Container(
                            child: Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('รอรับเรื่อง',
                                        style: textStyle(context,
                                            fontSize: 25, color: colorBlack)),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text('${contoller.waiting.value}',
                                        style: textStyle(context,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: colorAmber)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            color: colorGrey,
                          ),
                          Container(
                            child: Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('กำลังดำเนินการ',
                                        style: textStyle(context,
                                            fontSize: 25, color: colorBlack)),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text('${contoller.progress.value}',
                                        style: textStyle(context,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: colorRed)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            color: colorGrey,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('เสร็จสิ้น',
                                      style: textStyle(context,
                                          fontSize: 25, color: colorBlack)),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text('${contoller.success.value}',
                                      style: textStyle(context,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: colorGreen)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 450,
                          child: Center(
                              child: FlutterMap(
                                  mapController: contoller.mapController.value,
                                  options: const MapOptions(
                                    keepAlive: true,
                                    // interactionOptions: InteractionOptions(
                                    //   flags: InteractiveFlag.doubleTapDragZoom |
                                    //       InteractiveFlag.drag,
                                    // ),
                                    initialCenter:
                                        LatLng(18.3170581, 99.3986862),
                                    initialZoom: 12,
                                    // maxZoom: 17,
                                    // minZoom: 10
                                  ),
                                  children: contoller.listWidgetMark)),
                        ),
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Container(
                              height: (contoller.listSearchMap.isEmpty)?45:350,
                              width: 300,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    color: colorWhite,
                                    child: TextFormField(
                                      controller: contoller.search.value,
                                      autofocus: false,
                                      onChanged: (value) {
                                        // if (value.isNotEmpty) {
                                        //   contoller.searchMap(value);
                                        // }
                                        if (value.isEmpty) {
                                          contoller.listSearchMap.clear();
                                        }
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                            onTap: () async {
                                              contoller.searchMap(
                                                  contoller.search.value.text);
                                            },
                                            child: Icon(Icons.search)),
                                        fillColor: colorWhite,
                                        hintText: "ค้นหา",
                                        hintStyle: textStyle(context,
                                            fontSize: 25.0,
                                            color: colorGrey,
                                            fontWeight: FontWeight.w400),
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: colorGrey,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 310,
                                    child: ListView.builder(
                                    itemCount:
                                          contoller.listSearchMap.value.length,
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          contoller.mapController.value.move(
                                              LatLng(
                                                  double.parse(contoller
                                                      .listSearchMap
                                                      .value[index]
                                                      .lat!),
                                                  double.parse(contoller
                                                      .listSearchMap
                                                      .value[index]
                                                      .lon!)),
                                              16);
                                          contoller.listSearchMap.clear();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                              top: 2,
                                              bottom: 2),
                                          height: 45,
                                          color: (index % 2 == 1)
                                              ? Colors.grey.shade300
                                              : Colors.white,
                                          child: Text(contoller.listSearchMap
                                              .value[index].displayName
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                   if(contoller.listStringName.isNotEmpty) Container(
                      padding:
                      const EdgeInsets.only(left: 20, right: 5),
                      width: 400,
                      height: 30,
                      decoration: BoxDecoration(
                          color: colorWhite,
                          border: Border.all(
                            color: Colors.black26,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 300,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(5),
                                thickness: MaterialStateProperty
                                    .all<double>(6),
                                thumbVisibility:
                                MaterialStateProperty.all<bool>(
                                    true),
                              ),
                            ),
                            autofocus: true,
                            isExpanded: true,
                            value: contoller.selectEventName.value,
                            hint: Text(
                              'เลือกชื่อรายการ',
                              style: textStyle(
                                  context,
                                  fontSize: 25.0,
                                  color: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            items: contoller.listStringName
                                .map<DropdownMenuItem<String>>(
                                    (String? value) {
                                  return DropdownMenuItem<String>(
                                    value: value!,
                                    child: Text(
                                      value,
                                      style: textStyle(context,
                                          fontSize: 25.0,
                                          color: colorGrey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  );
                                }).toList(),
                            iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 24,
                                )),
                            onChanged: (valueSelect) {
                              // print('dsdsdsdsdsdsdsdsd');
                              // print(valueSelect);
                              contoller.selectEventName.value =
                              valueSelect!;
                            },
                          ),
                        ),
                      ),
                    ),
                    // if (contoller.dashboard.value.fire != null)
                    //   contoller.chart(context),
                    const SizedBox(
                      height: 20,
                    ),
                  (contoller.selectLevel!.value == 'ประเทศ')?Container(
                     color: Colors.blue,
                     height: 450,
                     child: Center(
                         child: FlutterMap(
                             mapController: contoller.heatMapController.value,
                            options: const MapOptions(
                               keepAlive: true,
                               interactionOptions: InteractionOptions(
                                   flags: InteractiveFlag.none
                               ),
                               initialCenter:
                               LatLng(12.8700, 100.9925),
                               initialZoom: 5.2,
                               // maxZoom: 17,
                               // minZoom: 10
                             ),
                             children: contoller.listHeatMapWidgetMark)),
                   ):SizedBox(),
                  ],

                ))),
      ],
    );
  }
}
