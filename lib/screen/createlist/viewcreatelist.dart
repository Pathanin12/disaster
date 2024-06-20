import 'package:disaster/model/createevenmodel.dart';
import 'package:disaster/stye/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
// import 'package:vph_web_date_picker/vph_web_date_picker.dart';
import '../../../stye/font.dart';
import '../../service/config.dart';
import 'contollercreatelist.dart';

class CreateList extends StatelessWidget {
  CreateList({super.key});
  @override
  Widget build(BuildContext context) {
    final ContollerCreateList contoller =
        Get.put(ContollerCreateList(), permanent: false);
    return ListView(
      children: [
        Form(
          // key: contoller.textFieldKey.value,
          child: Column(
            children: [
              Container(
                  color: colorBackground,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 150, top: 20),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 20,
                              child: Text(
                                  (contoller.dataEditEvent.value.events == null)
                                      ? 'สร้างรายการ'
                                      : 'แก้ไขรายงาน',
                                  style: textStyle(context,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ประเภทภัยพิบัติ',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ชื่อรายการ',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 5),
                                        width: double.infinity,
                                        height: 40,
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
                                              openWithLongPress:
                                                  (isAdmin) ? false : true,
                                              autofocus: true,
                                              isExpanded: true,
                                              value: contoller
                                                  .selectCategory!.value,
                                              hint: Text(
                                                'เลือกทั้งหมด',
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: colorGrey,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              items: contoller.category.map<
                                                      DropdownMenuItem<String>>(
                                                  (String? value) {
                                                return DropdownMenuItem<String>(
                                                  value: value!,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: colorBlack,
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
                                                contoller.selectCategory!
                                                    .value = valueSelect!;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          enabled: (isAdmin) ? true : false,
                                          controller: contoller.nameCon.value,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: colorBlack,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ชื่อรายการ",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'วันที่รับเรื่อง',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? SizedBox()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'สถานะของรายการ',
                                                style: textStyle(context,
                                                    color: colorBlack,
                                                    fontSize: 13),
                                              )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: InkWell(
                                        onTap: () async {
                                          if (isAdmin) {
                                            DateTime? newDateTime =
                                                await showRoundedDatePicker(
                                              theme: ThemeData(
                                                primaryColor:
                                                    Colors.amberAccent,
                                              ),
                                              styleDatePicker:
                                                  MaterialRoundedDatePickerStyle(
                                                textStyleCurrentDayOnCalendar:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textStyleDayOnCalendar:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                textStyleDayOnCalendarSelected:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textStyleDayOnCalendarDisabled:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black
                                                            .withOpacity(0.1)),
                                                textStyleMonthYearHeader:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                sizeArrow: 50,
                                                colorArrowNext: Colors.black,
                                                colorArrowPrevious:
                                                    Colors.black,
                                                marginLeftArrowPrevious: 16,
                                                marginTopArrowPrevious: 16,
                                                marginTopArrowNext: 16,
                                                marginRightArrowNext: 32,
                                                textStyleButtonAction:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                textStyleButtonPositive:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.amber,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textStyleButtonNegative:
                                                    TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black45
                                                            .withOpacity(0.5)),
                                                decorationDateSelected:
                                                    BoxDecoration(
                                                        color: Colors.amber,
                                                        shape: BoxShape.circle),
                                              ),
                                              styleYearPicker:
                                                  MaterialRoundedYearPickerStyle(
                                                textStyleYear: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.black),
                                                textStyleYearSelected:
                                                    TextStyle(
                                                        fontSize: 40,
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                heightYearRow: 100,
                                              ),
                                              context: context,
                                              locale: Locale("th", "TH"),
                                            );
                                            if (newDateTime != null) {
                                              contoller.date.value = newDateTime
                                                  .toString()
                                                  .split(" ")[0];
                                            }
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 5),
                                          height: 40,
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
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  contoller.date.value,
                                                  style: textStyle(context,
                                                      fontSize: 13,
                                                      color: colorBlack),
                                                ),
                                                Icon(
                                                  Icons.date_range,
                                                  size: 20,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? SizedBox()
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 5),
                                              width: double.infinity,
                                              height: 40,
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
                                                      DropdownButton2<String>(
                                                    openWithLongPress: (isAdmin)
                                                        ? false
                                                        : true,
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
                                                    isExpanded: true,
                                                    value: contoller
                                                        .selectStatusList!
                                                        .value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: contoller
                                                        .StatusList.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value!,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 13.0,
                                                              color: colorBlack,
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
                                                      contoller
                                                          .selectStatusList!
                                                          .value = valueSelect!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'หน่วยงานที่รับผิดชอบ',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? SizedBox()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'สถานะหน่วยงานที่รับผิดชอบ',
                                                style: textStyle(context,
                                                    color: colorBlack,
                                                    fontSize: 13),
                                              )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          enabled: (isAdmin)?true:false,
                                          controller:
                                              contoller.responsible.value,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: colorBlack,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "หน่วยงานที่รับผิดชอบ",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? SizedBox()
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 5),
                                              width: double.infinity,
                                              height: 40,
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
                                                      DropdownButton2<String>(
                                                    openWithLongPress: (isAdmin)
                                                        ? false
                                                        : true,
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
                                                    isExpanded: true,
                                                    value: contoller
                                                        .selectStatusResponsible!
                                                        .value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: contoller
                                                        .StatusResponsible.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value!,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 13.0,
                                                              color: colorBlack,
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
                                                      contoller
                                                          .selectStatusResponsible!
                                                          .value = valueSelect!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'รับเรื่องจาก',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ระดับความรุนแรง',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          enabled: (isAdmin) ? true : false,
                                          controller: contoller.createBy.value,
                                          style: textStyle(context,
                                            color: colorBlack,
                                            fontSize: 13),
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "รับเรื่องจาก",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Radio(
                                                value: 1,
                                                groupValue:
                                                    contoller.radio.value,
                                                onChanged: (val) {
                                                  if (isAdmin) {
                                                    contoller.radio.value =
                                                        val!;
                                                  }
                                                }),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'เล็กน้อย',
                                              style: textStyle(context,
                                                  color: colorBlack,
                                                  fontSize: 13),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Radio(
                                                value: 2,
                                                groupValue:
                                                    contoller.radio.value,
                                                onChanged: (val) {
                                                  if(isAdmin) {
                                                    contoller.radio.value =
                                                    val!;
                                                  }
                                                }),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'ปานกลาง',
                                              style: textStyle(context,
                                                  color: colorBlack,
                                                  fontSize: 13),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Radio(
                                                value: 3,
                                                groupValue:
                                                    contoller.radio.value,
                                                onChanged: (val) {
                                                  if(isAdmin) {
                                                    contoller.radio.value =
                                                    val!;
                                                  }
                                                }),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'รุนแรง',
                                              style: textStyle(context,
                                                  color: colorBlack,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'หน่วยงานที่เกี่ยวข้อง',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? SizedBox()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'สถานะหน่วยงานที่เกี่ยวข้อง',
                                                style: textStyle(context,
                                                    color: colorBlack,
                                                    fontSize: 13),
                                              )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          enabled: (isAdmin)?true:false,
                                          controller: contoller.relevant.value,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: colorBlack,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "หน่วยงานที่เกี่ยวข้อง",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? SizedBox()
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 5),
                                              width: double.infinity,
                                              height: 40,
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
                                                      DropdownButton2<String>(
                                                        openWithLongPress: (isAdmin)?false:true,
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
                                                    isExpanded: true,
                                                    value: contoller
                                                        .selectStatusrelevant!
                                                        .value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: contoller
                                                        .Statusrelevant.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value!,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 13.0,
                                                              color: colorBlack,
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
                                                      contoller
                                                          .selectStatusrelevant!
                                                          .value = valueSelect!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ผู้ประสบภัย',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'ผู้เสียชีวิต',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller: contoller.die.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'เพศหญิง',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller: contoller.womenDie.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'เพศชาย',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller: contoller.mandie.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'ไม่สามารถระบุเพศ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller: contoller.unGenderDie.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.only(bottom: 20),
                            shrinkWrap: true,
                            itemCount: contoller.listTextNameDie.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                height: 40,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color(0xfffd9e1ec)),
                                      child: Text('${index + 1}'),
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'ชื่อ-นามสกุล',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 250,
                                      color: colorWhite,
                                      child: TextFormField(
                                        enabled: (isAdmin)
                                            ? true
                                            : (contoller.dataEditEvent.value
                                                        .events ==
                                                    null)
                                                ? true
                                                : (index >=
                                                        contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .deceased!
                                                            .deceaseList!
                                                            .length)
                                                    ? true
                                                    : false,
                                        controller:
                                            contoller.listTextNameDie[index],
                                        textAlign: TextAlign.left,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'เพศ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 5),
                                      width: 150,
                                      height: 40,
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
                                        width: 100,
                                        child: Obx(
                                          () => DropdownButtonHideUnderline(
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
                                              isExpanded: true,
                                              openWithLongPress: (isAdmin)
                                                  ? false
                                                  : (contoller.dataEditEvent
                                                              .value.events ==
                                                          null)
                                                      ? false
                                                      : (index >=
                                                              contoller
                                                                  .dataEditEvent
                                                                  .value
                                                                  .events!
                                                                  .deceased!
                                                                  .deceaseList!
                                                                  .length)
                                                          ? false
                                                          : true,
                                              value: contoller
                                                  .listGenderDie[index].value,
                                              items: contoller.listGender.map<
                                                      DropdownMenuItem<String>>(
                                                  (String? value) {
                                                return DropdownMenuItem<String>(
                                                  value: value!,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: colorBlack,
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
                                                contoller.UpdateListGenderDie(
                                                    valueSelect!, index);
                                                // contoller.listGenderDie[index] = valueSelect!;
                                              },
                                              // enableFeedback: (contoller.dataEditEvent.value.events==null)?false:(index>=contoller.dataEditEvent.value.events!.deceased!.deceaseList!.length)?true:false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'อายุ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 100,
                                      color: colorWhite,
                                      child: TextFormField(
                                        enabled: (isAdmin)
                                            ? true
                                            : (contoller.dataEditEvent.value
                                                        .events ==
                                                    null)
                                                ? true
                                                : (index >=
                                                        contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .deceased!
                                                            .deceaseList!
                                                            .length)
                                                    ? true
                                                    : false,
                                        controller:
                                            contoller.listTextAgeDie[index],
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    (isAdmin)
                                        ? InkWell(
                                            onTap: () {
                                              contoller.listGenderDie
                                                  .removeAt(index);
                                              contoller.listTextAgeDie
                                                  .removeAt(index);
                                              contoller.listTextNameDie
                                                  .removeAt(index);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: colorRed),
                                                  color: Colors.white),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.multiply,
                                                    size: 17,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'ลบ',
                                                    style: textStyle(context,
                                                        color: colorRed,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                              height: 40,
                                              width: 80,
                                            ),
                                          )
                                        : (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? InkWell(
                                                onTap: () {
                                                  contoller.listGenderDie
                                                      .removeAt(index);
                                                  contoller.listTextAgeDie
                                                      .removeAt(index);
                                                  contoller.listTextNameDie
                                                      .removeAt(index);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: colorRed),
                                                      color: Colors.white),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons.multiply,
                                                        size: 17,
                                                        color: Colors.red,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'ลบ',
                                                        style: textStyle(
                                                            context,
                                                            color: colorRed,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                  height: 40,
                                                  width: 80,
                                                ),
                                              )
                                            : (index >=
                                                    contoller
                                                        .dataEditEvent
                                                        .value
                                                        .events!
                                                        .deceased!
                                                        .deceaseList!
                                                        .length)
                                                ? InkWell(
                                                    onTap: () {
                                                      contoller.listGenderDie
                                                          .removeAt(index);
                                                      contoller.listTextAgeDie
                                                          .removeAt(index);
                                                      contoller.listTextNameDie
                                                          .removeAt(index);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: colorRed),
                                                          color: Colors.white),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            CupertinoIcons
                                                                .multiply,
                                                            size: 17,
                                                            color: Colors.red,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'ลบ',
                                                            style: textStyle(
                                                                context,
                                                                color: colorRed,
                                                                fontSize: 13),
                                                          ),
                                                        ],
                                                      ),
                                                      height: 40,
                                                      width: 80,
                                                    ),
                                                  )
                                                : SizedBox()
                                  ],
                                ),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {
                              contoller.addDataDie();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 7, bottom: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                  color: colorWhite),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: colorBlue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'เพิ่มรายละเอียดผู้เสียชีวิต',
                                    style: textStyle(context,
                                        color: colorBlue, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'ผู้บาดเจ็บ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller: contoller.injured.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'เพศหญิง',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller:
                                            contoller.womenInjured.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'เพศชาย',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller: contoller.manInjured.value,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'ไม่สามารถระบุเพศ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      color: colorWhite,
                                      child: TextFormField(
                                        controller:
                                            contoller.unGenderInjured.value,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'คน',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.only(bottom: 20),
                            shrinkWrap: true,
                            itemCount: contoller.listTextNameInjured.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                height: 40,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color(0xfffd9e1ec)),
                                      child: Text('${index + 1}'),
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'ชื่อ-นามสกุล',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 250,
                                      color: colorWhite,
                                      child: TextFormField(
                                        enabled: (isAdmin)
                                            ? true
                                            : (contoller.dataEditEvent.value
                                                        .events ==
                                                    null)
                                                ? true
                                                : (index >=
                                                        contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .injured!
                                                            .injureList!
                                                            .length)
                                                    ? true
                                                    : false,
                                        controller: contoller
                                            .listTextNameInjured[index],
                                        textAlign: TextAlign.left,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'เพศ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 5),
                                      width: 150,
                                      height: 40,
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
                                        width: 100,
                                        child: Obx(
                                          () => DropdownButtonHideUnderline(
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
                                              isExpanded: true,
                                              openWithLongPress: (isAdmin)
                                                  ? false
                                                  : (contoller.dataEditEvent
                                                              .value.events ==
                                                          null)
                                                      ? false
                                                      : (index >=
                                                              contoller
                                                                  .dataEditEvent
                                                                  .value
                                                                  .events!
                                                                  .injured!
                                                                  .injureList!
                                                                  .length)
                                                          ? false
                                                          : true,
                                              value: contoller
                                                  .listGenderInjured[index]
                                                  .value,
                                              items: contoller.listGender.map<
                                                      DropdownMenuItem<String>>(
                                                  (String? value) {
                                                return DropdownMenuItem<String>(
                                                  value: value!,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        fontSize: 13.0,
                                                        color: colorBlack,
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
                                                contoller
                                                    .UpdateListGenderInjured(
                                                        valueSelect!, index);
                                              },
                                              // enableFeedback:  (isAdmin)?false:(contoller.dataEditEvent.value.events==null)?false:(index>=contoller.dataEditEvent.value.events!.injured!.injureList!.length)?true:false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'อายุ',
                                      style: textStyle(context,
                                          color: colorBlack, fontSize: 13),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 100,
                                      color: colorWhite,
                                      child: TextFormField(
                                        enabled: (isAdmin)
                                            ? true
                                            : (contoller.dataEditEvent.value
                                                        .events ==
                                                    null)
                                                ? true
                                                : (index >=
                                                        contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .injured!
                                                            .injureList!
                                                            .length)
                                                    ? true
                                                    : false,
                                        controller:
                                            contoller.listTextAgeInjured[index],
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: colorWhite,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    (isAdmin)
                                        ? InkWell(
                                            onTap: () {
                                              contoller.listGenderInjured
                                                  .removeAt(index);
                                              contoller.listTextAgeInjured
                                                  .removeAt(index);
                                              contoller.listTextNameInjured
                                                  .removeAt(index);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: colorRed),
                                                  color: Colors.white),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.multiply,
                                                    size: 17,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'ลบ',
                                                    style: textStyle(context,
                                                        color: colorRed,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                              height: 40,
                                              width: 80,
                                            ),
                                          )
                                        : (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? InkWell(
                                                onTap: () {
                                                  contoller.listGenderInjured
                                                      .removeAt(index);
                                                  contoller.listTextAgeInjured
                                                      .removeAt(index);
                                                  contoller.listTextNameInjured
                                                      .removeAt(index);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: colorRed),
                                                      color: Colors.white),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons.multiply,
                                                        size: 17,
                                                        color: Colors.red,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'ลบ',
                                                        style: textStyle(
                                                            context,
                                                            color: colorRed,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                  height: 40,
                                                  width: 80,
                                                ),
                                              )
                                            : (index >=
                                                    contoller
                                                        .dataEditEvent
                                                        .value
                                                        .events!
                                                        .injured!
                                                        .injureList!
                                                        .length)
                                                ? InkWell(
                                                    onTap: () {
                                                      contoller
                                                          .listGenderInjured
                                                          .removeAt(index);
                                                      contoller
                                                          .listTextAgeInjured
                                                          .removeAt(index);
                                                      contoller
                                                          .listTextNameInjured
                                                          .removeAt(index);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color: colorRed),
                                                          color: Colors.white),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            CupertinoIcons
                                                                .multiply,
                                                            size: 17,
                                                            color: Colors.red,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'ลบ',
                                                            style: textStyle(
                                                                context,
                                                                color: colorRed,
                                                                fontSize: 13),
                                                          ),
                                                        ],
                                                      ),
                                                      height: 40,
                                                      width: 80,
                                                    ),
                                                  )
                                                : SizedBox()
                                  ],
                                ),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {
                              contoller.addDataInjured();
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 7, bottom: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                  color: colorWhite),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: colorBlue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'เพิ่มรายละเอียดผู้ได้รับบาดเจ็บ',
                                    style: textStyle(context,
                                        color: colorBlue, fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'พิกัดที่เกิดภัยพิบัติ',
                                style: textStyle(context,
                                    color: colorBlack, fontSize: 13),
                              )),
                          Stack(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 400,
                                child: Center(
                                    child: FlutterMap(
                                  mapController: contoller.mapController.value,
                                  options: MapOptions(
                                      initialCenter: LatLng(
                                          double.parse(
                                              contoller.lat.value.text),
                                          double.parse(
                                              contoller.lng.value.text)),
                                      initialZoom: 14,
                                      interactionOptions: InteractionOptions(
                                        flags:
                                            InteractiveFlag.doubleTapDragZoom |
                                                InteractiveFlag.drag,
                                      ),
                                      onPositionChanged: (v, c) {
                                        contoller.lat.value.text =
                                            v.center.latitude.toString();
                                        contoller.lng.value.text =
                                            v.center.longitude.toString();
                                      }

                                      // maxZoom: 17,
                                      // minZoom: 10
                                      ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                  ],
                                )),
                              ),
                              Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Container(
                                    height: 350,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Container(
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
                                                        contoller
                                                            .search.value.text);
                                                  },
                                                  child: Icon(Icons.search)),
                                              fillColor: colorWhite,
                                              hintText: "ค้นหา",
                                              hintStyle: TextStyle(
                                                  fontSize: 13.0,
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
                                            itemCount: contoller
                                                .listSearchMap.value.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
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
                                                child: Text(contoller
                                                    .listSearchMap
                                                    .value[index]
                                                    .displayName
                                                    .toString()),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                height: 400,
                                child: Center(
                                  child: Container(
                                    height: 60,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          child: Icon(
                                            Icons.location_pin,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 120,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ที่อยู่',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 100,
                                        color: colorWhite,
                                        child: TextFormField(
                                          maxLines: 3,
                                          controller: contoller.address.value,
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ที่อยู่",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ละติจูด',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ลองจิจูด',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          controller: contoller.lat.value,
                                          autofocus: false,
                                          onChanged: (value) {
                                            contoller.mapController.value.move(
                                                LatLng(
                                                    double.parse(contoller
                                                        .lat.value.text),
                                                    double.parse(contoller
                                                        .lng.value.text)),
                                                16);
                                          },
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ละติจูด",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          controller: contoller.lng.value,
                                          onChanged: (value) {
                                            contoller.mapController.value.move(
                                                LatLng(
                                                    double.parse(contoller
                                                        .lat.value.text),
                                                    double.parse(contoller
                                                        .lng.value.text)),
                                                16);
                                          },
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ลองจิจูด",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
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
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DottedBorder(
                            color: Colors.grey.shade300,
                            dashPattern: [8, 4],
                            strokeWidth: 2,
                            radius: const Radius.circular(5),
                            borderType: BorderType.RRect,
                            strokeCap: StrokeCap.round,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(5)),
                              child: (contoller.listConvertImage.value.isEmpty)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                contoller
                                                    .selectedFileImage(context);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 80, bottom: 80),
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: colorGrey)),
                                                child: Text(
                                                  'เลือกรูป',
                                                  style: textStyle(context,
                                                      color: colorBlue,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        crossAxisSpacing: 3.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.8,
                                      ),
                                      itemCount: contoller
                                              .listConvertImage.value.length +
                                          1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            contoller.listConvertImage.value
                                                .length) {
                                          return InkWell(
                                            onTap: () {
                                              contoller
                                                  .selectedFileImage(context);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: colorGrey)),
                                                child: Text(
                                                  'เลือกรูป',
                                                  style: textStyle(context,
                                                      color: colorBlue,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Stack(
                                            children: [
                                              Container(
                                                height: 200,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            contoller
                                                                .listConvertImage
                                                                .value[index]
                                                                .pathImage!),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Positioned(
                                                child: InkWell(
                                                  onTap: () {
                                                    if (contoller
                                                            .listConvertImage
                                                            .value[index]
                                                            .imageName !=
                                                        'new') {
                                                      contoller
                                                          .listDeleteImage.value
                                                          .add(ImageDeleteList(
                                                              imageName: contoller
                                                                  .listConvertImage
                                                                  .value[index]
                                                                  .imageName));
                                                    }
                                                    contoller.listConvertImage
                                                        .removeAt(index);
                                                  },
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.clear,
                                                      size: 15,
                                                      color: colorBlack,
                                                    ),
                                                    alignment: Alignment.center,
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: colorGrey),
                                                  ),
                                                ),
                                                right: 0,
                                                top: 0,
                                              )
                                            ],
                                          );
                                        }
                                      },
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'รายละเอียดเพิ่มเติม',
                                          style: textStyle(context,
                                              color: colorBlack, fontSize: 13),
                                        )),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: colorWhite,
                                        ),
                                        height: 150,
                                        child: TextFormField(
                                          maxLines: 300,
                                          controller: contoller.remark.value,
                                          decoration: InputDecoration.collapsed(
                                            fillColor: colorWhite,
                                            hintText: "รายละเอียดเพิ่มเติม",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
                                                color: colorGrey,
                                                fontWeight: FontWeight.w400),
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 2,
                            color: colorGrey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'คำเตือน',
                                            style: textStyle(context,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      content: Text('คุณต้องการยกเลิกหรือไม่'),
                                      actions: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'ยกเลิก',
                                              style: textStyle(context,
                                                  fontSize: 14),
                                            )),
                                        InkWell(
                                            onTap: () async {
                                              await contoller.clearData();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'ตกลง',
                                              style: textStyle(context,
                                                  fontSize: 14),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorGrey),
                                  child: Text(
                                    'ยกเลิก',
                                    style: textStyle(context,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: colorWhite),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  await contoller.submit(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorAmber),
                                  child: Text(
                                    'บันทึก',
                                    style: textStyle(context,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: colorWhite),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ))),
            ],
          ),
        )
      ],
    );
  }
}
