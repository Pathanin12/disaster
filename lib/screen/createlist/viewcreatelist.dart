import 'package:disaster/api/latlongapi.dart';
import 'package:disaster/model/createevenmodel.dart';
import 'package:disaster/stye/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
// import 'package:vph_web_date_picker/vph_web_date_picker.dart';
import '../../../stye/font.dart';
import '../../service/config.dart';
import 'contollercreatelist.dart';

class CreateList extends StatefulWidget {
  CreateList({super.key});

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ContollerCreateList contoller =
        Get.put(ContollerCreateList(), permanent: false);
    return ListView(
      children: [
        Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: contoller.formKey,
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
                              height: 50,
                              child: Text(
                                  (contoller.dataEditEvent.value.events == null)
                                      ? 'สร้างรายการ'
                                      : 'แก้ไขรายงาน',
                                  style: textStyle(context,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(
                            height: 20,
                          ),
                          if (MediaQuery.of(context).size.width > 899)
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'ชื่อรายการ',
                                              style: textStyle(context,
                                                  color: colorBlack,
                                                  fontSize: 25),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,

                                            enabled: (isAdmin) ? true : false,
                                            controller: contoller.nameCon.value,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.w400),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "ชื่อรายการ",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Expanded(
                                        flex: 5,
                                        child: SizedBox(),
                                        // child: Container(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 20, right: 5),
                                        //   width: double.infinity,
                                        //   height: 40,
                                        //   decoration: BoxDecoration(
                                        //       color: colorWhite,
                                        //       border: Border.all(
                                        //         color: Colors.black26,
                                        //         width: 1,
                                        //       ),
                                        //       borderRadius:
                                        //       BorderRadius.circular(5)),
                                        //   alignment: Alignment.center,
                                        //   // child: SizedBox(
                                        //   //   width: double.infinity,
                                        //   //   child: DropdownButtonHideUnderline(
                                        //   //     child: DropdownButton2<String>(
                                        //   //       dropdownStyleData:
                                        //   //           DropdownStyleData(
                                        //   //         maxHeight: 300,
                                        //   //         decoration: BoxDecoration(
                                        //   //           borderRadius:
                                        //   //               BorderRadius.circular(5),
                                        //   //         ),
                                        //   //         scrollbarTheme:
                                        //   //             ScrollbarThemeData(
                                        //   //           radius:
                                        //   //               const Radius.circular(5),
                                        //   //           thickness:
                                        //   //               MaterialStateProperty.all<
                                        //   //                   double>(6),
                                        //   //           thumbVisibility:
                                        //   //               MaterialStateProperty.all<
                                        //   //                   bool>(true),
                                        //   //         ),
                                        //   //       ),
                                        //   //       openWithLongPress:
                                        //   //           (isAdmin) ? false : true,
                                        //   //       autofocus: true,
                                        //   //       isExpanded: true,
                                        //   //       value: contoller
                                        //   //           .selectCategory!.value,
                                        //   //       hint: Text(
                                        //   //         'เลือกทั้งหมด',
                                        //   //         style: TextStyle(
                                        //   //             fontSize: 15.0,
                                        //   //             color: colorGrey,
                                        //   //             fontWeight:
                                        //   //                 FontWeight.w400),
                                        //   //       ),
                                        //   //       items: contoller.category.map<
                                        //   //               DropdownMenuItem<String>>(
                                        //   //           (String? value) {
                                        //   //         return DropdownMenuItem<String>(
                                        //   //           value: value!,
                                        //   //           child: Text(
                                        //   //             value,
                                        //   //             style: TextStyle(
                                        //   //                 fontSize: 15.0,
                                        //   //                 color: colorBlack,
                                        //   //                 fontWeight:
                                        //   //                     FontWeight.w400),
                                        //   //           ),
                                        //   //         );
                                        //   //       }).toList(),
                                        //   //       iconStyleData:
                                        //   //           const IconStyleData(
                                        //   //               icon: Icon(
                                        //   //         Icons.keyboard_arrow_down,
                                        //   //         size: 24,
                                        //   //       )),
                                        //   //       onChanged: (valueSelect) {
                                        //   //         contoller.selectCategory!
                                        //   //             .value = valueSelect!;
                                        //   //       },
                                        //   //     ),
                                        //   //   ),
                                        //   // ),
                                        // ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          // if(MediaQuery.of(context).size.width<900)Container(
                          //   height: 65,
                          //   child: Column(
                          //     children: [
                          //
                          //       Row(
                          //         children: [
                          //           Expanded(
                          //             flex: 5,
                          //             child: Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 20, right: 5),
                          //               width: double.infinity,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                   color: colorWhite,
                          //                   border: Border.all(
                          //                     color: Colors.black26,
                          //                     width: 1,
                          //                   ),
                          //                   borderRadius:
                          //                   BorderRadius.circular(5)),
                          //               alignment: Alignment.center,
                          //               child: SizedBox(
                          //                 width: double.infinity,
                          //                 child: DropdownButtonHideUnderline(
                          //                   child: DropdownButton2<String>(
                          //                     dropdownStyleData:
                          //                     DropdownStyleData(
                          //                       maxHeight: 300,
                          //                       decoration: BoxDecoration(
                          //                         borderRadius:
                          //                         BorderRadius.circular(5),
                          //                       ),
                          //                       scrollbarTheme:
                          //                       ScrollbarThemeData(
                          //                         radius:
                          //                         const Radius.circular(5),
                          //                         thickness:
                          //                         MaterialStateProperty.all<
                          //                             double>(6),
                          //                         thumbVisibility:
                          //                         MaterialStateProperty.all<
                          //                             bool>(true),
                          //                       ),
                          //                     ),
                          //                     openWithLongPress:
                          //                     (isAdmin) ? false : true,
                          //                     autofocus: true,
                          //                     isExpanded: true,
                          //                     value: contoller
                          //                         .selectCategory!.value,
                          //                     hint: Text(
                          //                       'เลือกทั้งหมด',
                          //                       style: TextStyle(
                          //                           fontSize: 15.0,
                          //                           color: colorGrey,
                          //                           fontWeight:
                          //                           FontWeight.w400),
                          //                     ),
                          //                     items: contoller.category.map<
                          //                         DropdownMenuItem<String>>(
                          //                             (String? value) {
                          //                           return DropdownMenuItem<String>(
                          //                             value: value!,
                          //                             child: Text(
                          //                               value,
                          //                               style: TextStyle(
                          //                                   fontSize: 15.0,
                          //                                   color: colorBlack,
                          //                                   fontWeight:
                          //                                   FontWeight.w400),
                          //                             ),
                          //                           );
                          //                         }).toList(),
                          //                     iconStyleData:
                          //                     const IconStyleData(
                          //                         icon: Icon(
                          //                           Icons.keyboard_arrow_down,
                          //                           size: 24,
                          //                         )),
                          //                     onChanged: (valueSelect) {
                          //                       contoller.selectCategory!
                          //                           .value = valueSelect!;
                          //                     },
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          if (MediaQuery.of(context).size.width < 900)
                            const SizedBox(
                              height: 20,
                            ),
                          if (MediaQuery.of(context).size.width < 900)
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'ชื่อรายการ',
                                              style: textStyle(context,
                                                  color: colorBlack,
                                                  fontSize: 25),
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
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,

                                            enabled: (isAdmin) ? true : false,
                                            controller: contoller.nameCon.value,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.w400),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "ชื่อรายการ",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
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

                          if (MediaQuery.of(context).size.width > 899)
                            Container(
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
                                                  fontSize: 25),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? const SizedBox()
                                            : Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'สถานะของรายการ',
                                                  style: textStyle(context,
                                                      color: colorBlack,
                                                      fontSize: 25),
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
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textStyleDayOnCalendar:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black),
                                                  textStyleDayOnCalendarSelected:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textStyleDayOnCalendarDisabled:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.1)),
                                                  textStyleMonthYearHeader:
                                                      textStyle(context,
                                                          fontSize: 25,
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
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black),
                                                  textStyleButtonPositive:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.amber,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textStyleButtonNegative:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black45
                                                              .withOpacity(
                                                                  0.5)),
                                                  decorationDateSelected:
                                                      const BoxDecoration(
                                                          color: Colors.amber,
                                                          shape:
                                                              BoxShape.circle),
                                                ),
                                                styleYearPicker:
                                                    MaterialRoundedYearPickerStyle(
                                                  textStyleYear: textStyle(
                                                      context,
                                                      fontSize: 25,
                                                      color: Colors.black),
                                                  textStyleYearSelected:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  heightYearRow: 100,
                                                ),
                                                context: context,
                                                locale:
                                                    const Locale("th", "TH"),
                                              );
                                              if (newDateTime != null) {
                                                contoller.date.value =
                                                    newDateTime
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
                                                        fontSize: 25,
                                                        color: colorBlack),
                                                  ),
                                                  const Icon(
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
                                        child: (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? const SizedBox()
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
                                                        BorderRadius.circular(
                                                            5)),
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton2<String>(
                                                      openWithLongPress:
                                                          (isAdmin)
                                                              ? false
                                                              : true,
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
                                                      isExpanded: true,
                                                      value: contoller
                                                          .selectStatusList!
                                                          .value,
                                                      hint: Text(
                                                        'เลือกทั้งหมด',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 25,
                                                            color: colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                            style: textStyle(
                                                                context,
                                                                fontSize: 25,
                                                                color:
                                                                    colorBlack,
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
                          if (MediaQuery.of(context).size.width < 900)
                            Container(
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
                                                  fontSize: 25),
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
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textStyleDayOnCalendar:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black),
                                                  textStyleDayOnCalendarSelected:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textStyleDayOnCalendarDisabled:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.1)),
                                                  textStyleMonthYearHeader:
                                                      textStyle(context,
                                                          fontSize: 25,
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
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black),
                                                  textStyleButtonPositive:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.amber,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  textStyleButtonNegative:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black45
                                                              .withOpacity(
                                                                  0.5)),
                                                  decorationDateSelected:
                                                      const BoxDecoration(
                                                          color: Colors.amber,
                                                          shape:
                                                              BoxShape.circle),
                                                ),
                                                styleYearPicker:
                                                    MaterialRoundedYearPickerStyle(
                                                  textStyleYear: textStyle(
                                                      context,
                                                      fontSize: 25,
                                                      color: Colors.black),
                                                  textStyleYearSelected:
                                                      textStyle(context,
                                                          fontSize: 25,
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  heightYearRow: 100,
                                                ),
                                                context: context,
                                                locale:
                                                    const Locale("th", "TH"),
                                              );
                                              if (newDateTime != null) {
                                                contoller.date.value =
                                                    newDateTime
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
                                                        fontSize: 25,
                                                        color: colorBlack),
                                                  ),
                                                  const Icon(
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (MediaQuery.of(context).size.width < 900)
                            if (contoller.dataEditEvent.value.events != null)
                              const SizedBox(
                                height: 20,
                              ),
                          if (MediaQuery.of(context).size.width < 900)
                            if (contoller.dataEditEvent.value.events != null)
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: (contoller.dataEditEvent.value
                                                      .events ==
                                                  null)
                                              ? const SizedBox()
                                              : Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'สถานะของรายการ',
                                                    style: textStyle(context,
                                                        color: colorBlack,
                                                        fontSize: 25),
                                                  )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: (contoller.dataEditEvent.value
                                                      .events ==
                                                  null)
                                              ? const SizedBox()
                                              : Container(
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
                                                        openWithLongPress:
                                                            (isAdmin)
                                                                ? false
                                                                : true,
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
                                                        isExpanded: true,
                                                        value: contoller
                                                            .selectStatusList!
                                                            .value,
                                                        hint: Text(
                                                          'เลือกทั้งหมด',
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25,
                                                              color: colorGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                                              style: textStyle(
                                                                  context,
                                                                  fontSize: 25,
                                                                  color:
                                                                      colorBlack,
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

                          if (MediaQuery.of(context).size.width > 899)
                            Container(
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
                                                  fontSize: 25),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? const SizedBox()
                                            : Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'สถานะหน่วยงานที่รับผิดชอบ',
                                                  style: textStyle(context,
                                                      color: colorBlack,
                                                      fontSize: 25),
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
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            enabled: (isAdmin) ? true : false,
                                            controller:
                                                contoller.responsible.value,
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.w400),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "หน่วยงานที่รับผิดชอบ",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? const SizedBox()
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
                                                        BorderRadius.circular(
                                                            5)),
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton2<String>(
                                                      openWithLongPress:
                                                          (isAdmin)
                                                              ? false
                                                              : true,
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
                                                      isExpanded: true,
                                                      value: contoller
                                                          .selectStatusResponsible!
                                                          .value,
                                                      hint: Text(
                                                        'เลือกทั้งหมด',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 25,
                                                            color: colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                            style: textStyle(
                                                                context,
                                                                fontSize: 25,
                                                                color:
                                                                    colorBlack,
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
                          if (MediaQuery.of(context).size.width < 900)
                            Container(
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
                                                  fontSize: 25),
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
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            enabled: (isAdmin) ? true : false,
                                            controller:
                                                contoller.responsible.value,
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.w400),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "หน่วยงานที่รับผิดชอบ",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (MediaQuery.of(context).size.width < 900)
                            if (contoller.dataEditEvent.value.events != null)
                              const SizedBox(
                                height: 20,
                              ),
                          if (MediaQuery.of(context).size.width < 900)
                            if (contoller.dataEditEvent.value.events != null)
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: (contoller.dataEditEvent.value
                                                      .events ==
                                                  null)
                                              ? const SizedBox()
                                              : Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'สถานะหน่วยงานที่รับผิดชอบ',
                                                    style: textStyle(context,
                                                        color: colorBlack,
                                                        fontSize: 25),
                                                  )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: (contoller.dataEditEvent.value
                                                      .events ==
                                                  null)
                                              ? const SizedBox()
                                              : Container(
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
                                                        openWithLongPress:
                                                            (isAdmin)
                                                                ? false
                                                                : true,
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
                                                        isExpanded: true,
                                                        value: contoller
                                                            .selectStatusResponsible!
                                                            .value,
                                                        hint: Text(
                                                          'เลือกทั้งหมด',
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25,
                                                              color: colorGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                                              style: textStyle(
                                                                  context,
                                                                  fontSize: 25,
                                                                  color:
                                                                      colorBlack,
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

                          if (MediaQuery.of(context).size.width > 899)
                            Container(
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
                                                  fontSize: 25),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          // child: Text(
                                          //   'ระดับความรุนแรง',
                                          //   style: textStyle(context,
                                          //       color: colorBlack,
                                          //       fontSize: 15),
                                          // )
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            enabled: (isAdmin) ? true : false,
                                            controller:
                                                contoller.createBy.value,
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 25),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "รับเรื่องจาก",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
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
                                          // child: Row(
                                          //   children: [
                                          //     Radio(
                                          //         value: 0,
                                          //         groupValue:
                                          //             contoller.radio.value,
                                          //         onChanged: (val) {
                                          //           if (isAdmin) {
                                          //             contoller.radio.value =
                                          //                 val!;
                                          //           }
                                          //         }),
                                          //     const SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Text(
                                          //       'เล็กน้อย',
                                          //       style: textStyle(context,
                                          //           color: colorBlack,
                                          //           fontSize: 15),
                                          //     ),
                                          //     const SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Radio(
                                          //         value: 1,
                                          //         groupValue:
                                          //             contoller.radio.value,
                                          //         onChanged: (val) {
                                          //           if (isAdmin) {
                                          //             contoller.radio.value =
                                          //                 val!;
                                          //           }
                                          //         }),
                                          //     const SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Text(
                                          //       'ปานกลาง',
                                          //       style: textStyle(context,
                                          //           color: colorBlack,
                                          //           fontSize: 15),
                                          //     ),
                                          //     const SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Radio(
                                          //         value: 2,
                                          //         groupValue:
                                          //             contoller.radio.value,
                                          //         onChanged: (val) {
                                          //           if (isAdmin) {
                                          //             contoller.radio.value =
                                          //                 val!;
                                          //           }
                                          //         }),
                                          //     const SizedBox(
                                          //       width: 10,
                                          //     ),
                                          //     Text(
                                          //       'รุนแรง',
                                          //       style: textStyle(context,
                                          //           color: colorBlack,
                                          //           fontSize: 15),
                                          //     ),
                                          //   ],
                                          // ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (MediaQuery.of(context).size.width < 900)
                            Container(
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
                                                  fontSize: 25),
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
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            enabled: (isAdmin) ? true : false,
                                            controller:
                                                contoller.createBy.value,
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 25),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "รับเรื่องจาก",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          // if (MediaQuery.of(context).size.width < 900)
                          //   const SizedBox(
                          //     height: 20,
                          //   ),
                          // if (MediaQuery.of(context).size.width < 900)
                          //   Container(
                          //     height: 65,
                          //     child: Column(
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Expanded(
                          //               flex: 5,
                          //               child: Container(
                          //                   alignment: Alignment.centerLeft,
                          //                   // child: Text(
                          //                   //   'ระดับความรุนแรง',
                          //                   //   style: textStyle(context,
                          //                   //       color: colorBlack,
                          //                   //       fontSize: 15),
                          //                   // )
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             Expanded(
                          //               flex: 5,
                          //               child: Container(
                          //                 height: 40,
                          //                 // child: Row(
                          //                 //   children: [
                          //                 //     Radio(
                          //                 //         value: 0,
                          //                 //         groupValue:
                          //                 //             contoller.radio.value,
                          //                 //         onChanged: (val) {
                          //                 //           if (isAdmin) {
                          //                 //             contoller.radio.value =
                          //                 //                 val!;
                          //                 //           }
                          //                 //         }),
                          //                 //     const SizedBox(
                          //                 //       width: 10,
                          //                 //     ),
                          //                 //     Text(
                          //                 //       'เล็กน้อย',
                          //                 //       style: textStyle(context,
                          //                 //           color: colorBlack,
                          //                 //           fontSize: 15),
                          //                 //     ),
                          //                 //     const SizedBox(
                          //                 //       width: 10,
                          //                 //     ),
                          //                 //     Radio(
                          //                 //         value: 1,
                          //                 //         groupValue:
                          //                 //             contoller.radio.value,
                          //                 //         onChanged: (val) {
                          //                 //           if (isAdmin) {
                          //                 //             contoller.radio.value =
                          //                 //                 val!;
                          //                 //           }
                          //                 //         }),
                          //                 //     const SizedBox(
                          //                 //       width: 10,
                          //                 //     ),
                          //                 //     Text(
                          //                 //       'ปานกลาง',
                          //                 //       style: textStyle(context,
                          //                 //           color: colorBlack,
                          //                 //           fontSize: 15),
                          //                 //     ),
                          //                 //     const SizedBox(
                          //                 //       width: 10,
                          //                 //     ),
                          //                 //     Radio(
                          //                 //         value: 2,
                          //                 //         groupValue:
                          //                 //             contoller.radio.value,
                          //                 //         onChanged: (val) {
                          //                 //           if (isAdmin) {
                          //                 //             contoller.radio.value =
                          //                 //                 val!;
                          //                 //           }
                          //                 //         }),
                          //                 //     const SizedBox(
                          //                 //       width: 10,
                          //                 //     ),
                          //                 //     Text(
                          //                 //       'รุนแรง',
                          //                 //       style: textStyle(context,
                          //                 //           color: colorBlack,
                          //                 //           fontSize: 15),
                          //                 //     ),
                          //                 //   ],
                          //                 // ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),

                          const SizedBox(
                            height: 30,
                          ),

                          if (MediaQuery.of(context).size.width > 899)
                            Container(
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
                                                  fontSize: 25),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? const SizedBox()
                                            : Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'สถานะหน่วยงานที่เกี่ยวข้อง',
                                                  style: textStyle(context,
                                                      color: colorBlack,
                                                      fontSize: 25),
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
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            enabled: (isAdmin) ? true : false,
                                            controller:
                                                contoller.relevant.value,
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.w400),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "หน่วยงานที่เกี่ยวข้อง",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: (contoller.dataEditEvent.value
                                                    .events ==
                                                null)
                                            ? const SizedBox()
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
                                                        BorderRadius.circular(
                                                            5)),
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton2<String>(
                                                      openWithLongPress:
                                                          (isAdmin)
                                                              ? false
                                                              : true,
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
                                                      isExpanded: true,
                                                      value: contoller
                                                          .selectStatusrelevant!
                                                          .value,
                                                      hint: Text(
                                                        'เลือกทั้งหมด',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 25,
                                                            color: colorGrey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
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
                                                            style: textStyle(
                                                                context,
                                                                fontSize: 25,
                                                                color:
                                                                    colorBlack,
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
                          if (MediaQuery.of(context).size.width < 900)
                            Container(
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
                                                  fontSize: 25),
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
                                              left: 10, right: 10),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: colorWhite,
                                          ),
                                          child: TextFormField(
                                            //key: contoller.formKey,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                              }
                                              return null;
                                            },
                                            enabled: (isAdmin) ? true : false,
                                            controller:
                                                contoller.relevant.value,
                                            style: textStyle(context,
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.w400),
                                            decoration:
                                                InputDecoration.collapsed(
                                              fillColor: colorWhite,
                                              hintText: "หน่วยงานที่เกี่ยวข้อง",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              // border: OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: colorGrey,
                                              //     width: 2,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(5),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (MediaQuery.of(context).size.width < 900)
                            if (contoller.dataEditEvent.value.events != null)
                              const SizedBox(
                                height: 20,
                              ),
                          if (MediaQuery.of(context).size.width < 900)
                            if (contoller.dataEditEvent.value.events != null)
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: (contoller.dataEditEvent.value
                                                      .events ==
                                                  null)
                                              ? const SizedBox()
                                              : Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'สถานะหน่วยงานที่เกี่ยวข้อง',
                                                    style: textStyle(context,
                                                        color: colorBlack,
                                                        fontSize: 25),
                                                  )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: (contoller.dataEditEvent.value
                                                      .events ==
                                                  null)
                                              ? const SizedBox()
                                              : Container(
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
                                                        openWithLongPress:
                                                            (isAdmin)
                                                                ? false
                                                                : true,
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
                                                        isExpanded: true,
                                                        value: contoller
                                                            .selectStatusrelevant!
                                                            .value,
                                                        hint: Text(
                                                          'เลือกทั้งหมด',
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25,
                                                              color: colorGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                                              style: textStyle(
                                                                  context,
                                                                  fontSize: 25,
                                                                  color:
                                                                      colorBlack,
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
                          //
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          //
                          // // if (MediaQuery.of(context).size.width > 899)
                          // //   Container(
                          // //     height: 65,
                          // //     child: Column(
                          // //       children: [
                          // //         Row(
                          // //           children: [
                          // //             Expanded(
                          // //               flex: 5,
                          // //               child: Container(
                          // //                   alignment: Alignment.centerLeft,
                          // //                   child: Text(
                          // //                     'ผู้ประสบภัย',
                          // //                     style: textStyle(context,
                          // //                         color: colorBlack,
                          // //                         fontSize: 15),
                          // //                   )),
                          // //             ),
                          // //           ],
                          // //         ),
                          // //         Row(
                          // //           children: [
                          // //             Text(
                          // //               'ผู้เสียชีวิต',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 controller: contoller.die.value,
                          // //                 textAlign: TextAlign.center,
                          // //                 keyboardType: TextInputType.number,
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.die.value.text = '0';
                          // //                   }
                          // //                 },
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 40,
                          // //             ),
                          // //             Text(
                          // //               'เพศหญิง',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 controller: contoller.womenDie.value,
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 textAlign: TextAlign.center,
                          // //                 keyboardType: TextInputType.number,
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.womenDie.value.text =
                          // //                         '0';
                          // //                   }
                          // //                 },
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 40,
                          // //             ),
                          // //             Text(
                          // //               'เพศชาย',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 controller: contoller.mandie.value,
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 textAlign: TextAlign.center,
                          // //                 keyboardType: TextInputType.number,
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.mandie.value.text = '0';
                          // //                   }
                          // //                 },
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 40,
                          // //             ),
                          // //             Text(
                          // //               'ไม่สามารถระบุเพศ',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 controller:
                          // //                     contoller.unGenderDie.value,
                          // //                 textAlign: TextAlign.center,
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.unGenderDie.value.text =
                          // //                         '0';
                          // //                   }
                          // //                 },
                          // //                 keyboardType: TextInputType.number,
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //           ],
                          // //         ),
                          // //       ],
                          // //     ),
                          // //   ),
                          // // if (MediaQuery.of(context).size.width < 900)
                          // //   Container(
                          // //     height: 65,
                          // //     child: Column(
                          // //       children: [
                          // //         Row(
                          // //           children: [
                          // //             Expanded(
                          // //               flex: 5,
                          // //               child: Container(
                          // //                   alignment: Alignment.centerLeft,
                          // //                   child: Text(
                          // //                     'ผู้ประสบภัย',
                          // //                     style: textStyle(context,
                          // //                         color: colorBlack,
                          // //                         fontSize: 15),
                          // //                   )),
                          // //             ),
                          // //           ],
                          // //         ),
                          // //         Row(
                          // //           children: [
                          // //             Text(
                          // //               'ผู้เสียชีวิต',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 controller: contoller.die.value,
                          // //                 textAlign: TextAlign.center,
                          // //                 keyboardType: TextInputType.number,
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.die.value.text = '0';
                          // //                   }
                          // //                 },
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 30,
                          // //             ),
                          // //             Text(
                          // //               'เพศหญิง',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 controller: contoller.womenDie.value,
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 textAlign: TextAlign.center,
                          // //                 keyboardType: TextInputType.number,
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.womenDie.value.text =
                          // //                         '0';
                          // //                   }
                          // //                 },
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //           ],
                          // //         ),
                          // //       ],
                          // //     ),
                          // //   ),
                          // // if (MediaQuery.of(context).size.width < 900)
                          // //   const SizedBox(
                          // //     height: 20,
                          // //   ),
                          // // if (MediaQuery.of(context).size.width < 900)
                          // //   Container(
                          // //     height: 65,
                          // //     child: Column(
                          // //       children: [
                          // //         Row(
                          // //           children: [
                          // //             Text(
                          // //               'เพศชาย',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 20,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 controller: contoller.mandie.value,
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 textAlign: TextAlign.center,
                          // //                 keyboardType: TextInputType.number,
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.mandie.value.text = '0';
                          // //                   }
                          // //                 },
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 30,
                          // //             ),
                          // //             Text(
                          // //               'ไม่สามารถระบุเพศ',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Container(
                          // //               height: 40,
                          // //               width: 80,
                          // //               color: colorWhite,
                          // //               child: TextFormField(
                          // //                 inputFormatters: <TextInputFormatter>[
                          // //                   FilteringTextInputFormatter.allow(
                          // //                       RegExp(r'[0-9]')),
                          // //                   FilteringTextInputFormatter
                          // //                       .digitsOnly
                          // //                 ],
                          // //                 controller:
                          // //                     contoller.unGenderDie.value,
                          // //                 textAlign: TextAlign.center,
                          // //                 onChanged: (value) {
                          // //                   if (value.isEmpty) {
                          // //                     contoller.unGenderDie.value.text =
                          // //                         '0';
                          // //                   }
                          // //                 },
                          // //                 keyboardType: TextInputType.number,
                          // //                 decoration: InputDecoration(
                          // //                   fillColor: colorWhite,
                          // //                   filled: true,
                          // //                   border: OutlineInputBorder(
                          // //                     borderSide: BorderSide(
                          // //                       color: colorGrey,
                          // //                       width: 2,
                          // //                     ),
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //             ),
                          // //             const SizedBox(
                          // //               width: 10,
                          // //             ),
                          // //             Text(
                          // //               'คน',
                          // //               style: textStyle(context,
                          // //                   color: colorBlack, fontSize: 15),
                          // //             ),
                          // //           ],
                          // //         ),
                          // //       ],
                          // //     ),
                          // //   ),
                          // //
                          // // const SizedBox(
                          // //   height: 10,
                          // // ),
                          // // ListView.builder(
                          // //   physics: const NeverScrollableScrollPhysics(),
                          // //   padding: const EdgeInsets.only(bottom: 20),
                          // //   shrinkWrap: true,
                          // //   itemCount: contoller.listTextNameDie.length,
                          // //   itemBuilder: (context, index) {
                          // //     return (MediaQuery.of(context).size.width < 900)
                          // //         ? Container(
                          // //             margin: const EdgeInsets.only(
                          // //                 bottom: 5, top: 5),
                          // //             height: 100,
                          // //             child: Column(
                          // //               children: [
                          // //                 Row(
                          // //                   children: [
                          // //                     Container(
                          // //                       decoration: BoxDecoration(
                          // //                           borderRadius:
                          // //                               BorderRadius.circular(
                          // //                                   100),
                          // //                           color: const Color(
                          // //                               0xfffd9e1ec)),
                          // //                       child: Text('${index + 1}'),
                          // //                       alignment: Alignment.center,
                          // //                       width: 30,
                          // //                       height: 30,
                          // //                     ),
                          // //                     const SizedBox(
                          // //                       width: 20,
                          // //                     ),
                          // //                     Text(
                          // //                       'ชื่อ-นามสกุล',
                          // //                       style: textStyle(context,
                          // //                           color: colorBlack,
                          // //                           fontSize: 15),
                          // //                     ),
                          // //                     const SizedBox(
                          // //                       width: 10,
                          // //                     ),
                          // //                     Container(
                          // //                       padding: const EdgeInsets.only(
                          // //                           left: 10, right: 10),
                          // //                       alignment: Alignment.centerLeft,
                          // //                       height: 40,
                          // //                       decoration: BoxDecoration(
                          // //                         borderRadius:
                          // //                             BorderRadius.circular(5),
                          // //                         border: Border.all(
                          // //                             color: Colors.grey),
                          // //                         color: colorWhite,
                          // //                       ),
                          // //                       width: 250,
                          // //                       child: TextFormField(
                          // //                         enabled: (isAdmin)
                          // //                             ? true
                          // //                             : (contoller
                          // //                                         .dataEditEvent
                          // //                                         .value
                          // //                                         .events ==
                          // //                                     null)
                          // //                                 ? true
                          // //                                 : (index >=
                          // //                                         contoller
                          // //                                             .dataEditEvent
                          // //                                             .value
                          // //                                             .events!
                          // //                                             .deceased!
                          // //                                             .deceaseList!
                          // //                                             .length)
                          // //                                     ? true
                          // //                                     : false,
                          // //                         controller: contoller
                          // //                             .listTextNameDie[index],
                          // //                         //key: contoller.formKey,
                          // //                         validator: (value) {
                          // //                           if (value!.isEmpty) {
                          // //                             return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          // //                           }
                          // //                           return null;
                          // //                         },
                          // //                         textAlign: TextAlign.left,
                          // //                         keyboardType:
                          // //                             TextInputType.number,
                          // //                         decoration:
                          // //                             InputDecoration.collapsed(
                          // //                           fillColor: colorWhite,
                          // //                           filled: true, hintText: '',
                          // //                           // border: OutlineInputBorder(
                          // //                           //   borderSide: BorderSide(
                          // //                           //     color: colorGrey,
                          // //                           //     width: 2,
                          // //                           //   ),
                          // //                           //   borderRadius:
                          // //                           //       BorderRadius.circular(5),
                          // //                           // ),
                          // //                         ),
                          // //                       ),
                          // //                     ),
                          // //                   ],
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   height: 20,
                          // //                 ),
                          // //                 Row(
                          // //                   children: [
                          // //                     Text(
                          // //                       'เพศ',
                          // //                       style: textStyle(context,
                          // //                           color: colorBlack,
                          // //                           fontSize: 15),
                          // //                     ),
                          // //                     const SizedBox(
                          // //                       width: 10,
                          // //                     ),
                          // //                     Container(
                          // //                       padding: const EdgeInsets.only(
                          // //                           left: 20, right: 5),
                          // //                       width: 150,
                          // //                       height: 40,
                          // //                       decoration: BoxDecoration(
                          // //                           color: colorWhite,
                          // //                           border: Border.all(
                          // //                             color: Colors.black26,
                          // //                             width: 1,
                          // //                           ),
                          // //                           borderRadius:
                          // //                               BorderRadius.circular(
                          // //                                   5)),
                          // //                       alignment: Alignment.center,
                          // //                       child: SizedBox(
                          // //                         width: 100,
                          // //                         child: Obx(
                          // //                           () =>
                          // //                               DropdownButtonHideUnderline(
                          // //                             child: DropdownButton2<
                          // //                                 String>(
                          // //                               dropdownStyleData:
                          // //                                   DropdownStyleData(
                          // //                                 maxHeight: 300,
                          // //                                 decoration:
                          // //                                     BoxDecoration(
                          // //                                   borderRadius:
                          // //                                       BorderRadius
                          // //                                           .circular(
                          // //                                               5),
                          // //                                 ),
                          // //                                 scrollbarTheme:
                          // //                                     ScrollbarThemeData(
                          // //                                   radius: const Radius
                          // //                                       .circular(5),
                          // //                                   thickness:
                          // //                                       MaterialStateProperty
                          // //                                           .all<double>(
                          // //                                               6),
                          // //                                   thumbVisibility:
                          // //                                       MaterialStateProperty
                          // //                                           .all<bool>(
                          // //                                               true),
                          // //                                 ),
                          // //                               ),
                          // //                               autofocus: true,
                          // //                               isExpanded: true,
                          // //                               openWithLongPress:
                          // //                                   (isAdmin)
                          // //                                       ? false
                          // //                                       : (contoller
                          // //                                                   .dataEditEvent
                          // //                                                   .value
                          // //                                                   .events ==
                          // //                                               null)
                          // //                                           ? false
                          // //                                           : (index >=
                          // //                                                   contoller.dataEditEvent.value.events!.deceased!.deceaseList!.length)
                          // //                                               ? false
                          // //                                               : true,
                          // //                               value: contoller
                          // //                                   .listGenderDie[
                          // //                                       index]
                          // //                                   .value,
                          // //                               items: contoller
                          // //                                   .listGender
                          // //                                   .map<
                          // //                                       DropdownMenuItem<
                          // //                                           String>>((String?
                          // //                                       value) {
                          // //                                 return DropdownMenuItem<
                          // //                                     String>(
                          // //                                   value: value!,
                          // //                                   child: Text(
                          // //                                     value,
                          // //                                     style: TextStyle(
                          // //                                         fontSize:
                          // //                                             13.0,
                          // //                                         color:
                          // //                                             colorBlack,
                          // //                                         fontWeight:
                          // //                                             FontWeight
                          // //                                                 .w400),
                          // //                                   ),
                          // //                                 );
                          // //                               }).toList(),
                          // //                               iconStyleData:
                          // //                                   const IconStyleData(
                          // //                                       icon: Icon(
                          // //                                 Icons
                          // //                                     .keyboard_arrow_down,
                          // //                                 size: 24,
                          // //                               )),
                          // //                               onChanged:
                          // //                                   (valueSelect) {
                          // //                                 contoller
                          // //                                     .UpdateListGenderDie(
                          // //                                         valueSelect!,
                          // //                                         index);
                          // //                                 // contoller.listGenderDie[index] = valueSelect!;
                          // //                               },
                          // //                               // enableFeedback: (contoller.dataEditEvent.value.events==null)?false:(index>=contoller.dataEditEvent.value.events!.deceased!.deceaseList!.length)?true:false,
                          // //                             ),
                          // //                           ),
                          // //                         ),
                          // //                       ),
                          // //                     ),
                          // //                     const SizedBox(
                          // //                       width: 20,
                          // //                     ),
                          // //                     Text(
                          // //                       'อายุ',
                          // //                       style: textStyle(context,
                          // //                           color: colorBlack,
                          // //                           fontSize: 15),
                          // //                     ),
                          // //                     const SizedBox(
                          // //                       width: 10,
                          // //                     ),
                          // //                     Container(
                          // //                       padding: const EdgeInsets.only(
                          // //                           left: 10, right: 10),
                          // //                       alignment: Alignment.centerLeft,
                          // //                       height: 40,
                          // //                       decoration: BoxDecoration(
                          // //                         borderRadius:
                          // //                             BorderRadius.circular(5),
                          // //                         border: Border.all(
                          // //                             color: Colors.grey),
                          // //                         color: colorWhite,
                          // //                       ),
                          // //                       width: 100,
                          // //                       child: TextFormField(
                          // //                         enabled: (isAdmin)
                          // //                             ? true
                          // //                             : (contoller
                          // //                                         .dataEditEvent
                          // //                                         .value
                          // //                                         .events ==
                          // //                                     null)
                          // //                                 ? true
                          // //                                 : (index >=
                          // //                                         contoller
                          // //                                             .dataEditEvent
                          // //                                             .value
                          // //                                             .events!
                          // //                                             .deceased!
                          // //                                             .deceaseList!
                          // //                                             .length)
                          // //                                     ? true
                          // //                                     : false,
                          // //                         controller: contoller
                          // //                             .listTextAgeDie[index],
                          // //                         inputFormatters: <TextInputFormatter>[
                          // //                           FilteringTextInputFormatter
                          // //                               .allow(
                          // //                                   RegExp(r'[0-9]')),
                          // //                           FilteringTextInputFormatter
                          // //                               .digitsOnly
                          // //                         ],
                          // //                         // //key: contoller.formKey,
                          // //                         validator: (value) {
                          // //                           if (value!.isEmpty) {
                          // //                             return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          // //                           }
                          // //                           return null;
                          // //                         },
                          // //                         textAlign: TextAlign.center,
                          // //                         keyboardType:
                          // //                             TextInputType.number,
                          // //                         decoration:
                          // //                             InputDecoration.collapsed(
                          // //                           fillColor: colorWhite,
                          // //                           filled: true,
                          // //                           // border: OutlineInputBorder(
                          // //                           //   borderSide: BorderSide(
                          // //                           //     color: colorGrey,
                          // //                           //     width: 2,
                          // //                           //   ),
                          // //                           //   borderRadius:
                          // //                           //       BorderRadius.circular(5),
                          // //                           // ),
                          // //                           hintText: '',
                          // //                         ),
                          // //                       ),
                          // //                     ),
                          // //                     const SizedBox(
                          // //                       width: 20,
                          // //                     ),
                          // //                     (isAdmin)
                          // //                         ? InkWell(
                          // //                             onTap: () {
                          // //                               if (contoller
                          // //                                           .listDataIDUserDie[
                          // //                                       index] !=
                          // //                                   'new') {
                          // //                                 contoller
                          // //                                     .listStringNameDeleteDie
                          // //                                     .add(
                          // //                                         'ชื่อ ${contoller.listTextNameDie[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeDie[index].value.text}');
                          // //
                          // //                                 contoller
                          // //                                     .listDataDeleteIDUserDie
                          // //                                     .add(RemoveDeceasedList(
                          // //                                         id: contoller
                          // //                                                 .listDataIDUserDie[
                          // //                                             index]));
                          // //                               }
                          // //                               contoller.listGenderDie
                          // //                                   .removeAt(index);
                          // //                               contoller.listTextAgeDie
                          // //                                   .removeAt(index);
                          // //                               contoller
                          // //                                   .listTextNameDie
                          // //                                   .removeAt(index);
                          // //                               contoller
                          // //                                   .listDataIDUserDie
                          // //                                   .removeAt(index);
                          // //                             },
                          // //                             child: Container(
                          // //                               decoration:
                          // //                                   BoxDecoration(
                          // //                                       borderRadius:
                          // //                                           BorderRadius
                          // //                                               .circular(
                          // //                                                   5),
                          // //                                       border: Border.all(
                          // //                                           color:
                          // //                                               colorRed),
                          // //                                       color: Colors
                          // //                                           .white),
                          // //                               child: Row(
                          // //                                 mainAxisSize:
                          // //                                     MainAxisSize.min,
                          // //                                 mainAxisAlignment:
                          // //                                     MainAxisAlignment
                          // //                                         .center,
                          // //                                 children: [
                          // //                                   const Icon(
                          // //                                     CupertinoIcons
                          // //                                         .multiply,
                          // //                                     size: 17,
                          // //                                     color: Colors.red,
                          // //                                   ),
                          // //                                   const SizedBox(
                          // //                                     width: 10,
                          // //                                   ),
                          // //                                   Text(
                          // //                                     'ลบ',
                          // //                                     style: textStyle(
                          // //                                         context,
                          // //                                         color:
                          // //                                             colorRed,
                          // //                                         fontSize: 15),
                          // //                                   ),
                          // //                                 ],
                          // //                               ),
                          // //                               height: 40,
                          // //                               width: 80,
                          // //                             ),
                          // //                           )
                          // //                         : (contoller.dataEditEvent
                          // //                                     .value.events ==
                          // //                                 null)
                          // //                             ? InkWell(
                          // //                                 onTap: () {
                          // //                                   if (contoller
                          // //                                               .listDataIDUserDie[
                          // //                                           index] !=
                          // //                                       'new') {
                          // //                                     contoller
                          // //                                         .listStringNameDeleteDie
                          // //                                         .add(
                          // //                                             'ชื่อ ${contoller.listTextNameDie[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeDie[index].value.text}');
                          // //
                          // //                                     contoller
                          // //                                         .listDataDeleteIDUserDie
                          // //                                         .add(RemoveDeceasedList(
                          // //                                             id: contoller
                          // //                                                     .listDataIDUserDie[
                          // //                                                 index]));
                          // //                                   }
                          // //                                   contoller
                          // //                                       .listGenderDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                   contoller
                          // //                                       .listTextAgeDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                   contoller
                          // //                                       .listTextNameDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                   contoller
                          // //                                       .listDataIDUserDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                 },
                          // //                                 child: Container(
                          // //                                   decoration: BoxDecoration(
                          // //                                       borderRadius:
                          // //                                           BorderRadius
                          // //                                               .circular(
                          // //                                                   5),
                          // //                                       border: Border.all(
                          // //                                           color:
                          // //                                               colorRed),
                          // //                                       color: Colors
                          // //                                           .white),
                          // //                                   child: Row(
                          // //                                     mainAxisSize:
                          // //                                         MainAxisSize
                          // //                                             .min,
                          // //                                     mainAxisAlignment:
                          // //                                         MainAxisAlignment
                          // //                                             .center,
                          // //                                     children: [
                          // //                                       const Icon(
                          // //                                         CupertinoIcons
                          // //                                             .multiply,
                          // //                                         size: 17,
                          // //                                         color: Colors
                          // //                                             .red,
                          // //                                       ),
                          // //                                       const SizedBox(
                          // //                                         width: 10,
                          // //                                       ),
                          // //                                       Text(
                          // //                                         'ลบ',
                          // //                                         style: textStyle(
                          // //                                             context,
                          // //                                             color:
                          // //                                                 colorRed,
                          // //                                             fontSize:
                          // //                                                 13),
                          // //                                       ),
                          // //                                     ],
                          // //                                   ),
                          // //                                   height: 40,
                          // //                                   width: 80,
                          // //                                 ),
                          // //                               )
                          // //                             : (index >=
                          // //                                     contoller
                          // //                                         .dataEditEvent
                          // //                                         .value
                          // //                                         .events!
                          // //                                         .deceased!
                          // //                                         .deceaseList!
                          // //                                         .length)
                          // //                                 ? InkWell(
                          // //                                     onTap: () {
                          // //                                       if (contoller
                          // //                                                   .listDataIDUserDie[
                          // //                                               index] !=
                          // //                                           'new') {
                          // //                                         contoller
                          // //                                             .listStringNameDeleteDie
                          // //                                             .add(
                          // //                                                 'ชื่อ ${contoller.listTextNameDie[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeDie[index].value.text}');
                          // //                                         contoller
                          // //                                             .listDataDeleteIDUserDie
                          // //                                             .add(RemoveDeceasedList(
                          // //                                                 id: contoller
                          // //                                                     .listDataIDUserDie[index]));
                          // //                                       }
                          // //                                       contoller
                          // //                                           .listGenderDie
                          // //                                           .removeAt(
                          // //                                               index);
                          // //                                       contoller
                          // //                                           .listTextAgeDie
                          // //                                           .removeAt(
                          // //                                               index);
                          // //                                       contoller
                          // //                                           .listTextNameDie
                          // //                                           .removeAt(
                          // //                                               index);
                          // //                                       contoller
                          // //                                           .listDataIDUserDie
                          // //                                           .removeAt(
                          // //                                               index);
                          // //                                     },
                          // //                                     child: Container(
                          // //                                       decoration: BoxDecoration(
                          // //                                           borderRadius:
                          // //                                               BorderRadius.circular(
                          // //                                                   5),
                          // //                                           border: Border.all(
                          // //                                               color:
                          // //                                                   colorRed),
                          // //                                           color: Colors
                          // //                                               .white),
                          // //                                       child: Row(
                          // //                                         mainAxisSize:
                          // //                                             MainAxisSize
                          // //                                                 .min,
                          // //                                         mainAxisAlignment:
                          // //                                             MainAxisAlignment
                          // //                                                 .center,
                          // //                                         children: [
                          // //                                           const Icon(
                          // //                                             CupertinoIcons
                          // //                                                 .multiply,
                          // //                                             size: 17,
                          // //                                             color: Colors
                          // //                                                 .red,
                          // //                                           ),
                          // //                                           const SizedBox(
                          // //                                             width: 10,
                          // //                                           ),
                          // //                                           Text(
                          // //                                             'ลบ',
                          // //                                             style: textStyle(
                          // //                                                 context,
                          // //                                                 color:
                          // //                                                     colorRed,
                          // //                                                 fontSize:
                          // //                                                     13),
                          // //                                           ),
                          // //                                         ],
                          // //                                       ),
                          // //                                       height: 40,
                          // //                                       width: 80,
                          // //                                     ),
                          // //                                   )
                          // //                                 : const SizedBox()
                          // //                   ],
                          // //                 ),
                          // //               ],
                          // //             ),
                          // //           )
                          // //         : Container(
                          // //             margin: const EdgeInsets.only(
                          // //                 bottom: 5, top: 5),
                          // //             height: 40,
                          // //             child: Row(
                          // //               children: [
                          // //                 Container(
                          // //                   decoration: BoxDecoration(
                          // //                       borderRadius:
                          // //                           BorderRadius.circular(100),
                          // //                       color:
                          // //                           const Color(0xfffd9e1ec)),
                          // //                   child: Text('${index + 1}'),
                          // //                   alignment: Alignment.center,
                          // //                   width: 30,
                          // //                   height: 30,
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 20,
                          // //                 ),
                          // //                 Text(
                          // //                   'ชื่อ-นามสกุล',
                          // //                   style: textStyle(context,
                          // //                       color: colorBlack,
                          // //                       fontSize: 15),
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 10,
                          // //                 ),
                          // //                 Container(
                          // //                   padding: const EdgeInsets.only(
                          // //                       left: 10, right: 10),
                          // //                   alignment: Alignment.centerLeft,
                          // //                   height: 40,
                          // //                   decoration: BoxDecoration(
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                     border: Border.all(
                          // //                         color: Colors.grey),
                          // //                     color: colorWhite,
                          // //                   ),
                          // //                   width: 250,
                          // //                   child: TextFormField(
                          // //                     enabled: (isAdmin)
                          // //                         ? true
                          // //                         : (contoller.dataEditEvent
                          // //                                     .value.events ==
                          // //                                 null)
                          // //                             ? true
                          // //                             : (index >=
                          // //                                     contoller
                          // //                                         .dataEditEvent
                          // //                                         .value
                          // //                                         .events!
                          // //                                         .deceased!
                          // //                                         .deceaseList!
                          // //                                         .length)
                          // //                                 ? true
                          // //                                 : false,
                          // //                     controller: contoller
                          // //                         .listTextNameDie[index],
                          // //                     //key: contoller.formKey,
                          // //                     validator: (value) {
                          // //                       if (value!.isEmpty) {
                          // //                         return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          // //                       }
                          // //                       return null;
                          // //                     },
                          // //                     textAlign: TextAlign.left,
                          // //                     keyboardType:
                          // //                         TextInputType.number,
                          // //                     decoration:
                          // //                         InputDecoration.collapsed(
                          // //                       fillColor: colorWhite,
                          // //                       filled: true, hintText: '',
                          // //                       // border: OutlineInputBorder(
                          // //                       //   borderSide: BorderSide(
                          // //                       //     color: colorGrey,
                          // //                       //     width: 2,
                          // //                       //   ),
                          // //                       //   borderRadius:
                          // //                       //       BorderRadius.circular(5),
                          // //                       // ),
                          // //                     ),
                          // //                   ),
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 20,
                          // //                 ),
                          // //                 Text(
                          // //                   'เพศ',
                          // //                   style: textStyle(context,
                          // //                       color: colorBlack,
                          // //                       fontSize: 15),
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 10,
                          // //                 ),
                          // //                 Container(
                          // //                   padding: const EdgeInsets.only(
                          // //                       left: 20, right: 5),
                          // //                   width: 150,
                          // //                   height: 40,
                          // //                   decoration: BoxDecoration(
                          // //                       color: colorWhite,
                          // //                       border: Border.all(
                          // //                         color: Colors.black26,
                          // //                         width: 1,
                          // //                       ),
                          // //                       borderRadius:
                          // //                           BorderRadius.circular(5)),
                          // //                   alignment: Alignment.center,
                          // //                   child: SizedBox(
                          // //                     width: 100,
                          // //                     child: Obx(
                          // //                       () =>
                          // //                           DropdownButtonHideUnderline(
                          // //                         child:
                          // //                             DropdownButton2<String>(
                          // //                           dropdownStyleData:
                          // //                               DropdownStyleData(
                          // //                             maxHeight: 300,
                          // //                             decoration: BoxDecoration(
                          // //                               borderRadius:
                          // //                                   BorderRadius
                          // //                                       .circular(5),
                          // //                             ),
                          // //                             scrollbarTheme:
                          // //                                 ScrollbarThemeData(
                          // //                               radius: const Radius
                          // //                                   .circular(5),
                          // //                               thickness:
                          // //                                   MaterialStateProperty
                          // //                                       .all<double>(6),
                          // //                               thumbVisibility:
                          // //                                   MaterialStateProperty
                          // //                                       .all<bool>(
                          // //                                           true),
                          // //                             ),
                          // //                           ),
                          // //                           autofocus: true,
                          // //                           isExpanded: true,
                          // //                           openWithLongPress: (isAdmin)
                          // //                               ? false
                          // //                               : (contoller
                          // //                                           .dataEditEvent
                          // //                                           .value
                          // //                                           .events ==
                          // //                                       null)
                          // //                                   ? false
                          // //                                   : (index >=
                          // //                                           contoller
                          // //                                               .dataEditEvent
                          // //                                               .value
                          // //                                               .events!
                          // //                                               .deceased!
                          // //                                               .deceaseList!
                          // //                                               .length)
                          // //                                       ? false
                          // //                                       : true,
                          // //                           value: contoller
                          // //                               .listGenderDie[index]
                          // //                               .value,
                          // //                           items: contoller.listGender
                          // //                               .map<
                          // //                                       DropdownMenuItem<
                          // //                                           String>>(
                          // //                                   (String? value) {
                          // //                             return DropdownMenuItem<
                          // //                                 String>(
                          // //                               value: value!,
                          // //                               child: Text(
                          // //                                 value,
                          // //                                 style: TextStyle(
                          // //                                     fontSize: 15.0,
                          // //                                     color: colorBlack,
                          // //                                     fontWeight:
                          // //                                         FontWeight
                          // //                                             .w400),
                          // //                               ),
                          // //                             );
                          // //                           }).toList(),
                          // //                           iconStyleData:
                          // //                               const IconStyleData(
                          // //                                   icon: Icon(
                          // //                             Icons.keyboard_arrow_down,
                          // //                             size: 24,
                          // //                           )),
                          // //                           onChanged: (valueSelect) {
                          // //                             contoller
                          // //                                 .UpdateListGenderDie(
                          // //                                     valueSelect!,
                          // //                                     index);
                          // //                             // contoller.listGenderDie[index] = valueSelect!;
                          // //                           },
                          // //                           // enableFeedback: (contoller.dataEditEvent.value.events==null)?false:(index>=contoller.dataEditEvent.value.events!.deceased!.deceaseList!.length)?true:false,
                          // //                         ),
                          // //                       ),
                          // //                     ),
                          // //                   ),
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 20,
                          // //                 ),
                          // //                 Text(
                          // //                   'อายุ',
                          // //                   style: textStyle(context,
                          // //                       color: colorBlack,
                          // //                       fontSize: 15),
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 10,
                          // //                 ),
                          // //                 Container(
                          // //                   padding: const EdgeInsets.only(
                          // //                       left: 10, right: 10),
                          // //                   alignment: Alignment.centerLeft,
                          // //                   height: 40,
                          // //                   decoration: BoxDecoration(
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(5),
                          // //                     border: Border.all(
                          // //                         color: Colors.grey),
                          // //                     color: colorWhite,
                          // //                   ),
                          // //                   width: 100,
                          // //                   child: TextFormField(
                          // //                     enabled: (isAdmin)
                          // //                         ? true
                          // //                         : (contoller.dataEditEvent
                          // //                                     .value.events ==
                          // //                                 null)
                          // //                             ? true
                          // //                             : (index >=
                          // //                                     contoller
                          // //                                         .dataEditEvent
                          // //                                         .value
                          // //                                         .events!
                          // //                                         .deceased!
                          // //                                         .deceaseList!
                          // //                                         .length)
                          // //                                 ? true
                          // //                                 : false,
                          // //                     controller: contoller
                          // //                         .listTextAgeDie[index],
                          // //                     inputFormatters: <TextInputFormatter>[
                          // //                       FilteringTextInputFormatter
                          // //                           .allow(RegExp(r'[0-9]')),
                          // //                       FilteringTextInputFormatter
                          // //                           .digitsOnly
                          // //                     ],
                          // //                     // //key: contoller.formKey,
                          // //                     validator: (value) {
                          // //                       if (value!.isEmpty) {
                          // //                         return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          // //                       }
                          // //                       return null;
                          // //                     },
                          // //                     textAlign: TextAlign.center,
                          // //                     keyboardType:
                          // //                         TextInputType.number,
                          // //                     decoration:
                          // //                         InputDecoration.collapsed(
                          // //                       fillColor: colorWhite,
                          // //                       filled: true,
                          // //                       // border: OutlineInputBorder(
                          // //                       //   borderSide: BorderSide(
                          // //                       //     color: colorGrey,
                          // //                       //     width: 2,
                          // //                       //   ),
                          // //                       //   borderRadius:
                          // //                       //       BorderRadius.circular(5),
                          // //                       // ),
                          // //                       hintText: '',
                          // //                     ),
                          // //                   ),
                          // //                 ),
                          // //                 const SizedBox(
                          // //                   width: 20,
                          // //                 ),
                          // //                 (isAdmin)
                          // //                     ? InkWell(
                          // //                         onTap: () {
                          // //                           if (contoller
                          // //                                       .listDataIDUserDie[
                          // //                                   index] !=
                          // //                               'new') {
                          // //                             contoller
                          // //                                 .listStringNameDeleteDie
                          // //                                 .add(
                          // //                                     'ชื่อ ${contoller.listTextNameDie[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeDie[index].value.text}');
                          // //
                          // //                             contoller
                          // //                                 .listDataDeleteIDUserDie
                          // //                                 .add(RemoveDeceasedList(
                          // //                                     id: contoller
                          // //                                             .listDataIDUserDie[
                          // //                                         index]));
                          // //                           }
                          // //                           contoller.listGenderDie
                          // //                               .removeAt(index);
                          // //                           contoller.listTextAgeDie
                          // //                               .removeAt(index);
                          // //                           contoller.listTextNameDie
                          // //                               .removeAt(index);
                          // //                           contoller.listDataIDUserDie
                          // //                               .removeAt(index);
                          // //                         },
                          // //                         child: Container(
                          // //                           decoration: BoxDecoration(
                          // //                               borderRadius:
                          // //                                   BorderRadius
                          // //                                       .circular(5),
                          // //                               border: Border.all(
                          // //                                   color: colorRed),
                          // //                               color: Colors.white),
                          // //                           child: Row(
                          // //                             mainAxisSize:
                          // //                                 MainAxisSize.min,
                          // //                             mainAxisAlignment:
                          // //                                 MainAxisAlignment
                          // //                                     .center,
                          // //                             children: [
                          // //                               const Icon(
                          // //                                 CupertinoIcons
                          // //                                     .multiply,
                          // //                                 size: 17,
                          // //                                 color: Colors.red,
                          // //                               ),
                          // //                               const SizedBox(
                          // //                                 width: 10,
                          // //                               ),
                          // //                               Text(
                          // //                                 'ลบ',
                          // //                                 style: textStyle(
                          // //                                     context,
                          // //                                     color: colorRed,
                          // //                                     fontSize: 15),
                          // //                               ),
                          // //                             ],
                          // //                           ),
                          // //                           height: 40,
                          // //                           width: 80,
                          // //                         ),
                          // //                       )
                          // //                     : (contoller.dataEditEvent.value
                          // //                                 .events ==
                          // //                             null)
                          // //                         ? InkWell(
                          // //                             onTap: () {
                          // //                               if (contoller
                          // //                                           .listDataIDUserDie[
                          // //                                       index] !=
                          // //                                   'new') {
                          // //                                 contoller
                          // //                                     .listStringNameDeleteDie
                          // //                                     .add(
                          // //                                         'ชื่อ ${contoller.listTextNameDie[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeDie[index].value.text}');
                          // //
                          // //                                 contoller
                          // //                                     .listDataDeleteIDUserDie
                          // //                                     .add(RemoveDeceasedList(
                          // //                                         id: contoller
                          // //                                                 .listDataIDUserDie[
                          // //                                             index]));
                          // //                               }
                          // //                               contoller.listGenderDie
                          // //                                   .removeAt(index);
                          // //                               contoller.listTextAgeDie
                          // //                                   .removeAt(index);
                          // //                               contoller
                          // //                                   .listTextNameDie
                          // //                                   .removeAt(index);
                          // //                               contoller
                          // //                                   .listDataIDUserDie
                          // //                                   .removeAt(index);
                          // //                             },
                          // //                             child: Container(
                          // //                               decoration:
                          // //                                   BoxDecoration(
                          // //                                       borderRadius:
                          // //                                           BorderRadius
                          // //                                               .circular(
                          // //                                                   5),
                          // //                                       border: Border.all(
                          // //                                           color:
                          // //                                               colorRed),
                          // //                                       color: Colors
                          // //                                           .white),
                          // //                               child: Row(
                          // //                                 mainAxisSize:
                          // //                                     MainAxisSize.min,
                          // //                                 mainAxisAlignment:
                          // //                                     MainAxisAlignment
                          // //                                         .center,
                          // //                                 children: [
                          // //                                   const Icon(
                          // //                                     CupertinoIcons
                          // //                                         .multiply,
                          // //                                     size: 17,
                          // //                                     color: Colors.red,
                          // //                                   ),
                          // //                                   const SizedBox(
                          // //                                     width: 10,
                          // //                                   ),
                          // //                                   Text(
                          // //                                     'ลบ',
                          // //                                     style: textStyle(
                          // //                                         context,
                          // //                                         color:
                          // //                                             colorRed,
                          // //                                         fontSize: 15),
                          // //                                   ),
                          // //                                 ],
                          // //                               ),
                          // //                               height: 40,
                          // //                               width: 80,
                          // //                             ),
                          // //                           )
                          // //                         : (index >=
                          // //                                 contoller
                          // //                                     .dataEditEvent
                          // //                                     .value
                          // //                                     .events!
                          // //                                     .deceased!
                          // //                                     .deceaseList!
                          // //                                     .length)
                          // //                             ? InkWell(
                          // //                                 onTap: () {
                          // //                                   if (contoller
                          // //                                               .listDataIDUserDie[
                          // //                                           index] !=
                          // //                                       'new') {
                          // //                                     contoller
                          // //                                         .listStringNameDeleteDie
                          // //                                         .add(
                          // //                                             'ชื่อ ${contoller.listTextNameDie[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeDie[index].value.text}');
                          // //                                     contoller
                          // //                                         .listDataDeleteIDUserDie
                          // //                                         .add(RemoveDeceasedList(
                          // //                                             id: contoller
                          // //                                                     .listDataIDUserDie[
                          // //                                                 index]));
                          // //                                   }
                          // //                                   contoller
                          // //                                       .listGenderDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                   contoller
                          // //                                       .listTextAgeDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                   contoller
                          // //                                       .listTextNameDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                   contoller
                          // //                                       .listDataIDUserDie
                          // //                                       .removeAt(
                          // //                                           index);
                          // //                                 },
                          // //                                 child: Container(
                          // //                                   decoration: BoxDecoration(
                          // //                                       borderRadius:
                          // //                                           BorderRadius
                          // //                                               .circular(
                          // //                                                   5),
                          // //                                       border: Border.all(
                          // //                                           color:
                          // //                                               colorRed),
                          // //                                       color: Colors
                          // //                                           .white),
                          // //                                   child: Row(
                          // //                                     mainAxisSize:
                          // //                                         MainAxisSize
                          // //                                             .min,
                          // //                                     mainAxisAlignment:
                          // //                                         MainAxisAlignment
                          // //                                             .center,
                          // //                                     children: [
                          // //                                       const Icon(
                          // //                                         CupertinoIcons
                          // //                                             .multiply,
                          // //                                         size: 17,
                          // //                                         color: Colors
                          // //                                             .red,
                          // //                                       ),
                          // //                                       const SizedBox(
                          // //                                         width: 10,
                          // //                                       ),
                          // //                                       Text(
                          // //                                         'ลบ',
                          // //                                         style: textStyle(
                          // //                                             context,
                          // //                                             color:
                          // //                                                 colorRed,
                          // //                                             fontSize:
                          // //                                                 13),
                          // //                                       ),
                          // //                                     ],
                          // //                                   ),
                          // //                                   height: 40,
                          // //                                   width: 80,
                          // //                                 ),
                          // //                               )
                          // //                             : const SizedBox()
                          // //               ],
                          // //             ),
                          // //           );
                          // //   },
                          // // ),
                          // // InkWell(
                          // //   onTap: () {
                          // //     contoller.addDataDie();
                          // //   },
                          // //   child: Container(
                          // //     padding: const EdgeInsets.only(
                          // //         left: 20, right: 20, top: 7, bottom: 7),
                          // //     decoration: BoxDecoration(
                          // //         borderRadius: BorderRadius.circular(5),
                          // //         border: Border.all(color: Colors.grey),
                          // //         color: colorWhite),
                          // //     child: Row(
                          // //       mainAxisSize: MainAxisSize.min,
                          // //       children: [
                          // //         Icon(
                          // //           Icons.add,
                          // //           color: colorBlue,
                          // //           size: 20,
                          // //         ),
                          // //         const SizedBox(
                          // //           height: 5,
                          // //         ),
                          // //         Text(
                          // //           'เพิ่มรายละเอียดผู้เสียชีวิต',
                          // //           style: textStyle(context,
                          // //               color: colorBlue, fontSize: 15),
                          // //         )
                          // //       ],
                          // //     ),
                          // //   ),
                          // // ),
                          // // const SizedBox(
                          // //   height: 20,
                          // // ),
                          //
                          // if (MediaQuery.of(context).size.width > 899)
                          //   Container(
                          //     height: 65,
                          //     child: Column(
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'ผู้บาดเจ็บ',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               height: 40,
                          //               width: 80,
                          //               color: colorWhite,
                          //               child: TextFormField(
                          //                 controller: contoller.injured.value,
                          //                 textAlign: TextAlign.center,
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 keyboardType: TextInputType.number,
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.injured.value.text =
                          //                         '0';
                          //                   }
                          //                 },
                          //                 decoration: InputDecoration(
                          //                   fillColor: colorWhite,
                          //                   filled: true,
                          //                   border: OutlineInputBorder(
                          //                     borderSide: BorderSide(
                          //                       color: colorGrey,
                          //                       width: 2,
                          //                     ),
                          //                     borderRadius:
                          //                         BorderRadius.circular(5),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 40,
                          //             ),
                          //             Text(
                          //               'เพศหญิง',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10),
                          //               alignment: Alignment.centerLeft,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //                 border:
                          //                     Border.all(color: Colors.grey),
                          //                 color: colorWhite,
                          //               ),
                          //               width: 80,
                          //               child: TextFormField(
                          //                 // //key: contoller.formKey,
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.womenInjured.value
                          //                         .text = '0';
                          //                   }
                          //                 },
                          //                 controller:
                          //                     contoller.womenInjured.value,
                          //                 textAlign: TextAlign.center,
                          //                 keyboardType: TextInputType.number,
                          //
                          //                 decoration: InputDecoration.collapsed(
                          //                   fillColor: colorWhite,
                          //                   filled: true,
                          //                   // border: OutlineInputBorder(
                          //                   //   borderSide: BorderSide(
                          //                   //     color: colorGrey,
                          //                   //     width: 2,
                          //                   //   ),
                          //                   //   borderRadius:
                          //                   //       BorderRadius.circular(5),
                          //                   // ),
                          //                   hintText: '',
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 40,
                          //             ),
                          //             Text(
                          //               'เพศชาย',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10),
                          //               alignment: Alignment.centerLeft,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //                 border:
                          //                     Border.all(color: Colors.grey),
                          //                 color: colorWhite,
                          //               ),
                          //               width: 80,
                          //               child: TextFormField(
                          //                 // //key: contoller.formKey,
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 controller:
                          //                     contoller.manInjured.value,
                          //                 textAlign: TextAlign.center,
                          //                 keyboardType: TextInputType.number,
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.manInjured.value.text =
                          //                         '0';
                          //                   }
                          //                 },
                          //                 decoration: InputDecoration.collapsed(
                          //                   fillColor: colorWhite,
                          //                   filled: true, hintText: '',
                          //                   // border: OutlineInputBorder(
                          //                   //   borderSide: BorderSide(
                          //                   //     color: colorGrey,
                          //                   //     width: 2,
                          //                   //   ),
                          //                   //   borderRadius:
                          //                   //       BorderRadius.circular(5),
                          //                   // ),
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 40,
                          //             ),
                          //             Text(
                          //               'ไม่สามารถระบุเพศ',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10),
                          //               alignment: Alignment.centerLeft,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //                 border:
                          //                     Border.all(color: Colors.grey),
                          //                 color: colorWhite,
                          //               ),
                          //               width: 80,
                          //               child: TextFormField(
                          //                 //key: contoller.formKey,
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 controller:
                          //                     contoller.unGenderInjured.value,
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.unGenderInjured.value
                          //                         .text = '0';
                          //                   }
                          //                 },
                          //                 decoration: InputDecoration.collapsed(
                          //                   fillColor: colorWhite,
                          //                   filled: true, hintText: '',
                          //                   // border: OutlineInputBorder(
                          //                   //   borderSide: BorderSide(
                          //                   //     color: colorGrey,
                          //                   //     width: 2,
                          //                   //   ),
                          //                   //   borderRadius:
                          //                   //       BorderRadius.circular(5),
                          //                   // ),
                          //                 ),
                          //                 textAlign: TextAlign.center,
                          //                 keyboardType: TextInputType.number,
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // if (MediaQuery.of(context).size.width < 900)
                          //   Container(
                          //     height: 65,
                          //     child: Column(
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'ผู้บาดเจ็บ',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               height: 40,
                          //               width: 80,
                          //               color: colorWhite,
                          //               child: TextFormField(
                          //                 controller: contoller.injured.value,
                          //                 textAlign: TextAlign.center,
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 keyboardType: TextInputType.number,
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.injured.value.text =
                          //                         '0';
                          //                   }
                          //                 },
                          //                 decoration: InputDecoration(
                          //                   fillColor: colorWhite,
                          //                   filled: true,
                          //                   border: OutlineInputBorder(
                          //                     borderSide: BorderSide(
                          //                       color: colorGrey,
                          //                       width: 2,
                          //                     ),
                          //                     borderRadius:
                          //                         BorderRadius.circular(5),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 30,
                          //             ),
                          //             Text(
                          //               'เพศหญิง',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10),
                          //               alignment: Alignment.centerLeft,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //                 border:
                          //                     Border.all(color: Colors.grey),
                          //                 color: colorWhite,
                          //               ),
                          //               width: 80,
                          //               child: TextFormField(
                          //                 // //key: contoller.formKey,
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.womenInjured.value
                          //                         .text = '0';
                          //                   }
                          //                 },
                          //                 controller:
                          //                     contoller.womenInjured.value,
                          //                 textAlign: TextAlign.center,
                          //                 keyboardType: TextInputType.number,
                          //
                          //                 decoration: InputDecoration.collapsed(
                          //                   fillColor: colorWhite,
                          //                   filled: true,
                          //                   // border: OutlineInputBorder(
                          //                   //   borderSide: BorderSide(
                          //                   //     color: colorGrey,
                          //                   //     width: 2,
                          //                   //   ),
                          //                   //   borderRadius:
                          //                   //       BorderRadius.circular(5),
                          //                   // ),
                          //                   hintText: '',
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // if (MediaQuery.of(context).size.width < 900)
                          //   const SizedBox(
                          //     height: 20,
                          //   ),
                          // if (MediaQuery.of(context).size.width < 900)
                          //   Container(
                          //     height: 65,
                          //     child: Column(
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'เพศชาย',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 20,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10),
                          //               alignment: Alignment.centerLeft,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //                 border:
                          //                     Border.all(color: Colors.grey),
                          //                 color: colorWhite,
                          //               ),
                          //               width: 80,
                          //               child: TextFormField(
                          //                 // //key: contoller.formKey,
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 controller:
                          //                     contoller.manInjured.value,
                          //                 textAlign: TextAlign.center,
                          //                 keyboardType: TextInputType.number,
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.manInjured.value.text =
                          //                         '0';
                          //                   }
                          //                 },
                          //                 decoration: InputDecoration.collapsed(
                          //                   fillColor: colorWhite,
                          //                   filled: true, hintText: '',
                          //                   // border: OutlineInputBorder(
                          //                   //   borderSide: BorderSide(
                          //                   //     color: colorGrey,
                          //                   //     width: 2,
                          //                   //   ),
                          //                   //   borderRadius:
                          //                   //       BorderRadius.circular(5),
                          //                   // ),
                          //                 ),
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 30,
                          //             ),
                          //             Text(
                          //               'ไม่สามารถระบุเพศ',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.only(
                          //                   left: 10, right: 10),
                          //               alignment: Alignment.centerLeft,
                          //               height: 40,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //                 border:
                          //                     Border.all(color: Colors.grey),
                          //                 color: colorWhite,
                          //               ),
                          //               width: 80,
                          //               child: TextFormField(
                          //                 //key: contoller.formKey,
                          //                 validator: (value) {
                          //                   if (value!.isEmpty) {
                          //                     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                   }
                          //                   return null;
                          //                 },
                          //                 inputFormatters: <TextInputFormatter>[
                          //                   FilteringTextInputFormatter.allow(
                          //                       RegExp(r'[0-9]')),
                          //                   FilteringTextInputFormatter
                          //                       .digitsOnly
                          //                 ],
                          //                 controller:
                          //                     contoller.unGenderInjured.value,
                          //                 onChanged: (value) {
                          //                   if (value.isEmpty) {
                          //                     contoller.unGenderInjured.value
                          //                         .text = '0';
                          //                   }
                          //                 },
                          //                 decoration: InputDecoration.collapsed(
                          //                   fillColor: colorWhite,
                          //                   filled: true, hintText: '',
                          //                   // border: OutlineInputBorder(
                          //                   //   borderSide: BorderSide(
                          //                   //     color: colorGrey,
                          //                   //     width: 2,
                          //                   //   ),
                          //                   //   borderRadius:
                          //                   //       BorderRadius.circular(5),
                          //                   // ),
                          //                 ),
                          //                 textAlign: TextAlign.center,
                          //                 keyboardType: TextInputType.number,
                          //               ),
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               'คน',
                          //               style: textStyle(context,
                          //                   color: colorBlack, fontSize: 15),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //
                          // ListView.builder(
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   padding: const EdgeInsets.only(bottom: 20),
                          //   shrinkWrap: true,
                          //   itemCount: contoller.listTextNameInjured.length,
                          //   itemBuilder: (context, index) {
                          //     return (MediaQuery.of(context).size.width < 900)
                          //         ? Container(
                          //             margin: const EdgeInsets.only(
                          //                 bottom: 5, top: 5),
                          //             height: 100,
                          //             child: Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     Container(
                          //                       decoration: BoxDecoration(
                          //                           borderRadius:
                          //                               BorderRadius.circular(
                          //                                   100),
                          //                           color: const Color(
                          //                               0xfffd9e1ec)),
                          //                       child: Text('${index + 1}'),
                          //                       alignment: Alignment.center,
                          //                       width: 30,
                          //                       height: 30,
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 20,
                          //                     ),
                          //                     Text(
                          //                       'ชื่อ-นามสกุล',
                          //                       style: textStyle(context,
                          //                           color: colorBlack,
                          //                           fontSize: 15),
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 10,
                          //                     ),
                          //                     Container(
                          //                       padding: const EdgeInsets.only(
                          //                           left: 10, right: 10),
                          //                       alignment: Alignment.centerLeft,
                          //                       height: 40,
                          //                       decoration: BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.circular(5),
                          //                         border: Border.all(
                          //                             color: Colors.grey),
                          //                         color: colorWhite,
                          //                       ),
                          //                       width: 250,
                          //                       child: TextFormField(
                          //                         enabled: (isAdmin)
                          //                             ? true
                          //                             : (contoller
                          //                                         .dataEditEvent
                          //                                         .value
                          //                                         .events ==
                          //                                     null)
                          //                                 ? true
                          //                                 : (index >=
                          //                                         contoller
                          //                                             .dataEditEvent
                          //                                             .value
                          //                                             .events!
                          //                                             .injured!
                          //                                             .injureList!
                          //                                             .length)
                          //                                     ? true
                          //                                     : false,
                          //                         //key: contoller.formKey,
                          //                         validator: (value) {
                          //                           if (value!.isEmpty) {
                          //                             return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                           }
                          //                           return null;
                          //                         },
                          //
                          //                         controller: contoller
                          //                                 .listTextNameInjured[
                          //                             index],
                          //                         textAlign: TextAlign.left,
                          //                         keyboardType:
                          //                             TextInputType.number,
                          //                         decoration:
                          //                             InputDecoration.collapsed(
                          //                           fillColor: colorWhite,
                          //                           filled: true, hintText: '',
                          //                           // border: OutlineInputBorder(
                          //                           //   borderSide: BorderSide(
                          //                           //     color: colorGrey,
                          //                           //     width: 2,
                          //                           //   ),
                          //                           //   borderRadius:
                          //                           //       BorderRadius.circular(5),
                          //                           // ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 const SizedBox(
                          //                   height: 20,
                          //                 ),
                          //                 Row(
                          //                   children: [
                          //                     Text(
                          //                       'เพศ',
                          //                       style: textStyle(context,
                          //                           color: colorBlack,
                          //                           fontSize: 15),
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 10,
                          //                     ),
                          //                     Container(
                          //                       padding: const EdgeInsets.only(
                          //                           left: 20, right: 5),
                          //                       width: 150,
                          //                       height: 40,
                          //                       decoration: BoxDecoration(
                          //                           color: colorWhite,
                          //                           border: Border.all(
                          //                             color: Colors.black26,
                          //                             width: 1,
                          //                           ),
                          //                           borderRadius:
                          //                               BorderRadius.circular(
                          //                                   5)),
                          //                       alignment: Alignment.center,
                          //                       child: SizedBox(
                          //                         width: 100,
                          //                         child: Obx(
                          //                           () =>
                          //                               DropdownButtonHideUnderline(
                          //                             child: DropdownButton2<
                          //                                 String>(
                          //                               dropdownStyleData:
                          //                                   DropdownStyleData(
                          //                                 maxHeight: 300,
                          //                                 decoration:
                          //                                     BoxDecoration(
                          //                                   borderRadius:
                          //                                       BorderRadius
                          //                                           .circular(
                          //                                               5),
                          //                                 ),
                          //                                 scrollbarTheme:
                          //                                     ScrollbarThemeData(
                          //                                   radius: const Radius
                          //                                       .circular(5),
                          //                                   thickness:
                          //                                       MaterialStateProperty
                          //                                           .all<double>(
                          //                                               6),
                          //                                   thumbVisibility:
                          //                                       MaterialStateProperty
                          //                                           .all<bool>(
                          //                                               true),
                          //                                 ),
                          //                               ),
                          //                               autofocus: true,
                          //                               isExpanded: true,
                          //                               openWithLongPress:
                          //                                   (isAdmin)
                          //                                       ? false
                          //                                       : (contoller
                          //                                                   .dataEditEvent
                          //                                                   .value
                          //                                                   .events ==
                          //                                               null)
                          //                                           ? false
                          //                                           : (index >=
                          //                                                   contoller.dataEditEvent.value.events!.injured!.injureList!.length)
                          //                                               ? false
                          //                                               : true,
                          //                               value: contoller
                          //                                   .listGenderInjured[
                          //                                       index]
                          //                                   .value,
                          //                               items: contoller
                          //                                   .listGender
                          //                                   .map<
                          //                                       DropdownMenuItem<
                          //                                           String>>((String?
                          //                                       value) {
                          //                                 return DropdownMenuItem<
                          //                                     String>(
                          //                                   value: value!,
                          //                                   child: Text(
                          //                                     value,
                          //                                     style: TextStyle(
                          //                                         fontSize:
                          //                                             13.0,
                          //                                         color:
                          //                                             colorBlack,
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .w400),
                          //                                   ),
                          //                                 );
                          //                               }).toList(),
                          //                               iconStyleData:
                          //                                   const IconStyleData(
                          //                                       icon: Icon(
                          //                                 Icons
                          //                                     .keyboard_arrow_down,
                          //                                 size: 24,
                          //                               )),
                          //                               onChanged:
                          //                                   (valueSelect) {
                          //                                 contoller
                          //                                     .UpdateListGenderInjured(
                          //                                         valueSelect!,
                          //                                         index);
                          //                               },
                          //                               // enableFeedback:  (isAdmin)?false:(contoller.dataEditEvent.value.events==null)?false:(index>=contoller.dataEditEvent.value.events!.injured!.injureList!.length)?true:false,
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 20,
                          //                     ),
                          //                     Text(
                          //                       'อายุ',
                          //                       style: textStyle(context,
                          //                           color: colorBlack,
                          //                           fontSize: 15),
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 10,
                          //                     ),
                          //                     Container(
                          //                       padding: const EdgeInsets.only(
                          //                           left: 10, right: 10),
                          //                       alignment: Alignment.centerLeft,
                          //                       height: 40,
                          //                       decoration: BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.circular(5),
                          //                         border: Border.all(
                          //                             color: Colors.grey),
                          //                         color: colorWhite,
                          //                       ),
                          //                       width: 100,
                          //                       child: TextFormField(
                          //                         enabled: (isAdmin)
                          //                             ? true
                          //                             : (contoller
                          //                                         .dataEditEvent
                          //                                         .value
                          //                                         .events ==
                          //                                     null)
                          //                                 ? true
                          //                                 : (index >=
                          //                                         contoller
                          //                                             .dataEditEvent
                          //                                             .value
                          //                                             .events!
                          //                                             .injured!
                          //                                             .injureList!
                          //                                             .length)
                          //                                     ? true
                          //                                     : false,
                          //                         //key: contoller.formKey,
                          //                         validator: (value) {
                          //                           if (value!.isEmpty) {
                          //                             return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                           }
                          //                           return null;
                          //                         },
                          //                         inputFormatters: <TextInputFormatter>[
                          //                           FilteringTextInputFormatter
                          //                               .allow(
                          //                                   RegExp(r'[0-9]')),
                          //                           FilteringTextInputFormatter
                          //                               .digitsOnly
                          //                         ],
                          //                         onChanged: (value) {
                          //                           if (value.isEmpty) {
                          //                             contoller.womenDie.value
                          //                                 .text = '0';
                          //                           }
                          //                         },
                          //                         controller: contoller
                          //                                 .listTextAgeInjured[
                          //                             index],
                          //                         textAlign: TextAlign.center,
                          //                         keyboardType:
                          //                             TextInputType.number,
                          //                         decoration:
                          //                             InputDecoration.collapsed(
                          //                           fillColor: colorWhite,
                          //                           filled: true, hintText: '',
                          //                           // border: OutlineInputBorder(
                          //                           //   borderSide: BorderSide(
                          //                           //     color: colorGrey,
                          //                           //     width: 2,
                          //                           //   ),
                          //                           //   borderRadius:
                          //                           //       BorderRadius.circular(5),
                          //                           // ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 20,
                          //                     ),
                          //                     (isAdmin)
                          //                         ? InkWell(
                          //                             onTap: () {
                          //                               if (contoller
                          //                                           .listDataIDUserInjured[
                          //                                       index] !=
                          //                                   'new') {
                          //                                 contoller
                          //                                     .listStringNameDeleteInjured
                          //                                     .add(
                          //                                         'ชื่อ ${contoller.listTextNameInjured[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeInjured[index].value.text}');
                          //                                 contoller
                          //                                     .listDataDeleteIDUserInjured
                          //                                     .add(RemoveDeceasedList(
                          //                                         id: contoller
                          //                                                 .listDataIDUserInjured[
                          //                                             index]));
                          //                               }
                          //                               contoller
                          //                                   .listGenderInjured
                          //                                   .removeAt(index);
                          //                               contoller
                          //                                   .listTextAgeInjured
                          //                                   .removeAt(index);
                          //                               contoller
                          //                                   .listTextNameInjured
                          //                                   .removeAt(index);
                          //                               contoller
                          //                                   .listDataIDUserInjured
                          //                                   .removeAt(index);
                          //                             },
                          //                             child: Container(
                          //                               decoration:
                          //                                   BoxDecoration(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   5),
                          //                                       border: Border.all(
                          //                                           color:
                          //                                               colorRed),
                          //                                       color: Colors
                          //                                           .white),
                          //                               child: Row(
                          //                                 mainAxisSize:
                          //                                     MainAxisSize.min,
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .center,
                          //                                 children: [
                          //                                   const Icon(
                          //                                     CupertinoIcons
                          //                                         .multiply,
                          //                                     size: 17,
                          //                                     color: Colors.red,
                          //                                   ),
                          //                                   const SizedBox(
                          //                                     width: 10,
                          //                                   ),
                          //                                   Text(
                          //                                     'ลบ',
                          //                                     style: textStyle(
                          //                                         context,
                          //                                         color:
                          //                                             colorRed,
                          //                                         fontSize: 15),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                               height: 40,
                          //                               width: 80,
                          //                             ),
                          //                           )
                          //                         : (contoller.dataEditEvent
                          //                                     .value.events ==
                          //                                 null)
                          //                             ? InkWell(
                          //                                 onTap: () {
                          //                                   if (contoller
                          //                                               .listDataIDUserInjured[
                          //                                           index] !=
                          //                                       'new') {
                          //                                     contoller
                          //                                         .listStringNameDeleteInjured
                          //                                         .add(
                          //                                             'ชื่อ ${contoller.listTextNameInjured[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeInjured[index].value.text}');
                          //                                     contoller
                          //                                         .listDataDeleteIDUserInjured
                          //                                         .add(RemoveDeceasedList(
                          //                                             id: contoller
                          //                                                     .listDataIDUserInjured[
                          //                                                 index]));
                          //                                   }
                          //                                   contoller
                          //                                       .listGenderInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                   contoller
                          //                                       .listTextAgeInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                   contoller
                          //                                       .listTextNameInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                   contoller
                          //                                       .listDataIDUserInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                 },
                          //                                 child: Container(
                          //                                   decoration: BoxDecoration(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   5),
                          //                                       border: Border.all(
                          //                                           color:
                          //                                               colorRed),
                          //                                       color: Colors
                          //                                           .white),
                          //                                   child: Row(
                          //                                     mainAxisSize:
                          //                                         MainAxisSize
                          //                                             .min,
                          //                                     mainAxisAlignment:
                          //                                         MainAxisAlignment
                          //                                             .center,
                          //                                     children: [
                          //                                       const Icon(
                          //                                         CupertinoIcons
                          //                                             .multiply,
                          //                                         size: 17,
                          //                                         color: Colors
                          //                                             .red,
                          //                                       ),
                          //                                       const SizedBox(
                          //                                         width: 10,
                          //                                       ),
                          //                                       Text(
                          //                                         'ลบ',
                          //                                         style: textStyle(
                          //                                             context,
                          //                                             color:
                          //                                                 colorRed,
                          //                                             fontSize:
                          //                                                 13),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                   height: 40,
                          //                                   width: 80,
                          //                                 ),
                          //                               )
                          //                             : (index >=
                          //                                     contoller
                          //                                         .dataEditEvent
                          //                                         .value
                          //                                         .events!
                          //                                         .injured!
                          //                                         .injureList!
                          //                                         .length)
                          //                                 ? InkWell(
                          //                                     onTap: () {
                          //                                       if (contoller
                          //                                                   .listDataIDUserInjured[
                          //                                               index] !=
                          //                                           'new') {
                          //                                         contoller
                          //                                             .listStringNameDeleteInjured
                          //                                             .add(
                          //                                                 'ชื่อ ${contoller.listTextNameInjured[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeInjured[index].value.text}');
                          //                                         contoller
                          //                                             .listDataDeleteIDUserInjured
                          //                                             .add(RemoveDeceasedList(
                          //                                                 id: contoller
                          //                                                     .listDataIDUserInjured[index]));
                          //                                       }
                          //                                       contoller
                          //                                           .listGenderInjured
                          //                                           .removeAt(
                          //                                               index);
                          //                                       contoller
                          //                                           .listTextAgeInjured
                          //                                           .removeAt(
                          //                                               index);
                          //                                       contoller
                          //                                           .listTextNameInjured
                          //                                           .removeAt(
                          //                                               index);
                          //                                       contoller
                          //                                           .listDataIDUserInjured
                          //                                           .removeAt(
                          //                                               index);
                          //                                     },
                          //                                     child: Container(
                          //                                       decoration: BoxDecoration(
                          //                                           borderRadius:
                          //                                               BorderRadius.circular(
                          //                                                   5),
                          //                                           border: Border.all(
                          //                                               color:
                          //                                                   colorRed),
                          //                                           color: Colors
                          //                                               .white),
                          //                                       child: Row(
                          //                                         mainAxisSize:
                          //                                             MainAxisSize
                          //                                                 .min,
                          //                                         mainAxisAlignment:
                          //                                             MainAxisAlignment
                          //                                                 .center,
                          //                                         children: [
                          //                                           const Icon(
                          //                                             CupertinoIcons
                          //                                                 .multiply,
                          //                                             size: 17,
                          //                                             color: Colors
                          //                                                 .red,
                          //                                           ),
                          //                                           const SizedBox(
                          //                                             width: 10,
                          //                                           ),
                          //                                           Text(
                          //                                             'ลบ',
                          //                                             style: textStyle(
                          //                                                 context,
                          //                                                 color:
                          //                                                     colorRed,
                          //                                                 fontSize:
                          //                                                     13),
                          //                                           ),
                          //                                         ],
                          //                                       ),
                          //                                       height: 40,
                          //                                       width: 80,
                          //                                     ),
                          //                                   )
                          //                                 : const SizedBox()
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           )
                          //         : Container(
                          //             margin: const EdgeInsets.only(
                          //                 bottom: 5, top: 5),
                          //             height: 40,
                          //             child: Row(
                          //               children: [
                          //                 Container(
                          //                   decoration: BoxDecoration(
                          //                       borderRadius:
                          //                           BorderRadius.circular(100),
                          //                       color:
                          //                           const Color(0xfffd9e1ec)),
                          //                   child: Text('${index + 1}'),
                          //                   alignment: Alignment.center,
                          //                   width: 30,
                          //                   height: 30,
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 20,
                          //                 ),
                          //                 Text(
                          //                   'ชื่อ-นามสกุล',
                          //                   style: textStyle(context,
                          //                       color: colorBlack,
                          //                       fontSize: 15),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 10,
                          //                 ),
                          //                 Container(
                          //                   padding: const EdgeInsets.only(
                          //                       left: 10, right: 10),
                          //                   alignment: Alignment.centerLeft,
                          //                   height: 40,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(5),
                          //                     border: Border.all(
                          //                         color: Colors.grey),
                          //                     color: colorWhite,
                          //                   ),
                          //                   width: 250,
                          //                   child: TextFormField(
                          //                     enabled: (isAdmin)
                          //                         ? true
                          //                         : (contoller.dataEditEvent
                          //                                     .value.events ==
                          //                                 null)
                          //                             ? true
                          //                             : (index >=
                          //                                     contoller
                          //                                         .dataEditEvent
                          //                                         .value
                          //                                         .events!
                          //                                         .injured!
                          //                                         .injureList!
                          //                                         .length)
                          //                                 ? true
                          //                                 : false,
                          //                     //key: contoller.formKey,
                          //                     validator: (value) {
                          //                       if (value!.isEmpty) {
                          //                         return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                       }
                          //                       return null;
                          //                     },
                          //
                          //                     controller: contoller
                          //                         .listTextNameInjured[index],
                          //                     textAlign: TextAlign.left,
                          //                     keyboardType:
                          //                         TextInputType.number,
                          //                     decoration:
                          //                         InputDecoration.collapsed(
                          //                       fillColor: colorWhite,
                          //                       filled: true, hintText: '',
                          //                       // border: OutlineInputBorder(
                          //                       //   borderSide: BorderSide(
                          //                       //     color: colorGrey,
                          //                       //     width: 2,
                          //                       //   ),
                          //                       //   borderRadius:
                          //                       //       BorderRadius.circular(5),
                          //                       // ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 20,
                          //                 ),
                          //                 Text(
                          //                   'เพศ',
                          //                   style: textStyle(context,
                          //                       color: colorBlack,
                          //                       fontSize: 15),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 10,
                          //                 ),
                          //                 Container(
                          //                   padding: const EdgeInsets.only(
                          //                       left: 20, right: 5),
                          //                   width: 150,
                          //                   height: 40,
                          //                   decoration: BoxDecoration(
                          //                       color: colorWhite,
                          //                       border: Border.all(
                          //                         color: Colors.black26,
                          //                         width: 1,
                          //                       ),
                          //                       borderRadius:
                          //                           BorderRadius.circular(5)),
                          //                   alignment: Alignment.center,
                          //                   child: SizedBox(
                          //                     width: 100,
                          //                     child: Obx(
                          //                       () =>
                          //                           DropdownButtonHideUnderline(
                          //                         child:
                          //                             DropdownButton2<String>(
                          //                           dropdownStyleData:
                          //                               DropdownStyleData(
                          //                             maxHeight: 300,
                          //                             decoration: BoxDecoration(
                          //                               borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(5),
                          //                             ),
                          //                             scrollbarTheme:
                          //                                 ScrollbarThemeData(
                          //                               radius: const Radius
                          //                                   .circular(5),
                          //                               thickness:
                          //                                   MaterialStateProperty
                          //                                       .all<double>(6),
                          //                               thumbVisibility:
                          //                                   MaterialStateProperty
                          //                                       .all<bool>(
                          //                                           true),
                          //                             ),
                          //                           ),
                          //                           autofocus: true,
                          //                           isExpanded: true,
                          //                           openWithLongPress: (isAdmin)
                          //                               ? false
                          //                               : (contoller
                          //                                           .dataEditEvent
                          //                                           .value
                          //                                           .events ==
                          //                                       null)
                          //                                   ? false
                          //                                   : (index >=
                          //                                           contoller
                          //                                               .dataEditEvent
                          //                                               .value
                          //                                               .events!
                          //                                               .injured!
                          //                                               .injureList!
                          //                                               .length)
                          //                                       ? false
                          //                                       : true,
                          //                           value: contoller
                          //                               .listGenderInjured[
                          //                                   index]
                          //                               .value,
                          //                           items: contoller.listGender
                          //                               .map<
                          //                                       DropdownMenuItem<
                          //                                           String>>(
                          //                                   (String? value) {
                          //                             return DropdownMenuItem<
                          //                                 String>(
                          //                               value: value!,
                          //                               child: Text(
                          //                                 value,
                          //                                 style: TextStyle(
                          //                                     fontSize: 15.0,
                          //                                     color: colorBlack,
                          //                                     fontWeight:
                          //                                         FontWeight
                          //                                             .w400),
                          //                               ),
                          //                             );
                          //                           }).toList(),
                          //                           iconStyleData:
                          //                               const IconStyleData(
                          //                                   icon: Icon(
                          //                             Icons.keyboard_arrow_down,
                          //                             size: 24,
                          //                           )),
                          //                           onChanged: (valueSelect) {
                          //                             contoller
                          //                                 .UpdateListGenderInjured(
                          //                                     valueSelect!,
                          //                                     index);
                          //                           },
                          //                           // enableFeedback:  (isAdmin)?false:(contoller.dataEditEvent.value.events==null)?false:(index>=contoller.dataEditEvent.value.events!.injured!.injureList!.length)?true:false,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 20,
                          //                 ),
                          //                 Text(
                          //                   'อายุ',
                          //                   style: textStyle(context,
                          //                       color: colorBlack,
                          //                       fontSize: 15),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 10,
                          //                 ),
                          //                 Container(
                          //                   padding: const EdgeInsets.only(
                          //                       left: 10, right: 10),
                          //                   alignment: Alignment.centerLeft,
                          //                   height: 40,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(5),
                          //                     border: Border.all(
                          //                         color: Colors.grey),
                          //                     color: colorWhite,
                          //                   ),
                          //                   width: 100,
                          //                   child: TextFormField(
                          //                     enabled: (isAdmin)
                          //                         ? true
                          //                         : (contoller.dataEditEvent
                          //                                     .value.events ==
                          //                                 null)
                          //                             ? true
                          //                             : (index >=
                          //                                     contoller
                          //                                         .dataEditEvent
                          //                                         .value
                          //                                         .events!
                          //                                         .injured!
                          //                                         .injureList!
                          //                                         .length)
                          //                                 ? true
                          //                                 : false,
                          //                     //key: contoller.formKey,
                          //                     validator: (value) {
                          //                       if (value!.isEmpty) {
                          //                         return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                          //                       }
                          //                       return null;
                          //                     },
                          //                     inputFormatters: <TextInputFormatter>[
                          //                       FilteringTextInputFormatter
                          //                           .allow(RegExp(r'[0-9]')),
                          //                       FilteringTextInputFormatter
                          //                           .digitsOnly
                          //                     ],
                          //                     onChanged: (value) {
                          //                       if (value.isEmpty) {
                          //                         contoller.womenDie.value
                          //                             .text = '0';
                          //                       }
                          //                     },
                          //                     controller: contoller
                          //                         .listTextAgeInjured[index],
                          //                     textAlign: TextAlign.center,
                          //                     keyboardType:
                          //                         TextInputType.number,
                          //                     decoration:
                          //                         InputDecoration.collapsed(
                          //                       fillColor: colorWhite,
                          //                       filled: true, hintText: '',
                          //                       // border: OutlineInputBorder(
                          //                       //   borderSide: BorderSide(
                          //                       //     color: colorGrey,
                          //                       //     width: 2,
                          //                       //   ),
                          //                       //   borderRadius:
                          //                       //       BorderRadius.circular(5),
                          //                       // ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 20,
                          //                 ),
                          //                 (isAdmin)
                          //                     ? InkWell(
                          //                         onTap: () {
                          //                           if (contoller
                          //                                       .listDataIDUserInjured[
                          //                                   index] !=
                          //                               'new') {
                          //                             contoller
                          //                                 .listStringNameDeleteInjured
                          //                                 .add(
                          //                                     'ชื่อ ${contoller.listTextNameInjured[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeInjured[index].value.text}');
                          //                             contoller
                          //                                 .listDataDeleteIDUserInjured
                          //                                 .add(RemoveDeceasedList(
                          //                                     id: contoller
                          //                                             .listDataIDUserInjured[
                          //                                         index]));
                          //                           }
                          //                           contoller.listGenderInjured
                          //                               .removeAt(index);
                          //                           contoller.listTextAgeInjured
                          //                               .removeAt(index);
                          //                           contoller
                          //                               .listTextNameInjured
                          //                               .removeAt(index);
                          //                           contoller
                          //                               .listDataIDUserInjured
                          //                               .removeAt(index);
                          //                         },
                          //                         child: Container(
                          //                           decoration: BoxDecoration(
                          //                               borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(5),
                          //                               border: Border.all(
                          //                                   color: colorRed),
                          //                               color: Colors.white),
                          //                           child: Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.min,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .center,
                          //                             children: [
                          //                               const Icon(
                          //                                 CupertinoIcons
                          //                                     .multiply,
                          //                                 size: 17,
                          //                                 color: Colors.red,
                          //                               ),
                          //                               const SizedBox(
                          //                                 width: 10,
                          //                               ),
                          //                               Text(
                          //                                 'ลบ',
                          //                                 style: textStyle(
                          //                                     context,
                          //                                     color: colorRed,
                          //                                     fontSize: 15),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           height: 40,
                          //                           width: 80,
                          //                         ),
                          //                       )
                          //                     : (contoller.dataEditEvent.value
                          //                                 .events ==
                          //                             null)
                          //                         ? InkWell(
                          //                             onTap: () {
                          //                               if (contoller
                          //                                           .listDataIDUserInjured[
                          //                                       index] !=
                          //                                   'new') {
                          //                                 contoller
                          //                                     .listStringNameDeleteInjured
                          //                                     .add(
                          //                                         'ชื่อ ${contoller.listTextNameInjured[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeInjured[index].value.text}');
                          //                                 contoller
                          //                                     .listDataDeleteIDUserInjured
                          //                                     .add(RemoveDeceasedList(
                          //                                         id: contoller
                          //                                                 .listDataIDUserInjured[
                          //                                             index]));
                          //                               }
                          //                               contoller
                          //                                   .listGenderInjured
                          //                                   .removeAt(index);
                          //                               contoller
                          //                                   .listTextAgeInjured
                          //                                   .removeAt(index);
                          //                               contoller
                          //                                   .listTextNameInjured
                          //                                   .removeAt(index);
                          //                               contoller
                          //                                   .listDataIDUserInjured
                          //                                   .removeAt(index);
                          //                             },
                          //                             child: Container(
                          //                               decoration:
                          //                                   BoxDecoration(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   5),
                          //                                       border: Border.all(
                          //                                           color:
                          //                                               colorRed),
                          //                                       color: Colors
                          //                                           .white),
                          //                               child: Row(
                          //                                 mainAxisSize:
                          //                                     MainAxisSize.min,
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .center,
                          //                                 children: [
                          //                                   const Icon(
                          //                                     CupertinoIcons
                          //                                         .multiply,
                          //                                     size: 17,
                          //                                     color: Colors.red,
                          //                                   ),
                          //                                   const SizedBox(
                          //                                     width: 10,
                          //                                   ),
                          //                                   Text(
                          //                                     'ลบ',
                          //                                     style: textStyle(
                          //                                         context,
                          //                                         color:
                          //                                             colorRed,
                          //                                         fontSize: 15),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                               height: 40,
                          //                               width: 80,
                          //                             ),
                          //                           )
                          //                         : (index >=
                          //                                 contoller
                          //                                     .dataEditEvent
                          //                                     .value
                          //                                     .events!
                          //                                     .injured!
                          //                                     .injureList!
                          //                                     .length)
                          //                             ? InkWell(
                          //                                 onTap: () {
                          //                                   if (contoller
                          //                                               .listDataIDUserInjured[
                          //                                           index] !=
                          //                                       'new') {
                          //                                     contoller
                          //                                         .listStringNameDeleteInjured
                          //                                         .add(
                          //                                             'ชื่อ ${contoller.listTextNameInjured[index].value.text} เพศ ${contoller.listGenderInjured[index]} อายุ ${contoller.listTextAgeInjured[index].value.text}');
                          //                                     contoller
                          //                                         .listDataDeleteIDUserInjured
                          //                                         .add(RemoveDeceasedList(
                          //                                             id: contoller
                          //                                                     .listDataIDUserInjured[
                          //                                                 index]));
                          //                                   }
                          //                                   contoller
                          //                                       .listGenderInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                   contoller
                          //                                       .listTextAgeInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                   contoller
                          //                                       .listTextNameInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                   contoller
                          //                                       .listDataIDUserInjured
                          //                                       .removeAt(
                          //                                           index);
                          //                                 },
                          //                                 child: Container(
                          //                                   decoration: BoxDecoration(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   5),
                          //                                       border: Border.all(
                          //                                           color:
                          //                                               colorRed),
                          //                                       color: Colors
                          //                                           .white),
                          //                                   child: Row(
                          //                                     mainAxisSize:
                          //                                         MainAxisSize
                          //                                             .min,
                          //                                     mainAxisAlignment:
                          //                                         MainAxisAlignment
                          //                                             .center,
                          //                                     children: [
                          //                                       const Icon(
                          //                                         CupertinoIcons
                          //                                             .multiply,
                          //                                         size: 17,
                          //                                         color: Colors
                          //                                             .red,
                          //                                       ),
                          //                                       const SizedBox(
                          //                                         width: 10,
                          //                                       ),
                          //                                       Text(
                          //                                         'ลบ',
                          //                                         style: textStyle(
                          //                                             context,
                          //                                             color:
                          //                                                 colorRed,
                          //                                             fontSize:
                          //                                                 13),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                   height: 40,
                          //                                   width: 80,
                          //                                 ),
                          //                               )
                          //                             : const SizedBox()
                          //               ],
                          //             ),
                          //           );
                          //   },
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     contoller.addDataInjured();
                          //   },
                          //   child: Container(
                          //     padding: const EdgeInsets.only(
                          //         left: 20, right: 20, top: 7, bottom: 7),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(5),
                          //         border: Border.all(color: Colors.grey),
                          //         color: colorWhite),
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         Icon(
                          //           Icons.add,
                          //           color: colorBlue,
                          //           size: 20,
                          //         ),
                          //         const SizedBox(
                          //           height: 5,
                          //         ),
                          //         Text(
                          //           'เพิ่มรายละเอียดผู้ได้รับบาดเจ็บ',
                          //           style: textStyle(context,
                          //               color: colorBlue, fontSize: 15),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          if (!isAdmin)
                            if (contoller.dataEditEvent.value.events != null)
                              const SizedBox(
                                height: 20,
                              ),
                          if (!isAdmin)
                            if (contoller.dataEditEvent.value.events != null)
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: contoller.dataEditEvent.value.events!
                                    .freeFormDetailList!.length,
                                itemBuilder: (context, index) {
                                  return (contoller
                                              .dataEditEvent
                                              .value
                                              .events!
                                              .freeFormDetailList![index]
                                              .types ==
                                          0)
                                      ? Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                contoller
                                                    .dataEditEvent
                                                    .value
                                                    .events!
                                                    .freeFormDetailList![index]
                                                    .section!,
                                                style: textStyle(context,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 5),
                                                      width: double.infinity,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                          color: colorWhite,
                                                          border: Border.all(
                                                            color:
                                                                Colors.black26,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Obx(
                                                            () =>
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  DropdownButton2<
                                                                      String>(
                                                                dropdownStyleData:
                                                                    DropdownStyleData(
                                                                  maxHeight:
                                                                      300,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  scrollbarTheme:
                                                                      ScrollbarThemeData(
                                                                    radius: const Radius
                                                                        .circular(
                                                                        5),
                                                                    thickness:
                                                                        MaterialStateProperty.all<
                                                                            double>(6),
                                                                    thumbVisibility:
                                                                        MaterialStateProperty.all<bool>(
                                                                            true),
                                                                  ),
                                                                ),
                                                                autofocus: true,
                                                                isExpanded:
                                                                    true,
                                                                value: contoller
                                                                    .listAnswer[
                                                                        index]
                                                                    .dropdown!
                                                                    .value,
                                                                hint: Text(
                                                                  'ตัวเลือก',
                                                                  style: textStyle(
                                                                      context,
                                                                      fontSize:
                                                                          25,
                                                                      color:
                                                                          colorGrey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                items: contoller
                                                                    .listAnswer[
                                                                        index]
                                                                    .dropdown!
                                                                    .listoption!
                                                                    .map<
                                                                        DropdownMenuItem<
                                                                            String>>((String?
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value!,
                                                                    child: Text(
                                                                      value,
                                                                      style: textStyle(
                                                                          context,
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              colorBlack,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                                iconStyleData:
                                                                    const IconStyleData(
                                                                        icon:
                                                                            Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  size: 24,
                                                                )),
                                                                onChanged:
                                                                    (valueSelect) {
                                                                  contoller
                                                                      .listAnswer[
                                                                          index]
                                                                      .dropdown!
                                                                      .value = valueSelect!;
                                                                  contoller
                                                                      .listAnswer[
                                                                          index]
                                                                      .dropdown!
                                                                      .valueID = contoller
                                                                          .listAnswer[
                                                                              index]
                                                                          .dropdown!
                                                                          .listoptionID![
                                                                      contoller
                                                                          .listAnswer[
                                                                              index]
                                                                          .dropdown!
                                                                          .listoption!
                                                                          .indexOf(
                                                                              valueSelect)];
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    flex: 5,
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.shade200,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        )
                                      : (contoller
                                                  .dataEditEvent
                                                  .value
                                                  .events!
                                                  .freeFormDetailList![index]
                                                  .types ==
                                              1)
                                          ? Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    contoller
                                                        .dataEditEvent
                                                        .value
                                                        .events!
                                                        .freeFormDetailList![
                                                            index]
                                                        .section!,
                                                    style: textStyle(context,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Column(
                                                    children: listCheckBox(
                                                        context,
                                                        index,
                                                        contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .freeFormDetailList![
                                                                index]
                                                            .freeFormSubDetailList!
                                                            .length),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Divider(
                                                    height: 1,
                                                    color: Colors.grey.shade200,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : (contoller
                                                      .dataEditEvent
                                                      .value
                                                      .events!
                                                      .freeFormDetailList![
                                                          index]
                                                      .types ==
                                                  2)
                                              ? Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .freeFormDetailList![
                                                                index]
                                                            .section!,
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .freeFormDetailList![
                                                                index]
                                                            .freeFormSubDetailList!
                                                            .length,
                                                        itemBuilder: (context,
                                                            indexRadio) {
                                                          return Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                      value: contoller
                                                                              .listAnswer[
                                                                                  index]
                                                                              .radio!
                                                                              .listoptionID![
                                                                          indexRadio],
                                                                      groupValue: contoller
                                                                          .listAnswer[
                                                                              index]
                                                                          .radio!
                                                                          .valueID,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          contoller
                                                                              .listAnswer[index]
                                                                              .radio!
                                                                              .valueID = value!;
                                                                        });
                                                                      }),
                                                                  const SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Text(
                                                                    contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .radio!
                                                                        .listoption![indexRadio],
                                                                    style: textStyle(
                                                                        context,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            25),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                  height: 10),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                        color: Colors
                                                            .grey.shade200,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : (contoller
                                                          .dataEditEvent
                                                          .value
                                                          .events!
                                                          .freeFormDetailList![
                                                              index]
                                                          .types ==
                                                      3)
                                                  ? Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            contoller
                                                                .dataEditEvent
                                                                .value
                                                                .events!
                                                                .freeFormDetailList![
                                                                    index]
                                                                .section!,
                                                            style: textStyle(
                                                                context,
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 5,
                                                                child:
                                                                    Container(
                                                                  height: 120,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey),
                                                                    color:
                                                                        colorWhite,
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    //key: contoller.formKey,
                                                                    // validator: (value){
                                                                    //   if(value!.isEmpty){
                                                                    //     return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                                    //   }
                                                                    //   return null;
                                                                    // },
                                                                    maxLines:
                                                                        30,
                                                                    controller: contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .textfield!
                                                                        .value,
                                                                    style: textStyle(
                                                                        context,
                                                                        fontSize:
                                                                            25,
                                                                        color:
                                                                            colorBlack,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                    decoration:
                                                                        InputDecoration
                                                                            .collapsed(
                                                                      fillColor:
                                                                          colorWhite,
                                                                      hintText: contoller
                                                                          .dataEditEvent
                                                                          .value
                                                                          .events!
                                                                          .freeFormDetailList![
                                                                              index]
                                                                          .section!,
                                                                      hintStyle: textStyle(
                                                                          context,
                                                                          fontSize:
                                                                              25,
                                                                          color:
                                                                              colorGrey,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                      filled:
                                                                          true,
                                                                      // border:
                                                                      // OutlineInputBorder(
                                                                      //   borderSide:
                                                                      //   BorderSide(
                                                                      //     color:
                                                                      //     colorGrey,
                                                                      //     width:
                                                                      //     2,
                                                                      //   ),
                                                                      //   borderRadius:
                                                                      //   BorderRadius.circular(
                                                                      //       5),
                                                                      // ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 20,
                                                              ),
                                                              const Expanded(
                                                                flex: 5,
                                                                child:
                                                                    SizedBox(),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Divider(
                                                            height: 1,
                                                            color: Colors
                                                                .grey.shade200,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : (contoller
                                                              .dataEditEvent
                                                              .value
                                                              .events!
                                                              .freeFormDetailList![
                                                                  index]
                                                              .types ==
                                                          4)
                                                      ? Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                contoller
                                                                    .dataEditEvent
                                                                    .value
                                                                    .events!
                                                                    .freeFormDetailList![
                                                                        index]
                                                                    .section!,
                                                                style: textStyle(
                                                                    context,
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              if (contoller
                                                                          .listAnswer[
                                                                              index]
                                                                          .image!
                                                                          .value !=
                                                                      null &&
                                                                  contoller
                                                                          .listAnswer[
                                                                              index]
                                                                          .image!
                                                                          .value !=
                                                                      '')
                                                                Container(
                                                                  height: 250,
                                                                  width: 300,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            contoller.listAnswer[index].image!.value!,
                                                                          ),
                                                                          fit: BoxFit.cover)),
                                                                ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              DottedBorder(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                                dashPattern: [
                                                                  8,
                                                                  4
                                                                ],
                                                                strokeWidth: 2,
                                                                radius:
                                                                    const Radius
                                                                        .circular(
                                                                        5),
                                                                borderType:
                                                                    BorderType
                                                                        .RRect,
                                                                strokeCap:
                                                                    StrokeCap
                                                                        .round,
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    await contoller.selectedFileSingle(
                                                                        context,
                                                                        type: 4,
                                                                        index:
                                                                            index);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            colorWhite,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    width: 220,
                                                                    height: 80,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          180,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey.shade200),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'เลือกรูป',
                                                                        style: textStyle(
                                                                            context,
                                                                            color:
                                                                                colorBlue,
                                                                            fontSize:
                                                                                25),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Divider(
                                                                height: 1,
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : (contoller
                                                                  .dataEditEvent
                                                                  .value
                                                                  .events!
                                                                  .freeFormDetailList![
                                                                      index]
                                                                  .types ==
                                                              5)
                                                          ? Container(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    contoller
                                                                        .dataEditEvent
                                                                        .value
                                                                        .events!
                                                                        .freeFormDetailList![
                                                                            index]
                                                                        .section!,
                                                                    style: textStyle(
                                                                        context,
                                                                        fontSize:
                                                                            25,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  if (contoller
                                                                              .listAnswer[
                                                                                  index]
                                                                              .file!
                                                                              .value !=
                                                                          null &&
                                                                      contoller
                                                                              .listAnswer[index]
                                                                              .file!
                                                                              .value !=
                                                                          '')
                                                                    Container(
                                                                      height:
                                                                          150,
                                                                      width:
                                                                          250,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          color: Colors
                                                                              .grey
                                                                              .shade200),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            CupertinoIcons.doc_text_fill,
                                                                            size:
                                                                                40,
                                                                            color:
                                                                                colorGrey,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          Text(
                                                                            contoller.listAnswer[index].file!.name!,
                                                                            style: textStyle(context,
                                                                                color: colorGrey,
                                                                                fontSize: 25),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  DottedBorder(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    dashPattern: [
                                                                      8,
                                                                      4
                                                                    ],
                                                                    strokeWidth:
                                                                        2,
                                                                    radius: const Radius
                                                                        .circular(
                                                                        5),
                                                                    borderType:
                                                                        BorderType
                                                                            .RRect,
                                                                    strokeCap:
                                                                        StrokeCap
                                                                            .round,
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await contoller.selectedFileSingle(
                                                                            context,
                                                                            type:
                                                                                5,
                                                                            index:
                                                                                index);
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                colorWhite,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5)),
                                                                        width:
                                                                            220,
                                                                        height:
                                                                            80,
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              180,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            border:
                                                                                Border.all(color: Colors.grey.shade200),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'เลือกไฟล์',
                                                                            style: textStyle(context,
                                                                                color: colorBlue,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Divider(
                                                                    height: 1,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade200,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : const SizedBox();
                                },
                              ),

                          if (isAdmin)
                            if (contoller.dataEditEvent.value.events == null)
                              const SizedBox(
                                height: 40,
                              ),
                          // if(isAdmin)if(contoller.dataEditEvent.value.events==null) Obx(() {
                          //   if (contoller.showDropdown.value) {
                          //     return Row(
                          //       children: [
                          //         Expanded(
                          //           child: Column(
                          //             children: [
                          //               Text(
                          //                 "เลือกประเภท",
                          //                 style: textStyle(context,
                          //                     color: colorBlack, fontSize: 15),
                          //               ),
                          //               DropdownButton<String>(
                          //                 hint: Text(
                          //                   "เลือก",
                          //                   style: textStyle(context,
                          //                       color: colorBlack,
                          //                       fontSize: 15),
                          //                 ),
                          //                 value: contoller
                          //                     .selectedField.value ==
                          //                     ''
                          //                     ? null
                          //                     : contoller.selectedField.value,
                          //                 items: <String>[
                          //                   'Dropdown',
                          //                   'Checkbox',
                          //                   'Radio',
                          //                   'TextField',
                          //                   'Image',
                          //                   'File'
                          //                 ].map((String value) {
                          //                   return DropdownMenuItem<String>(
                          //                     value: value,
                          //                     child: Text(value),
                          //                   );
                          //                 }).toList(),
                          //                 onChanged: (String? newValue) {
                          //                   contoller.selectedField.value =
                          //                   newValue!;
                          //                 },
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     );
                          //   } else {
                          //     return Container();
                          //   }
                          // }),
                          if (isAdmin)
                            if (contoller.dataEditEvent.value.events == null)
                              Obx(() {
                                return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: contoller.listForm.length,
                                  itemBuilder: (context, index) {
                                    if (contoller.listForm[index].typeform ==
                                        'TextField') {
                                      return Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: const Text('หัวข้อ'),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: colorWhite,
                                                  ),
                                                  child: TextFormField(
                                                    //key: contoller.formKey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                      }
                                                      return null;
                                                    },
                                                    controller: contoller
                                                        .listForm[index]
                                                        .textfield!
                                                        .title,
                                                    autofocus: false,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: colorWhite,
                                                      hintText: "หัวข้อ",
                                                      hintStyle: textStyle(
                                                          context,
                                                          fontSize: 25,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      filled: true,
                                                      // border: OutlineInputBorder(
                                                      //   borderSide: BorderSide(
                                                      //     color: colorGrey,
                                                      //     width: 2,
                                                      //   ),
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(
                                                      //       5),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton.icon(
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.red),
                                                  label: const Text('ลบ',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  onPressed: () {
                                                    contoller.listForm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Container(
                                              child: TextFormField(
                                                enabled: false,
                                                controller: contoller
                                                    .listForm[index]
                                                    .textfield!
                                                    .listevent![0],
                                                autofocus: false,
                                                decoration: InputDecoration(
                                                  fillColor: colorWhite,
                                                  hintText: "กล่องข้อความ",
                                                  hintStyle: textStyle(context,
                                                      fontSize: 25,
                                                      color: colorGrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: colorGrey,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                              ),
                                              width: 200,
                                              height: 50,
                                            ),
                                            // Obx(
                                            //   () => ListView.builder(
                                            //     shrinkWrap: true,
                                            //     itemCount: contoller.listForm[index]
                                            //         .textfield!.listevent!.length,
                                            //     itemBuilder:
                                            //         (context, indexEvenList) {
                                            //       return Container(
                                            //         margin: EdgeInsets.all(10),
                                            //         width: 200,
                                            //         height: 50,
                                            //         child: Row(
                                            //           children: [
                                            //             SizedBox(
                                            //               width: 15,
                                            //             ),
                                            //             Container(
                                            //               child: TextFormField(
                                            //                 controller: contoller
                                            //                         .listForm[index]
                                            //                         .textfield!
                                            //                         .listevent![
                                            //                     indexEvenList],
                                            //                 autofocus: false,
                                            //                 decoration:
                                            //                     InputDecoration(
                                            //                   fillColor: colorWhite,
                                            //                   hintText:
                                            //                       "กล่องข้อความ",
                                            //                   hintStyle: TextStyle(
                                            //                       fontSize: 15.0,
                                            //                       color: colorGrey,
                                            //                       fontWeight:
                                            //                           FontWeight
                                            //                               .w400),
                                            //                   filled: true,
                                            //                   border:
                                            //                       OutlineInputBorder(
                                            //                     borderSide:
                                            //                         BorderSide(
                                            //                       color: colorGrey,
                                            //                       width: 2,
                                            //                     ),
                                            //                     borderRadius:
                                            //                         BorderRadius
                                            //                             .circular(
                                            //                                 5),
                                            //                   ),
                                            //                 ),
                                            //               ),
                                            //               width: 200,
                                            //               height: 50,
                                            //             ),
                                            //             // InkWell(
                                            //             //   child: Container(
                                            //             //     height: 50,
                                            //             //     width: 50,
                                            //             //     // color: Colors.red,
                                            //             //     child: Icon(
                                            //             //       Icons.close,
                                            //             //       size: 20,
                                            //             //     ),
                                            //             //   ),
                                            //             //   onTap: () {
                                            //             //     contoller
                                            //             //         .listForm[index]
                                            //             //         .textfield!
                                            //             //         .listevent!
                                            //             //         .removeAt(
                                            //             //             indexEvenList);
                                            //             //   },
                                            //             // )
                                            //           ],
                                            //         ),
                                            //       );
                                            //     },
                                            //   ),
                                            // ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            // Container(
                                            //   padding: EdgeInsets.all(10),
                                            //   child: OutlinedButton(
                                            //     child: const Text('เพิ่มตัวเลือก',
                                            //         style: TextStyle(
                                            //             color: Colors.blue)),
                                            //     style: OutlinedButton.styleFrom(
                                            //       foregroundColor: Colors.blue,
                                            //       side: const BorderSide(
                                            //           color: Colors.grey),
                                            //       shape: RoundedRectangleBorder(
                                            //           borderRadius:
                                            //               BorderRadius.circular(4)),
                                            //     ),
                                            //     onPressed: () {
                                            //       contoller.listForm[index]
                                            //           .textfield!.listevent!
                                            //           .add(TextEditingController());
                                            //     },
                                            //   ),
                                            // ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (contoller
                                            .listForm[index].typeform ==
                                        'Dropdown') {
                                      return Container(
                                        // color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: const Text('หัวข้อ'),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: colorWhite,
                                                  ),
                                                  child: TextFormField(
                                                    //key: contoller.formKey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                      }
                                                      return null;
                                                    },
                                                    controller: contoller
                                                        .listForm[index]
                                                        .dropdown!
                                                        .title,
                                                    autofocus: false,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: colorWhite,
                                                      hintText: "หัวข้อ",
                                                      hintStyle: textStyle(
                                                          context,
                                                          fontSize: 25,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      filled: true,
                                                      // border: OutlineInputBorder(
                                                      //   borderSide: BorderSide(
                                                      //     color: colorGrey,
                                                      //     width: 2,
                                                      //   ),
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(
                                                      //       5),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton.icon(
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.red),
                                                  label: const Text('ลบ',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  onPressed: () {
                                                    contoller.listForm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Obx(
                                              () => ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: contoller
                                                    .listForm[index]
                                                    .dropdown!
                                                    .listevent!
                                                    .length,
                                                itemBuilder:
                                                    (context, indexEvenList) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    width: 200,
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                            '${indexEvenList + 1}.'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          child: TextFormField(
                                                            //key: contoller.formKey,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                              }
                                                              return null;
                                                            },
                                                            controller: contoller
                                                                    .listForm[index]
                                                                    .dropdown!
                                                                    .listevent![
                                                                indexEvenList],
                                                            autofocus: false,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  colorWhite,
                                                              hintText:
                                                                  "ตัวเลือก ${indexEvenList + 1}",
                                                              hintStyle: textStyle(
                                                                  context,
                                                                  fontSize: 25,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              filled: true,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      colorGrey,
                                                                  width: 2,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                            ),
                                                          ),
                                                          width: 200,
                                                          height: 50,
                                                        ),
                                                        InkWell(
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            // color: Colors.red,
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            contoller
                                                                .listForm[index]
                                                                .dropdown!
                                                                .listevent!
                                                                .removeAt(
                                                                    indexEvenList);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: OutlinedButton(
                                                child: const Text(
                                                    'เพิ่มตัวเลือก',
                                                    style: TextStyle(
                                                        color: Colors.blue)),
                                                style: OutlinedButton.styleFrom(
                                                  foregroundColor: Colors.blue,
                                                  side: const BorderSide(
                                                      color: Colors.grey),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                ),
                                                onPressed: () {
                                                  contoller.listForm[index]
                                                      .dropdown!.listevent!
                                                      .add(
                                                          TextEditingController());
                                                },
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (contoller
                                            .listForm[index].typeform ==
                                        'Checkbox') {
                                      return Container(
                                        // color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: const Text('หัวข้อ'),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: colorWhite,
                                                  ),
                                                  child: TextFormField(
                                                    //key: contoller.formKey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                      }
                                                      return null;
                                                    },
                                                    controller: contoller
                                                        .listForm[index]
                                                        .checkbox!
                                                        .title,
                                                    autofocus: false,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: colorWhite,
                                                      hintText: "หัวข้อ",
                                                      hintStyle: textStyle(
                                                          context,
                                                          fontSize: 25,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      filled: true,
                                                      // border: OutlineInputBorder(
                                                      //   borderSide: BorderSide(
                                                      //     color: colorGrey,
                                                      //     width: 2,
                                                      //   ),
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(
                                                      //       5),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton.icon(
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.red),
                                                  label: const Text('ลบ',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  onPressed: () {
                                                    contoller.listForm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Obx(
                                              () => ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: contoller
                                                    .listForm[index]
                                                    .checkbox!
                                                    .listevent!
                                                    .length,
                                                itemBuilder:
                                                    (context, indexEvenList) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    width: 200,
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .check_box_outline_blank,
                                                          color: Colors.grey,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          child: TextFormField(
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                              }
                                                              return null;
                                                            },
                                                            controller: contoller
                                                                    .listForm[index]
                                                                    .checkbox!
                                                                    .listevent![
                                                                indexEvenList],
                                                            autofocus: false,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  colorWhite,
                                                              hintText:
                                                                  "ตัวเลือก ${indexEvenList + 1}",
                                                              hintStyle: textStyle(
                                                                  context,
                                                                  fontSize: 25,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              filled: true,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      colorGrey,
                                                                  width: 2,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                            ),
                                                          ),
                                                          width: 200,
                                                          height: 50,
                                                        ),
                                                        InkWell(
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            // color: Colors.red,
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            contoller
                                                                .listForm[index]
                                                                .checkbox!
                                                                .listevent!
                                                                .removeAt(
                                                                    indexEvenList);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: OutlinedButton(
                                                child: const Text(
                                                    'เพิ่มตัวเลือก',
                                                    style: TextStyle(
                                                        color: Colors.blue)),
                                                style: OutlinedButton.styleFrom(
                                                  foregroundColor: Colors.blue,
                                                  side: const BorderSide(
                                                      color: Colors.grey),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                ),
                                                onPressed: () {
                                                  contoller.listForm[index]
                                                      .checkbox!.listevent!
                                                      .add(
                                                          TextEditingController());
                                                },
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (contoller
                                            .listForm[index].typeform ==
                                        'Radio') {
                                      return Container(
                                        // color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: const Text('หัวข้อ'),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: colorWhite,
                                                  ),
                                                  child: TextFormField(
                                                    //key: contoller.formKey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                      }
                                                      return null;
                                                    },
                                                    controller: contoller
                                                        .listForm[index]
                                                        .radio!
                                                        .title,
                                                    autofocus: false,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: colorWhite,
                                                      hintText: "หัวข้อ",
                                                      hintStyle: textStyle(
                                                          context,
                                                          fontSize: 25,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      filled: true,
                                                      // border: OutlineInputBorder(
                                                      //   borderSide: BorderSide(
                                                      //     color: colorGrey,
                                                      //     width: 2,
                                                      //   ),
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(
                                                      //       5),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton.icon(
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.red),
                                                  label: const Text('ลบ',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  onPressed: () {
                                                    contoller.listForm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Obx(
                                              () => ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: contoller
                                                    .listForm[index]
                                                    .radio!
                                                    .listevent!
                                                    .length,
                                                itemBuilder:
                                                    (context, indexEvenList) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    width: 200,
                                                    height: 50,
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .radio_button_unchecked, // Use Icons.radio_button_checked for checked state
                                                          color: Colors.grey,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          child: TextFormField(
                                                            //key: contoller.formKey,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                              }
                                                              return null;
                                                            },
                                                            controller: contoller
                                                                    .listForm[index]
                                                                    .radio!
                                                                    .listevent![
                                                                indexEvenList],
                                                            autofocus: false,
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor:
                                                                  colorWhite,
                                                              hintText:
                                                                  "ตัวเลือก ${indexEvenList + 1}",
                                                              hintStyle: textStyle(
                                                                  context,
                                                                  fontSize: 25,
                                                                  color:
                                                                      colorGrey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              filled: true,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color:
                                                                      colorGrey,
                                                                  width: 2,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                            ),
                                                          ),
                                                          width: 200,
                                                          height: 50,
                                                        ),
                                                        InkWell(
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            // color: Colors.red,
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 20,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            contoller
                                                                .listForm[index]
                                                                .radio!
                                                                .listevent!
                                                                .removeAt(
                                                                    indexEvenList);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: OutlinedButton(
                                                child: const Text(
                                                    'เพิ่มตัวเลือก',
                                                    style: TextStyle(
                                                        color: Colors.blue)),
                                                style: OutlinedButton.styleFrom(
                                                  foregroundColor: Colors.blue,
                                                  side: const BorderSide(
                                                      color: Colors.grey),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                ),
                                                onPressed: () {
                                                  contoller.listForm[index]
                                                      .radio!.listevent!
                                                      .add(
                                                          TextEditingController());
                                                },
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (contoller
                                            .listForm[index].typeform ==
                                        'Image') {
                                      return Container(
                                        height: 175,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: const Text('หัวข้อ'),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: colorWhite,
                                                  ),
                                                  child: TextFormField(
                                                    //key: contoller.formKey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                      }
                                                      return null;
                                                    },
                                                    controller: contoller
                                                        .listForm[index]
                                                        .image!
                                                        .title,
                                                    autofocus: false,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: colorWhite,
                                                      hintText: "หัวข้อ",
                                                      hintStyle: textStyle(
                                                          context,
                                                          fontSize: 25,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      filled: true,
                                                      // border: OutlineInputBorder(
                                                      //   borderSide: BorderSide(
                                                      //     color: colorGrey,
                                                      //     width: 2,
                                                      //   ),
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(
                                                      //       5),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton.icon(
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.red),
                                                  label: const Text('ลบ',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  onPressed: () {
                                                    contoller.listForm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 200,
                                              child: const Text('เพิ่มรูป'),
                                            ),
                                            DottedBorder(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                color: Colors.grey,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    'เลือกรูป',
                                                    style: textStyle(context,
                                                        color: Colors.blue,
                                                        fontSize: 25),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (contoller
                                            .listForm[index].typeform ==
                                        'File') {
                                      return Container(
                                        height: 175,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: const Text('หัวข้อ'),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 200,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    color: colorWhite,
                                                  ),
                                                  child: TextFormField(
                                                    //key: contoller.formKey,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'กรุณาใส่ข้อมูลให้ถูกต้อง';
                                                      }
                                                      return null;
                                                    },
                                                    controller: contoller
                                                        .listForm[index]
                                                        .file!
                                                        .title,
                                                    autofocus: false,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      fillColor: colorWhite,
                                                      hintText: "หัวข้อ",
                                                      hintStyle: textStyle(
                                                          context,
                                                          fontSize: 25,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      filled: true,
                                                      // border: OutlineInputBorder(
                                                      //   borderSide: BorderSide(
                                                      //     color: colorGrey,
                                                      //     width: 2,
                                                      //   ),
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(
                                                      //       5),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                OutlinedButton.icon(
                                                  icon: const Icon(Icons.close,
                                                      color: Colors.red),
                                                  label: const Text('ลบ',
                                                      style: TextStyle(
                                                          color: Colors.red)),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor: Colors.red,
                                                    side: const BorderSide(
                                                        color: Colors.red),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                  ),
                                                  onPressed: () {
                                                    contoller.listForm
                                                        .removeAt(index);
                                                  },
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 200,
                                              child: const Text('เพิ่มไฟล์'),
                                            ),
                                            DottedBorder(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                color: Colors.grey,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    'เลือกไฟล์',
                                                    style: textStyle(context,
                                                        color: Colors.blue,
                                                        fontSize: 25),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider(
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                );
                              }),
                          // เพิ่มฟอร์ม
                          if (isAdmin)
                            if (contoller.dataEditEvent.value.events == null)
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.brown[200]!),
                                    ),
                                    height: 40,
                                    width: 120,
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                      onTap: () {
                                        contoller.showDropdown.value = true;
                                        if (contoller.selectedField.value ==
                                            'TextField') {
                                          contoller.listForm.add(ListFormModel(
                                              typeform: 'TextField',
                                              textfield: Textfield(
                                                  listevent: [
                                                    TextEditingController()
                                                  ].obs,
                                                  title:
                                                      TextEditingController())));
                                        }
                                        if (contoller.selectedField.value ==
                                            'Dropdown') {
                                          contoller.listForm.add(ListFormModel(
                                              typeform: 'Dropdown',
                                              dropdown: MyDropdown(
                                                  listevent: [
                                                    TextEditingController()
                                                  ].obs,
                                                  title:
                                                      TextEditingController())));
                                        }
                                        if (contoller.selectedField.value ==
                                            'Checkbox') {
                                          contoller.listForm.add(ListFormModel(
                                              typeform: 'Checkbox',
                                              checkbox: MyCheckBox(
                                                  listevent: [
                                                    TextEditingController()
                                                  ].obs,
                                                  title:
                                                      TextEditingController())));
                                        }
                                        if (contoller.selectedField.value ==
                                            'Radio') {
                                          contoller.listForm.add(ListFormModel(
                                              typeform: 'Radio',
                                              radio: MyRadio(
                                                  listevent: [
                                                    TextEditingController()
                                                  ].obs,
                                                  title:
                                                      TextEditingController())));
                                        }
                                        if (contoller.selectedField.value ==
                                            'Image') {
                                          contoller.listForm.add(ListFormModel(
                                              typeform: 'Image',
                                              image: MyImg(
                                                  title:
                                                      TextEditingController())));
                                        }
                                        if (contoller.selectedField.value ==
                                            'File') {
                                          contoller.listForm.add(ListFormModel(
                                              typeform: 'File',
                                              file: MyFile(
                                                  title:
                                                      TextEditingController())));
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.edit_calendar_outlined,
                                              color: colorBlack),
                                          const SizedBox(width: 5),
                                          Text(
                                            'เพิ่มฟอร์ม',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 25),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  if (isAdmin)
                                    if (contoller.dataEditEvent.value.events ==
                                        null)
                                      Obx(() {
                                        if (contoller.showDropdown.value) {
                                          return Column(
                                            children: [
                                              Text(
                                                "เลือกประเภท",
                                                style: textStyle(context,
                                                    color: colorBlack,
                                                    fontSize: 25),
                                              ),
                                              DropdownButton<String>(
                                                hint: Text(
                                                  "เลือก",
                                                  style: textStyle(context,
                                                      color: colorBlack,
                                                      fontSize: 25),
                                                ),
                                                value: contoller.selectedField
                                                            .value ==
                                                        ''
                                                    ? null
                                                    : contoller
                                                        .selectedField.value,
                                                items: <String>[
                                                  'Dropdown',
                                                  'Checkbox',
                                                  'Radio',
                                                  'TextField',
                                                  'Image',
                                                  'File'
                                                ].map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  contoller.selectedField
                                                      .value = newValue!;
                                                },
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ],
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
                                    color: colorBlack, fontSize: 25),
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
                                      keepAlive: true,
                                      initialCenter: LatLng(
                                          double.parse((contoller
                                                  .lat.value.text.isNotEmpty)
                                              ? contoller.lat.value.text
                                              : "18.317058"),
                                          double.parse((contoller
                                                  .lng.value.text.isNotEmpty)
                                              ? contoller.lng.value.text
                                              : "99.398686")),
                                      initialZoom: 14,
                                      interactionOptions: InteractionOptions(
                                        flags: (isAdmin)
                                            ? InteractiveFlag
                                                    .doubleTapDragZoom |
                                                InteractiveFlag.drag
                                            : InteractiveFlag.none,
                                      ),
                                      onPointerUp: (v, c) async {
                                        addressModel location =
                                            await getLatLong(
                                                long: contoller.lng.value.text,
                                                lat: contoller.lat.value.text,
                                                index: 2);
                                        contoller.address.value.text =
                                            location.address!;
                                      },
                                      onPositionChanged: (v, c) {
                                        contoller.lat.value.text = contoller
                                            .mapController
                                            .value
                                            .camera
                                            .center
                                            .latitude
                                            .toStringAsFixed(6);
                                        contoller.lng.value.text = contoller
                                            .mapController
                                            .value
                                            .camera
                                            .center
                                            .longitude
                                            .toStringAsFixed(6);
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
                                    height: (contoller.listSearchMap.isEmpty)
                                        ? 45
                                        : 350,
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
                                                  child:
                                                      const Icon(Icons.search)),
                                              fillColor: colorWhite,
                                              hintText: "ค้นหา",
                                              hintStyle: textStyle(context,
                                                  fontSize: 25,
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
                                    height: 65,
                                    child: const Column(
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
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'ที่อยู่',
                                          style: textStyle(context,
                                              color: colorBlack, fontSize: 25),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'เลือกสัญลักษณ์',
                                          style: textStyle(context,
                                              color: colorBlack, fontSize: 25),
                                        )),
                                  )
                                ]),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: colorWhite,
                                        child: TextFormField(
                                          enabled: false,
                                          maxLines: 3,
                                          controller: contoller.address.value,
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ที่อยู่",
                                            hintStyle: textStyle(context,
                                                fontSize: 25,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                            StatefulBuilder(
                                                              builder: (context,
                                                                      setState) =>
                                                                  Scaffold(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                body: Center(
                                                                  child: Stack(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            500,
                                                                        width:
                                                                            365,
                                                                        padding:
                                                                            EdgeInsets.all(5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        child: GridView
                                                                            .builder(
                                                                          shrinkWrap:
                                                                              true,
                                                                          gridDelegate:
                                                                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                                                            maxCrossAxisExtent:
                                                                                100,
                                                                            crossAxisSpacing:
                                                                                5.0,
                                                                            mainAxisSpacing:
                                                                                10.0,
                                                                            childAspectRatio:
                                                                                1,
                                                                          ),
                                                                          itemCount:
                                                                              listIconType.length,
                                                                          itemBuilder:
                                                                              (context, indexImage) {
                                                                            return Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    contoller.selectIcon.value = indexImage;
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    padding: EdgeInsets.all(10),
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(100),
                                                                                      color: Colors.black45,
                                                                                    ),
                                                                                    child: SvgPicture.asset(
                                                                                      listIconType[indexImage],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                          right:
                                                                              -5,
                                                                          top:
                                                                              -5,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40,
                                                                            width:
                                                                                40,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Icon(
                                                                                Icons.clear,
                                                                                size: 30,
                                                                                color: Colors.grey,
                                                                              ),
                                                                            ),
                                                                          ))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: colorWhite,
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color:
                                                              Colors.black45),
                                                      child: SvgPicture.asset(
                                                        listIconType[contoller
                                                            .selectIcon.value],
                                                      ),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    ),
                                                    Spacer(),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
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
                                                fontSize: 25),
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
                                                fontSize: 25),
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
                                            hintStyle: textStyle(context,
                                                fontSize: 25,
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
                                          enabled: (isAdmin) ? true : false,
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
                                            hintStyle: textStyle(context,
                                                fontSize: 25,
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
                                                contoller.selectedImage(
                                                    context, 1);
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
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
                                                      fontSize: 25),
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
                                              contoller.selectedImage(
                                                  context, 1);
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
                                                      fontSize: 25),
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
                                              color: colorBlack, fontSize: 25),
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
                                            hintStyle: textStyle(context,
                                                fontSize: 25,
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
                          if (contoller.dataEditEvent.value.events != null)
                            Text(
                              'อัพเดทสถานะการณ์รายงาน',
                              style: textStyle(context,
                                  color: colorBlack,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          if (contoller.dataEditEvent.value.events != null)
                            const SizedBox(
                              height: 20,
                            ),
                          if (contoller.dataEditEvent.value.events != null)
                            Container(
                              child: Column(
                                children: [
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: (contoller.listConvertImageLog
                                              .value.isEmpty)
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
                                                        contoller.selectedImage(
                                                            context, 2);
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 80,
                                                            bottom: 80),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 40,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color:
                                                                    colorGrey)),
                                                        child: Text(
                                                          'เลือกรูป',
                                                          style: textStyle(
                                                              context,
                                                              color: colorBlue,
                                                              fontSize: 25),
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
                                                      .listConvertImageLog
                                                      .value
                                                      .length +
                                                  1,
                                              itemBuilder: (context, index) {
                                                if (index ==
                                                    contoller
                                                        .listConvertImageLog
                                                        .value
                                                        .length) {
                                                  return InkWell(
                                                    onTap: () {
                                                      contoller.selectedImage(
                                                          context, 2);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 40,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color:
                                                                    colorGrey)),
                                                        child: Text(
                                                          'เลือกรูป',
                                                          style: textStyle(
                                                              context,
                                                              color: colorBlue,
                                                              fontSize: 25),
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
                                                                image: NetworkImage(contoller
                                                                    .listConvertImageLog
                                                                    .value[
                                                                        index]
                                                                    .pathImage!),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      Positioned(
                                                        child: InkWell(
                                                          onTap: () {
                                                            contoller
                                                                .listConvertImageLog
                                                                .removeAt(
                                                                    index);
                                                          },
                                                          child: Container(
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 15,
                                                              color: colorBlack,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            height: 25,
                                                            width: 25,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                color:
                                                                    colorGrey),
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
                                    height: 10,
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: (contoller
                                              .listConvertFileLog.value.isEmpty)
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
                                                        contoller.selectedFile(
                                                            context);
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 80,
                                                            bottom: 80),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 40,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color:
                                                                    colorGrey)),
                                                        child: Text(
                                                          'เลือกไฟล์',
                                                          style: textStyle(
                                                              context,
                                                              color: colorBlue,
                                                              fontSize: 25),
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
                                                      .listConvertFileLog
                                                      .value
                                                      .length +
                                                  1,
                                              itemBuilder: (context, index) {
                                                if (index ==
                                                    contoller.listConvertFileLog
                                                        .value.length) {
                                                  return InkWell(
                                                    onTap: () {
                                                      contoller.selectedFile(
                                                          context);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 40,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color:
                                                                    colorGrey)),
                                                        child: Text(
                                                          'เลือกไฟล์',
                                                          style: textStyle(
                                                              context,
                                                              color: colorBlue,
                                                              fontSize: 25),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Stack(
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 200,
                                                        width: 200,
                                                        color: Colors
                                                            .grey.shade100,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Icon(
                                                              CupertinoIcons
                                                                  .arrow_down_doc,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              contoller
                                                                  .listConvertFileLog[
                                                                      index]
                                                                  .imageName!,
                                                              style: textStyle(
                                                                  context,
                                                                  color:
                                                                      colorBlue,
                                                                  fontSize: 25),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        child: InkWell(
                                                          onTap: () {
                                                            contoller
                                                                .listConvertFileLog
                                                                .removeAt(
                                                                    index);
                                                          },
                                                          child: Container(
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 15,
                                                              color: colorBlack,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            height: 25,
                                                            width: 25,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                color:
                                                                    colorGrey),
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
                                                  'รายละเอียดรายงาน',
                                                  style: textStyle(context,
                                                      color: colorBlack,
                                                      fontSize: 25),
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
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: colorWhite,
                                                ),
                                                height: 150,
                                                child: TextFormField(
                                                  maxLines: 300,
                                                  controller: contoller
                                                      .remarkReport.value,
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    fillColor: colorWhite,
                                                    hintText:
                                                        "รายละเอียดรายงาน",
                                                    hintStyle: textStyle(
                                                        context,
                                                        fontSize: 25,
                                                        color: colorGrey,
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                ],
                              ),
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
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      content:
                                          const Text('คุณต้องการยกเลิกหรือไม่'),
                                      actions: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'ยกเลิก',
                                              style: textStyle(context,
                                                  fontSize: 25),
                                            )),
                                        InkWell(
                                            onTap: () async {
                                              await contoller.clearData();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'ตกลง',
                                              style: textStyle(context,
                                                  fontSize: 25),
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
                                        fontSize: 25,
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
                                  if (contoller.formKey.currentState!
                                      .validate()) {
                                    await contoller.submit(context);
                                  }
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
                                        fontSize: 25,
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

  List<Widget> listCheckBox(BuildContext context, int index, int length) {
    final ContollerCreateList contoller =
        Get.put(ContollerCreateList(), permanent: false);

    List<Widget> wi = [];
    for (int i = 0; i < length; i++) {
      wi.add(Container(
        child: Row(
          children: [
            Checkbox(
              value: contoller.listAnswer[index].checkbox!.listvalueoption![i],
              onChanged: (value) {
                setState(() {
                  if (contoller
                          .listAnswer[index].checkbox!.listvalueoption![i] ==
                      true) {
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        false;
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        false;

                    contoller.listAnswer[index].checkbox!.valueID!.removeAt(
                        contoller.listAnswer[index].checkbox!.valueID!.indexOf(
                            contoller
                                .listAnswer[index].checkbox!.listoptionID![i]));
                  } else {
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        true;
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        true;
                    contoller.listAnswer[index].checkbox!.valueID!.add(contoller
                        .listAnswer[index].checkbox!.listoptionID![i]
                        .toString());
                  }
                });
                // setState(() {
                //   _valueCheck=value!;
                // });
              },
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              contoller.listAnswer[index].checkbox!.listoption![i],
              style: textStyle(context, color: Colors.black, fontSize: 25),
            )
          ],
        ),
      ));
      wi.add(const SizedBox(
        height: 10,
      ));
    }
    return wi;
  }
}
