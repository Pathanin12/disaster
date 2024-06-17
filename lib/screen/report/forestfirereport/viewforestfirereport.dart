import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:disaster/stye/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import '../../../service/config.dart';
import '../../../stye/font.dart';
import '../exportexcel.dart';
import '../exportpdf.dart';
import 'contollerforestfirereport.dart';

class ForestFireReport extends StatelessWidget {
  ForestFireReport({super.key});

  @override
  Widget build(BuildContext context) {
    final ContollerForestFireReport contoller =
        Get.put(ContollerForestFireReport(), permanent: false);
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
                        child: Text(contoller.title.value,
                            style: textStyle(context,
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 20,
                    ),

                    // Text(contoller.data[1][0],style: textStyle(context,fontSize: 15,fontWeight: FontWeight.bold,color: colorBlack),),

                    Container(
                      color: Colors.blue,
                      height: 450,
                      child: Center(
                          child: FlutterMap(
                              options: const MapOptions(
                                // interactionOptions: InteractionOptions(
                                //   flags: InteractiveFlag.doubleTapDragZoom |
                                //       InteractiveFlag.drag,
                                // ),
                                initialCenter: LatLng(18.3170581, 99.3986862),
                                initialZoom: 12,
                                // maxZoom: 17,
                                // minZoom: 10
                              ),
                              children: contoller.listWidgetMark.value)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorWhite),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (contoller.listDate.value.first!.year ==
                                      DateTime.now().year &&
                                  contoller.listDate.value.first!.month ==
                                      DateTime.now().month &&
                                  contoller.listDate.value.first!.day ==
                                      DateTime.now().day &&
                                  contoller.listDate.value.last!.year ==
                                      DateTime.now().year &&
                                  contoller.listDate.value.last!.month ==
                                      DateTime.now().month &&
                                  contoller.listDate.value.last!.day ==
                                      DateTime.now().day)
                                Text(
                                  'วันนี้',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: colorGrey,
                                      fontWeight: FontWeight.w400),
                                ),
                              if (contoller.listDate.value.first!.year ==
                                      DateTime.now().year &&
                                  contoller.listDate.value.first!.month ==
                                      DateTime.now().month &&
                                  contoller.listDate.value.first!.day ==
                                      DateTime.now().day &&
                                  contoller.listDate.value.last!.year ==
                                      DateTime.now().year &&
                                  contoller.listDate.value.last!.month ==
                                      DateTime.now().month &&
                                  contoller.listDate.value.last!.day ==
                                      DateTime.now().day)
                                const SizedBox(
                                  width: 20,
                                ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ช่วงเวลา',
                                          style:
                                              textStyle(context, fontSize: 13)),
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
                                                contoller.selectDate(context);
                                              },
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        '${(contoller.listDate.value.isNotEmpty) ? (contoller.listDate.value.first == contoller.listDate.value.last) ? '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year}' : '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year} - ${contoller.listDate.value.last!.day} ${mountAbbreviation[contoller.listDate.value.last!.month - 1]} ${contoller.listDate.value.last!.year}' : ''}',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 13))
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
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('ระดับ',
                                          style:
                                              textStyle(context, fontSize: 13)),
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
                                                style: TextStyle(
                                                    fontSize: 13.0,
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
                                                    style: TextStyle(
                                                        fontSize: 13.0,
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
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('จังหวัด',
                                            style: textStyle(context,
                                                fontSize: 13)),
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
                                                  style: TextStyle(
                                                      fontSize: 13.0,
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
                                                      style: TextStyle(
                                                          fontSize: 13.0,
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
                              if (contoller.selectLevel!.value == 'จังหวัด')
                                const SizedBox(
                                  width: 20,
                                ),
                              InkWell(
                                onTap: () {
                                  contoller.setLocation();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
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
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: colorWhite),
                                        ),
                                ),
                              ),
                              const Expanded(flex: 1, child: SizedBox()),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  createPDF(
                                      contoller.allEvent.value,
                                      contoller.listDate.value[0]!,
                                      contoller.listDate.value[1]!,
                                      contoller.selectCategory!.value,
                                      contoller.selectLevel!.value,
                                      contoller.selectProvince.value.nameTh!);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorAmber),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        size: 20,
                                        color: colorWhite,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'PDF',
                                        style: textStyle(context,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: colorWhite),
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
                                  // createExcel();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorBlue),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        size: 20,
                                        color: colorWhite,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'XLSX',
                                        style: textStyle(context,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: colorWhite),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'ลำดับที่',
                                  style: textStyle(context,
                                      fontSize: 15, color: colorBlack),
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
                                      fontSize: 15, color: colorBlack),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'ประเภท',
                                  style: textStyle(context,
                                      fontSize: 15, color: colorBlack),
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
                                      fontSize: 15, color: colorBlack),
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
                                      fontSize: 15, color: colorBlack),
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
                                      fontSize: 15, color: colorBlack),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'สถานะหน่วยงาน',
                                  style: textStyle(context,
                                      fontSize: 15, color: colorBlack),
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
                                      fontSize: 15, color: colorBlack),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'สถานะของหน่วยงานที่เกี่ยวข้อง',
                                  style: textStyle(context,
                                      fontSize: 15, color: colorBlack),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'สถานะของรายการ',
                                  style: textStyle(context,
                                      fontSize: 15, color: colorBlack),
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
                          Divider(
                            height: 2,
                            color: colorGrey,
                          ),
                          if (contoller.allEvent.value.eventList != null)
                            Container(
                              child: contoller.pageTableReport(context),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (contoller.allEvent.value.eventList != null)
                            if (contoller.allEvent.value.eventList!.isNotEmpty)
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 500,
                                child: contoller.numPage(context),
                              )
                        ],
                      ),
                    ),
                  ],
                ))),
      ],
    );
  }
}
