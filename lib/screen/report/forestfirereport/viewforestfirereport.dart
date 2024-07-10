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
    final ContollerForestFileReport contoller =
        Get.put(ContollerForestFileReport(), permanent: false);
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
                        child: Text(contoller.title.value,
                            style: textStyle(context,
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 450,
                          // width: MediaQuery.of(context).size.width * 0.78,
                          child: Center(
                              child: FlutterMap(
                                  mapController: contoller.mapControllers.value,
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
                                        hintStyle: TextStyle(
                                            fontSize: 15.0,
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
                                          contoller.mapControllers.value.move(
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorWhite),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          screenWidth >= 715
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // if (contoller.listDate.value.first!.year ==
                                    //         DateTime.now().year &&
                                    //     contoller.listDate.value.first!.month ==
                                    //         DateTime.now().month &&
                                    //     contoller.listDate.value.first!.day ==
                                    //         DateTime.now().day &&
                                    //     contoller.listDate.value.last!.year ==
                                    //         DateTime.now().year &&
                                    //     contoller.listDate.value.last!.month ==
                                    //         DateTime.now().month &&
                                    //     contoller.listDate.value.last!.day ==
                                    //         DateTime.now().day)
                                    //   Text(
                                    //     'วันนี้',
                                    //     style: TextStyle(
                                    //         fontSize: 15.0,
                                    //         color: colorGrey,
                                    //         fontWeight: FontWeight.w400),
                                    //   ),
                                    // if (contoller.listDate.value.first!.year ==
                                    //         DateTime.now().year &&
                                    //     contoller.listDate.value.first!.month ==
                                    //         DateTime.now().month &&
                                    //     contoller.listDate.value.first!.day ==
                                    //         DateTime.now().day &&
                                    //     contoller.listDate.value.last!.year ==
                                    //         DateTime.now().year &&
                                    //     contoller.listDate.value.last!.month ==
                                    //         DateTime.now().month &&
                                    //     contoller.listDate.value.last!.day ==
                                    //         DateTime.now().day)
                                    // const SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ช่วงเวลา',
                                                style: textStyle(context,
                                                    fontSize: 15)),
                                            Container(
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
                                                child: InkWell(
                                                    onTap: () async {
                                                      contoller
                                                          .selectDate(context);
                                                    },
                                                    child: Container(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              '${(contoller.listDate.value.isNotEmpty) ? (contoller.listDate.value.first == contoller.listDate.value.last) ? '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year.toString().substring(2, 4)}' : '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year.toString().substring(2, 4)} - ${contoller.listDate.value.last!.day} ${mountAbbreviation[contoller.listDate.value.last!.month - 1]} ${contoller.listDate.value.last!.year.toString().substring(2, 4)}' : ''}',
                                                              style: textStyle(
                                                                  context,
                                                                  fontSize: 15))
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
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ระดับ',
                                                style: textStyle(context,
                                                    fontSize: 15)),
                                            Container(
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
                                                        .selectLevel!.value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
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
                                                          style: TextStyle(
                                                              fontSize: 15.0,
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
                                    if (contoller.selectLevel!.value ==
                                        'จังหวัด')
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    if (contoller.selectLevel!.value ==
                                        'จังหวัด')
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 60,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('จังหวัด',
                                                  style: textStyle(context,
                                                      fontSize: 15)),
                                              Container(
                                                width: double.infinity,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: colorWhite,
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: DropdownButton2<
                                                        Province>(
                                                      dropdownStyleData:
                                                          DropdownStyleData(
                                                        maxHeight: 300,
                                                        decoration:
                                                            BoxDecoration(
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
                                                                  .all<double>(
                                                                      6),
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
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                                fontSize: 15.0,
                                                                color:
                                                                    colorGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      iconStyleData:
                                                          const IconStyleData(
                                                              icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        size: 24,
                                                      )),
                                                      onChanged: (valueSelect) {
                                                        contoller.selectProvince
                                                                .value =
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
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('ระดับความรุนแรง',
                                                style: textStyle(context,
                                                    fontSize: 15)),
                                            Container(
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
                                                        .selectViolence!.value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: contoller
                                                        .listViolence
                                                        .map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                            (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value!,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 15.0,
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
                                                      contoller.selectViolence!
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
                                      width: 5,
                                    ),
                                    if (contoller.selectLevel!.value !=
                                        'จังหวัด')
                                      Expanded(flex: 4, child: SizedBox()),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('ช่วงเวลา',
                                                    style: textStyle(context,
                                                        fontSize: 15)),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                          BorderRadius.circular(
                                                              5)),
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: InkWell(
                                                        onTap: () async {
                                                          contoller.selectDate(
                                                              context);
                                                        },
                                                        child: Container(
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                  '${(contoller.listDate.value.isNotEmpty) ? (contoller.listDate.value.first == contoller.listDate.value.last) ? '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year.toString().substring(2, 4)}' : '${contoller.listDate.value.first!.day} ${mountAbbreviation[contoller.listDate.value.first!.month - 1]} ${contoller.listDate.value.first!.year.toString().substring(2, 4)} - ${contoller.listDate.value.last!.day} ${mountAbbreviation[contoller.listDate.value.last!.month - 1]} ${contoller.listDate.value.last!.year.toString().substring(2, 4)}' : ''}',
                                                                  style: textStyle(
                                                                      context,
                                                                      fontSize:
                                                                          13))
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
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('ระดับ',
                                                    style: textStyle(context,
                                                        fontSize: 15)),
                                                Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: colorWhite,
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: DropdownButton2<
                                                          String>(
                                                        dropdownStyleData:
                                                            DropdownStyleData(
                                                          maxHeight: 300,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          scrollbarTheme:
                                                              ScrollbarThemeData(
                                                            radius: const Radius
                                                                .circular(5),
                                                            thickness:
                                                                MaterialStateProperty
                                                                    .all<double>(
                                                                        6),
                                                            thumbVisibility:
                                                                MaterialStateProperty
                                                                    .all<bool>(
                                                                        true),
                                                          ),
                                                        ),
                                                        autofocus: true,
                                                        value: contoller
                                                            .selectLevel!.value,
                                                        hint: Text(
                                                          'เลือกทั้งหมด',
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              color: colorGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        iconStyleData:
                                                            const IconStyleData(
                                                                icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 24,
                                                        )),
                                                        onChanged:
                                                            (valueSelect) {
                                                          contoller.selectLevel!
                                                                  .value =
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
                                        if (contoller.selectLevel!.value ==
                                            'จังหวัด')
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        if (contoller.selectLevel!.value ==
                                            'จังหวัด')
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('จังหวัด',
                                                      style: textStyle(context,
                                                          fontSize: 15)),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: colorWhite,
                                                        border: Border.all(
                                                          color: Colors.black26,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    alignment: Alignment.center,
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton2<
                                                            Province>(
                                                          dropdownStyleData:
                                                              DropdownStyleData(
                                                            maxHeight: 300,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            scrollbarTheme:
                                                                ScrollbarThemeData(
                                                              radius:
                                                                  const Radius
                                                                      .circular(
                                                                      5),
                                                              thickness:
                                                                  MaterialStateProperty
                                                                      .all<double>(
                                                                          6),
                                                              thumbVisibility:
                                                                  MaterialStateProperty
                                                                      .all<bool>(
                                                                          true),
                                                            ),
                                                          ),
                                                          autofocus: true,
                                                          value: contoller
                                                              .selectProvince
                                                              .value,
                                                          hint: Text(
                                                            'เลือกทั้งหมด',
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color:
                                                                    colorGrey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          items: provinceList.map<
                                                                  DropdownMenuItem<
                                                                      Province>>(
                                                              (Province?
                                                                  value) {
                                                            return DropdownMenuItem<
                                                                Province>(
                                                              value: value!,
                                                              child: Text(
                                                                value.nameTh!,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.0,
                                                                    color:
                                                                        colorGrey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            );
                                                          }).toList(),
                                                          iconStyleData:
                                                              const IconStyleData(
                                                                  icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            size: 24,
                                                          )),
                                                          onChanged:
                                                              (valueSelect) {
                                                            contoller
                                                                    .selectProvince
                                                                    .value =
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
                                          width: 5,
                                        ),
                                        if (contoller.selectLevel!.value !=
                                            'จังหวัด')
                                          Expanded(flex: 4, child: SizedBox()),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('ระดับความรุนแรง',
                                                    style: textStyle(context,
                                                        fontSize: 15)),
                                                Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: colorWhite,
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: DropdownButton2<
                                                          String>(
                                                        dropdownStyleData:
                                                            DropdownStyleData(
                                                          maxHeight: 300,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          scrollbarTheme:
                                                              ScrollbarThemeData(
                                                            radius: const Radius
                                                                .circular(5),
                                                            thickness:
                                                                MaterialStateProperty
                                                                    .all<double>(
                                                                        6),
                                                            thumbVisibility:
                                                                MaterialStateProperty
                                                                    .all<bool>(
                                                                        true),
                                                          ),
                                                        ),
                                                        autofocus: true,
                                                        value: contoller
                                                            .selectViolence!
                                                            .value,
                                                        hint: Text(
                                                          'เลือกทั้งหมด',
                                                          style: TextStyle(
                                                              fontSize: 15.0,
                                                              color: colorGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        items: contoller
                                                            .listViolence
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>((String?
                                                                value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value!,
                                                            child: Text(
                                                              value,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        iconStyleData:
                                                            const IconStyleData(
                                                                icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 24,
                                                        )),
                                                        onChanged:
                                                            (valueSelect) {
                                                          contoller
                                                                  .selectViolence!
                                                                  .value =
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
                                          width: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          screenWidth >= 1365
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                          height: 60,
                                          color: colorWhite,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('หน่วยงาน',
                                                  style: textStyle(context,
                                                      fontSize: 15)),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 5, right: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade500)),
                                                alignment: Alignment.centerLeft,
                                                height: 40,
                                                child: TextFormField(
                                                  maxLines: 1,
                                                  scrollPadding:
                                                      EdgeInsets.zero,
                                                  textAlign: TextAlign.justify,
                                                  controller: contoller
                                                      .searchAgency.value,
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: colorBlack,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    fillColor: colorWhite,
                                                    hintText: "หน่วยงาน",
                                                    hintStyle: TextStyle(
                                                        fontSize: 15.0,
                                                        color: colorGrey,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    filled: true,
                                                    // enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                                                    //   color: Colors.grey.shade500,
                                                    //   width: 1,
                                                    // ), ),
                                                    // border: OutlineInputBorder(
                                                    //
                                                    //   borderRadius:
                                                    //   BorderRadius.circular(5),
                                                    // ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('สถานะของหน่วยงาน',
                                                style: textStyle(context,
                                                    fontSize: 15)),
                                            Container(
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
                                                        .selectStatusAgency
                                                        .value,
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
                                                              fontSize: 15.0,
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
                                                      contoller
                                                          .selectStatusAgency
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('สถานะของรายการ',
                                                style: textStyle(context,
                                                    fontSize: 15)),
                                            Container(
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
                                                        .selectStatusItem!
                                                        .value,
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
                                                              fontSize: 15.0,
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
                                                      contoller
                                                          .selectStatusItem!
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                contoller.setLocation();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.amber),
                                                child: (contoller
                                                            .loadSearch.value ==
                                                        true)
                                                    ? Center(
                                                        child:
                                                            LoadingAnimationWidget
                                                                .inkDrop(
                                                        color: Colors.white,
                                                        size: 20,
                                                      ))
                                                    : Text(
                                                        'ค้นหา',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: colorWhite),
                                                      ),
                                              ),
                                            ),
                                            // Spacer(),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                createPDF(
                                                    contoller.allEvent.value,
                                                    contoller
                                                        .listDate.value[0]!,
                                                    contoller
                                                        .listDate.value[1]!,
                                                    contoller
                                                        .selectCategory!.value,
                                                    contoller
                                                        .selectLevel!.value,
                                                    contoller.selectProvince
                                                        .value.nameTh!);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: colorAmber),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .file_download_outlined,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: colorWhite),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                createExcel(
                                                    contoller.allEvent.value,
                                                    contoller
                                                        .listDate.value[0]!,
                                                    contoller
                                                        .listDate.value[1]!,
                                                    contoller
                                                        .selectCategory!.value,
                                                    contoller
                                                        .selectLevel!.value,
                                                    contoller.selectProvince
                                                        .value.nameTh!);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: colorBlue),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .file_download_outlined,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: colorWhite),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              height: 60,
                                              color: colorWhite,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('หน่วยงาน',
                                                      style: textStyle(context,
                                                          fontSize: 15)),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .shade500)),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    height: 40,
                                                    child: TextFormField(
                                                      maxLines: 1,
                                                      scrollPadding:
                                                          EdgeInsets.zero,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      controller: contoller
                                                          .searchAgency.value,
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: colorBlack,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      decoration:
                                                          InputDecoration
                                                              .collapsed(
                                                        fillColor: colorWhite,
                                                        hintText: "หน่วยงาน",
                                                        hintStyle: TextStyle(
                                                            fontSize: 15.0,
                                                            color: colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        filled: true,
                                                        // enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                                                        //   color: Colors.grey.shade500,
                                                        //   width: 1,
                                                        // ), ),
                                                        // border: OutlineInputBorder(
                                                        //
                                                        //   borderRadius:
                                                        //   BorderRadius.circular(5),
                                                        // ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('สถานะของหน่วยงาน',
                                                    style: textStyle(context,
                                                        fontSize: 15)),
                                                Container(
                                                  width: double.infinity,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: colorWhite,
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: DropdownButton2<
                                                          String>(
                                                        dropdownStyleData:
                                                            DropdownStyleData(
                                                          maxHeight: 300,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          scrollbarTheme:
                                                              ScrollbarThemeData(
                                                            radius: const Radius
                                                                .circular(5),
                                                            thickness:
                                                                MaterialStateProperty
                                                                    .all<double>(
                                                                        6),
                                                            thumbVisibility:
                                                                MaterialStateProperty
                                                                    .all<bool>(
                                                                        true),
                                                          ),
                                                        ),
                                                        autofocus: true,
                                                        value: contoller
                                                            .selectStatusAgency
                                                            .value,
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
                                                                  fontSize:
                                                                      13.0,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        iconStyleData:
                                                            const IconStyleData(
                                                                icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 24,
                                                        )),
                                                        onChanged:
                                                            (valueSelect) {
                                                          contoller
                                                              .selectStatusAgency
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
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('สถานะของรายการ',
                                                    style: textStyle(context,
                                                        fontSize: 15)),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                          BorderRadius.circular(
                                                              5)),
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: DropdownButton2<
                                                          String>(
                                                        dropdownStyleData:
                                                            DropdownStyleData(
                                                          maxHeight: 300,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          scrollbarTheme:
                                                              ScrollbarThemeData(
                                                            radius: const Radius
                                                                .circular(5),
                                                            thickness:
                                                                MaterialStateProperty
                                                                    .all<double>(
                                                                        6),
                                                            thumbVisibility:
                                                                MaterialStateProperty
                                                                    .all<bool>(
                                                                        true),
                                                          ),
                                                        ),
                                                        autofocus: true,
                                                        value: contoller
                                                            .selectStatusItem!
                                                            .value,
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
                                                                  fontSize:
                                                                      13.0,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        iconStyleData:
                                                            const IconStyleData(
                                                                icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          size: 24,
                                                        )),
                                                        onChanged:
                                                            (valueSelect) {
                                                          contoller
                                                              .selectStatusItem!
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
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    contoller.setLocation();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.amber),
                                                    child: (contoller.loadSearch
                                                                .value ==
                                                            true)
                                                        ? Center(
                                                            child:
                                                                LoadingAnimationWidget
                                                                    .inkDrop(
                                                            color: Colors.white,
                                                            size: 20,
                                                          ))
                                                        : Text(
                                                            'ค้นหา',
                                                            style: textStyle(
                                                                context,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    colorWhite),
                                                          ),
                                                  ),
                                                ),
                                                // Spacer(),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    createPDF(
                                                        contoller
                                                            .allEvent.value,
                                                        contoller
                                                            .listDate.value[0]!,
                                                        contoller
                                                            .listDate.value[1]!,
                                                        contoller
                                                            .selectCategory!
                                                            .value,
                                                        contoller
                                                            .selectLevel!.value,
                                                        contoller.selectProvince
                                                            .value.nameTh!);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: colorAmber),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_download_outlined,
                                                          size: 20,
                                                          color: colorWhite,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'PDF',
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  colorWhite),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    createExcel(
                                                        contoller
                                                            .allEvent.value,
                                                        contoller
                                                            .listDate.value[0]!,
                                                        contoller
                                                            .listDate.value[1]!,
                                                        contoller
                                                            .selectCategory!
                                                            .value,
                                                        contoller
                                                            .selectLevel!.value,
                                                        contoller.selectProvince
                                                            .value.nameTh!);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: colorBlue),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .file_download_outlined,
                                                          size: 20,
                                                          color: colorWhite,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'XLSX',
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  colorWhite),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                          const SizedBox(
                            height: 20,
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
