// import 'package:disaster/model/createevenmodel.dart';
// import 'package:disaster/screen/handler/creatotherslist/controller_creat_otherlist.dart';
// import 'package:disaster/stye/colors.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';
// // import 'package:vph_web_date_picker/vph_web_date_picker.dart';
// import '../../../../stye/font.dart';
// import '../../../api/latlongapi.dart';
//
// class CreateListOthers extends StatelessWidget {
//   CreateListOthers({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final ContollerCreateOthersList contoller =
//         Get.put(ContollerCreateOthersList(), permanent: false);
//     return ListView(
//       children: [
//         Form(
//           // key: contoller.textFieldKey.value,
//           child: Column(
//             children: [
//               Container(
//                   color: colorBackground,
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, bottom: 150, top: 20),
//                   child: Obx(() => Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                               height: 20,
//                               child: Text(
//                                   (contoller.dataEditEvent.value.events == null)
//                                       ? 'สร้างรายการอื่นๆ'
//                                       : 'แก้ไขรายงาน',
//                                   style: textStyle(context,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold))),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             height: 60,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'ชื่อรายการ',
//                                             style: textStyle(context,
//                                                 color: colorBlack,
//                                                 fontSize: 15),
//                                           )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                         height: 40,
//                                         color: colorWhite,
//                                         child: TextFormField(
//                                           controller: contoller.nameCon.value,
//                                           style: TextStyle(
//                                               fontSize: 15.0,
//                                               color: colorBlack,
//                                               fontWeight: FontWeight.w400),
//                                           decoration: InputDecoration(
//                                             fillColor: colorWhite,
//                                             hintText: "ชื่อรายการ",
//                                             hintStyle: TextStyle(
//                                                 fontSize: 15.0,
//                                                 color: colorGrey,
//                                                 fontWeight: FontWeight.w400),
//                                             filled: true,
//                                             border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color: colorGrey,
//                                                 width: 2,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(flex: 5, child: Container()),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Container(
//                             height: 60,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'วันที่รับเรื่อง',
//                                             style: textStyle(context,
//                                                 color: colorBlack,
//                                                 fontSize: 15),
//                                           )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: (contoller
//                                                   .dataEditEvent.value.events ==
//                                               null)
//                                           ? SizedBox()
//                                           : Container(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text(
//                                                 'สถานะของรายการ',
//                                                 style: textStyle(context,
//                                                     color: colorBlack,
//                                                     fontSize: 15),
//                                               )),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: InkWell(
//                                         onTap: () async {
//                                           DateTime? newDateTime =
//                                               await showRoundedDatePicker(
//                                             theme: ThemeData(
//                                               primaryColor: Colors.amberAccent,
//                                             ),
//                                             styleDatePicker:
//                                                 MaterialRoundedDatePickerStyle(
//                                               textStyleCurrentDayOnCalendar:
//                                                   TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                               textStyleDayOnCalendar: TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.black),
//                                               textStyleDayOnCalendarSelected:
//                                                   TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                               textStyleDayOnCalendarDisabled:
//                                                   TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.black
//                                                           .withOpacity(0.1)),
//                                               textStyleMonthYearHeader:
//                                                   TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                               sizeArrow: 50,
//                                               colorArrowNext: Colors.black,
//                                               colorArrowPrevious: Colors.black,
//                                               marginLeftArrowPrevious: 16,
//                                               marginTopArrowPrevious: 16,
//                                               marginTopArrowNext: 16,
//                                               marginRightArrowNext: 32,
//                                               textStyleButtonAction: TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.black),
//                                               textStyleButtonPositive:
//                                                   TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.amber,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                               textStyleButtonNegative:
//                                                   TextStyle(
//                                                       fontSize: 20,
//                                                       color: Colors.black45
//                                                           .withOpacity(0.5)),
//                                               decorationDateSelected:
//                                                   BoxDecoration(
//                                                       color: Colors.amber,
//                                                       shape: BoxShape.circle),
//                                             ),
//                                             styleYearPicker:
//                                                 MaterialRoundedYearPickerStyle(
//                                               textStyleYear: TextStyle(
//                                                   fontSize: 30,
//                                                   color: Colors.black),
//                                               textStyleYearSelected: TextStyle(
//                                                   fontSize: 40,
//                                                   color: Colors.black45,
//                                                   fontWeight: FontWeight.bold),
//                                               heightYearRow: 100,
//                                             ),
//                                             context: context,
//                                             locale: Locale("th", "TH"),
//                                           );
//                                           if (newDateTime != null) {
//                                             contoller.date.value = newDateTime
//                                                 .toString()
//                                                 .split(" ")[0];
//                                           }
//                                         },
//                                         child: Container(
//                                           padding: const EdgeInsets.only(
//                                               left: 20, right: 5),
//                                           height: 40,
//                                           decoration: BoxDecoration(
//                                               color: colorWhite,
//                                               border: Border.all(
//                                                 color: Colors.black26,
//                                                 width: 1,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           alignment: Alignment.center,
//                                           child: SizedBox(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   contoller.date.value,
//                                                   style: textStyle(context,
//                                                       fontSize: 15,
//                                                       color: colorBlack),
//                                                 ),
//                                                 Icon(
//                                                   Icons.date_range,
//                                                   size: 20,
//                                                   color: Colors.grey,
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: (contoller
//                                                   .dataEditEvent.value.events ==
//                                               null)
//                                           ? SizedBox()
//                                           : Container(
//                                               padding: const EdgeInsets.only(
//                                                   left: 20, right: 5),
//                                               width: double.infinity,
//                                               height: 40,
//                                               decoration: BoxDecoration(
//                                                   color: colorWhite,
//                                                   border: Border.all(
//                                                     color: Colors.black26,
//                                                     width: 1,
//                                                   ),
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                               alignment: Alignment.center,
//                                               child: SizedBox(
//                                                 width: double.infinity,
//                                                 child:
//                                                     DropdownButtonHideUnderline(
//                                                   child:
//                                                       DropdownButton2<String>(
//                                                     dropdownStyleData:
//                                                         DropdownStyleData(
//                                                       maxHeight: 300,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5),
//                                                       ),
//                                                       scrollbarTheme:
//                                                           ScrollbarThemeData(
//                                                         radius: const Radius
//                                                             .circular(5),
//                                                         thickness:
//                                                             MaterialStateProperty
//                                                                 .all<double>(6),
//                                                         thumbVisibility:
//                                                             MaterialStateProperty
//                                                                 .all<bool>(
//                                                                     true),
//                                                       ),
//                                                     ),
//                                                     autofocus: true,
//                                                     isExpanded: true,
//                                                     value: contoller
//                                                         .selectStatusList!
//                                                         .value,
//                                                     hint: Text(
//                                                       'เลือกทั้งหมด',
//                                                       style: TextStyle(
//                                                           fontSize: 15.0,
//                                                           color: colorGrey,
//                                                           fontWeight:
//                                                               FontWeight.w400),
//                                                     ),
//                                                     items: contoller
//                                                         .StatusList.map<
//                                                             DropdownMenuItem<
//                                                                 String>>(
//                                                         (String? value) {
//                                                       return DropdownMenuItem<
//                                                           String>(
//                                                         value: value!,
//                                                         child: Text(
//                                                           value,
//                                                           style: TextStyle(
//                                                               fontSize: 15.0,
//                                                               color: colorBlack,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                         ),
//                                                       );
//                                                     }).toList(),
//                                                     iconStyleData:
//                                                         const IconStyleData(
//                                                             icon: Icon(
//                                                       Icons.keyboard_arrow_down,
//                                                       size: 24,
//                                                     )),
//                                                     onChanged: (valueSelect) {
//                                                       contoller
//                                                           .selectStatusList!
//                                                           .value = valueSelect!;
//                                                     },
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // วันที่รับเรื่อง
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Container(
//                             height: 60,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'หน่วยงานที่รับผิดชอบ',
//                                             style: textStyle(context,
//                                                 color: colorBlack,
//                                                 fontSize: 15),
//                                           )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: (contoller
//                                                   .dataEditEvent.value.events ==
//                                               null)
//                                           ? SizedBox()
//                                           : Container(
//                                               alignment: Alignment.centerLeft,
//                                               child: Text(
//                                                 'สถานะหน่วยงานที่รับผิดชอบ',
//                                                 style: textStyle(context,
//                                                     color: colorBlack,
//                                                     fontSize: 15),
//                                               )),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                         height: 40,
//                                         color: colorWhite,
//                                         child: TextFormField(
//                                           controller:
//                                               contoller.responsible.value,
//                                           style: TextStyle(
//                                               fontSize: 15.0,
//                                               color: colorBlack,
//                                               fontWeight: FontWeight.w400),
//                                           decoration: InputDecoration(
//                                             fillColor: colorWhite,
//                                             hintText: "หน่วยงานที่รับผิดชอบ",
//                                             hintStyle: TextStyle(
//                                                 fontSize: 15.0,
//                                                 color: colorGrey,
//                                                 fontWeight: FontWeight.w400),
//                                             filled: true,
//                                             border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color: colorGrey,
//                                                 width: 2,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: (contoller
//                                                   .dataEditEvent.value.events ==
//                                               null)
//                                           ? SizedBox()
//                                           : Container(
//                                               padding: const EdgeInsets.only(
//                                                   left: 20, right: 5),
//                                               width: double.infinity,
//                                               height: 40,
//                                               decoration: BoxDecoration(
//                                                   color: colorWhite,
//                                                   border: Border.all(
//                                                     color: Colors.black26,
//                                                     width: 1,
//                                                   ),
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                               alignment: Alignment.center,
//                                               child: SizedBox(
//                                                 width: double.infinity,
//                                                 child:
//                                                     DropdownButtonHideUnderline(
//                                                   child:
//                                                       DropdownButton2<String>(
//                                                     dropdownStyleData:
//                                                         DropdownStyleData(
//                                                       maxHeight: 300,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5),
//                                                       ),
//                                                       scrollbarTheme:
//                                                           ScrollbarThemeData(
//                                                         radius: const Radius
//                                                             .circular(5),
//                                                         thickness:
//                                                             MaterialStateProperty
//                                                                 .all<double>(6),
//                                                         thumbVisibility:
//                                                             MaterialStateProperty
//                                                                 .all<bool>(
//                                                                     true),
//                                                       ),
//                                                     ),
//                                                     autofocus: true,
//                                                     isExpanded: true,
//                                                     value: contoller
//                                                         .selectStatusResponsible!
//                                                         .value,
//                                                     hint: Text(
//                                                       'เลือกทั้งหมด',
//                                                       style: TextStyle(
//                                                           fontSize: 15.0,
//                                                           color: colorGrey,
//                                                           fontWeight:
//                                                               FontWeight.w400),
//                                                     ),
//                                                     items: contoller
//                                                         .StatusResponsible.map<
//                                                             DropdownMenuItem<
//                                                                 String>>(
//                                                         (String? value) {
//                                                       return DropdownMenuItem<
//                                                           String>(
//                                                         value: value!,
//                                                         child: Text(
//                                                           value,
//                                                           style: TextStyle(
//                                                               fontSize: 15.0,
//                                                               color: colorBlack,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                         ),
//                                                       );
//                                                     }).toList(),
//                                                     iconStyleData:
//                                                         const IconStyleData(
//                                                             icon: Icon(
//                                                       Icons.keyboard_arrow_down,
//                                                       size: 24,
//                                                     )),
//                                                     onChanged: (valueSelect) {
//                                                       contoller
//                                                           .selectStatusResponsible!
//                                                           .value = valueSelect!;
//                                                     },
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Obx(() {
//                             if (contoller.showDropdown.value) {
//                               return Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           "เลือกประเภท",
//                                           style: textStyle(context,
//                                               color: colorBlack, fontSize: 15),
//                                         ),
//                                         DropdownButton<String>(
//                                           hint: Text(
//                                             "เลือก",
//                                             style: textStyle(context,
//                                                 color: colorBlack,
//                                                 fontSize: 15),
//                                           ),
//                                           value: contoller
//                                                       .selectedField.value ==
//                                                   ''
//                                               ? null
//                                               : contoller.selectedField.value,
//                                           items: <String>[
//                                             'Dropdown',
//                                             'Checkbox',
//                                             'Radio',
//                                             'TextField',
//                                             'Image',
//                                             'File'
//                                           ].map((String value) {
//                                             return DropdownMenuItem<String>(
//                                               value: value,
//                                               child: Text(value),
//                                             );
//                                           }).toList(),
//                                           onChanged: (String? newValue) {
//                                             contoller.selectedField.value =
//                                                 newValue!;
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             } else {
//                               return Container();
//                             }
//                           }),
//                           Obx(() {
//                             return ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: contoller.listForm.length,
//                               itemBuilder: (context, index) {
//                                 if (contoller.listForm[index].typeform ==
//                                     'TextField') {
//                                   return Container(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 200,
//                                           child: Text('หัวข้อ'),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 200,
//                                               height: 50,
//                                               child: TextFormField(
//                                                 controller: contoller
//                                                     .listForm[index]
//                                                     .textfield!
//                                                     .title,
//                                                 autofocus: false,
//                                                 decoration: InputDecoration(
//                                                   fillColor: colorWhite,
//                                                   hintText: "หัวข้อ",
//                                                   hintStyle: TextStyle(
//                                                       fontSize: 15.0,
//                                                       color: colorGrey,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   filled: true,
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       color: colorGrey,
//                                                       width: 2,
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             OutlinedButton.icon(
//                                               icon: const Icon(Icons.close,
//                                                   color: Colors.red),
//                                               label: const Text('ลบ',
//                                                   style: TextStyle(
//                                                       color: Colors.red)),
//                                               style: OutlinedButton.styleFrom(
//                                                 foregroundColor: Colors.red,
//                                                 side: const BorderSide(
//                                                     color: Colors.red),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                               ),
//                                               onPressed: () {
//                                                 contoller.listForm
//                                                     .removeAt(index);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(height: 20),
//                                         Container(
//                                           child: TextFormField(
//                                             enabled: false,
//                                             controller: contoller
//                                                 .listForm[index]
//                                                 .textfield!
//                                                 .listevent![
//                                             0],
//                                             autofocus: false,
//                                             decoration:
//                                             InputDecoration(
//                                               fillColor: colorWhite,
//                                               hintText:
//                                               "กล่องข้อความ",
//                                               hintStyle: TextStyle(
//                                                   fontSize: 15.0,
//                                                   color: colorGrey,
//                                                   fontWeight:
//                                                   FontWeight
//                                                       .w400),
//                                               filled: true,
//                                               border:
//                                               OutlineInputBorder(
//                                                 borderSide:
//                                                 BorderSide(
//                                                   color: colorGrey,
//                                                   width: 2,
//                                                 ),
//                                                 borderRadius:
//                                                 BorderRadius
//                                                     .circular(
//                                                     5),
//                                               ),
//                                             ),
//                                           ),
//                                           width: 200,
//                                           height: 50,
//                                         ),
//                                         // Obx(
//                                         //   () => ListView.builder(
//                                         //     shrinkWrap: true,
//                                         //     itemCount: contoller.listForm[index]
//                                         //         .textfield!.listevent!.length,
//                                         //     itemBuilder:
//                                         //         (context, indexEvenList) {
//                                         //       return Container(
//                                         //         margin: EdgeInsets.all(10),
//                                         //         width: 200,
//                                         //         height: 50,
//                                         //         child: Row(
//                                         //           children: [
//                                         //             SizedBox(
//                                         //               width: 15,
//                                         //             ),
//                                         //             Container(
//                                         //               child: TextFormField(
//                                         //                 controller: contoller
//                                         //                         .listForm[index]
//                                         //                         .textfield!
//                                         //                         .listevent![
//                                         //                     indexEvenList],
//                                         //                 autofocus: false,
//                                         //                 decoration:
//                                         //                     InputDecoration(
//                                         //                   fillColor: colorWhite,
//                                         //                   hintText:
//                                         //                       "กล่องข้อความ",
//                                         //                   hintStyle: TextStyle(
//                                         //                       fontSize: 15.0,
//                                         //                       color: colorGrey,
//                                         //                       fontWeight:
//                                         //                           FontWeight
//                                         //                               .w400),
//                                         //                   filled: true,
//                                         //                   border:
//                                         //                       OutlineInputBorder(
//                                         //                     borderSide:
//                                         //                         BorderSide(
//                                         //                       color: colorGrey,
//                                         //                       width: 2,
//                                         //                     ),
//                                         //                     borderRadius:
//                                         //                         BorderRadius
//                                         //                             .circular(
//                                         //                                 5),
//                                         //                   ),
//                                         //                 ),
//                                         //               ),
//                                         //               width: 200,
//                                         //               height: 50,
//                                         //             ),
//                                         //             // InkWell(
//                                         //             //   child: Container(
//                                         //             //     height: 50,
//                                         //             //     width: 50,
//                                         //             //     // color: Colors.red,
//                                         //             //     child: Icon(
//                                         //             //       Icons.close,
//                                         //             //       size: 20,
//                                         //             //     ),
//                                         //             //   ),
//                                         //             //   onTap: () {
//                                         //             //     contoller
//                                         //             //         .listForm[index]
//                                         //             //         .textfield!
//                                         //             //         .listevent!
//                                         //             //         .removeAt(
//                                         //             //             indexEvenList);
//                                         //             //   },
//                                         //             // )
//                                         //           ],
//                                         //         ),
//                                         //       );
//                                         //     },
//                                         //   ),
//                                         // ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         // Container(
//                                         //   padding: EdgeInsets.all(10),
//                                         //   child: OutlinedButton(
//                                         //     child: const Text('เพิ่มตัวเลือก',
//                                         //         style: TextStyle(
//                                         //             color: Colors.blue)),
//                                         //     style: OutlinedButton.styleFrom(
//                                         //       foregroundColor: Colors.blue,
//                                         //       side: const BorderSide(
//                                         //           color: Colors.grey),
//                                         //       shape: RoundedRectangleBorder(
//                                         //           borderRadius:
//                                         //               BorderRadius.circular(4)),
//                                         //     ),
//                                         //     onPressed: () {
//                                         //       contoller.listForm[index]
//                                         //           .textfield!.listevent!
//                                         //           .add(TextEditingController());
//                                         //     },
//                                         //   ),
//                                         // ),
//                                         Divider(
//                                           thickness: 2,
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 } else if (contoller.listForm[index].typeform ==
//                                     'Dropdown') {
//                                   return Container(
//                                     // color: Colors.amber,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 200,
//                                           child: Text('หัวข้อ'),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 200,
//                                               height: 50,
//                                               child: TextFormField(
//                                                 controller: contoller
//                                                     .listForm[index]
//                                                     .dropdown!
//                                                     .title,
//                                                 autofocus: false,
//                                                 decoration: InputDecoration(
//                                                   fillColor: colorWhite,
//                                                   hintText: "หัวข้อ",
//                                                   hintStyle: TextStyle(
//                                                       fontSize: 15.0,
//                                                       color: colorGrey,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   filled: true,
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       color: colorGrey,
//                                                       width: 2,
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             OutlinedButton.icon(
//                                               icon: const Icon(Icons.close,
//                                                   color: Colors.red),
//                                               label: const Text('ลบ',
//                                                   style: TextStyle(
//                                                       color: Colors.red)),
//                                               style: OutlinedButton.styleFrom(
//                                                 foregroundColor: Colors.red,
//                                                 side: const BorderSide(
//                                                     color: Colors.red),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                               ),
//                                               onPressed: () {
//                                                 contoller.listForm
//                                                     .removeAt(index);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         Obx(
//                                           () => ListView.builder(
//                                             shrinkWrap: true,
//                                             itemCount: contoller.listForm[index]
//                                                 .dropdown!.listevent!.length,
//                                             itemBuilder:
//                                                 (context, indexEvenList) {
//                                               return Container(
//                                                 margin: EdgeInsets.all(10),
//                                                 width: 200,
//                                                 height: 50,
//                                                 child: Row(
//                                                   children: [
//                                                     Text(
//                                                         '${indexEvenList + 1}.'),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Container(
//                                                       child: TextFormField(
//                                                         controller: contoller
//                                                                 .listForm[index]
//                                                                 .dropdown!
//                                                                 .listevent![
//                                                             indexEvenList],
//                                                         autofocus: false,
//                                                         decoration:
//                                                             InputDecoration(
//                                                           fillColor: colorWhite,
//                                                           hintText:
//                                                               "ตัวเลือก ${indexEvenList + 1}",
//                                                           hintStyle: TextStyle(
//                                                               fontSize: 15.0,
//                                                               color: colorGrey,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                           filled: true,
//                                                           border:
//                                                               OutlineInputBorder(
//                                                             borderSide:
//                                                                 BorderSide(
//                                                               color: colorGrey,
//                                                               width: 2,
//                                                             ),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       width: 200,
//                                                       height: 50,
//                                                     ),
//                                                     InkWell(
//                                                       child: Container(
//                                                         height: 50,
//                                                         width: 50,
//                                                         // color: Colors.red,
//                                                         child: Icon(
//                                                           Icons.close,
//                                                           size: 20,
//                                                         ),
//                                                       ),
//                                                       onTap: () {
//                                                         contoller
//                                                             .listForm[index]
//                                                             .dropdown!
//                                                             .listevent!
//                                                             .removeAt(
//                                                                 indexEvenList);
//                                                       },
//                                                     )
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.all(10),
//                                           child: OutlinedButton(
//                                             child: const Text('เพิ่มตัวเลือก',
//                                                 style: TextStyle(
//                                                     color: Colors.blue)),
//                                             style: OutlinedButton.styleFrom(
//                                               foregroundColor: Colors.blue,
//                                               side: const BorderSide(
//                                                   color: Colors.grey),
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(4)),
//                                             ),
//                                             onPressed: () {
//                                               contoller.listForm[index]
//                                                   .dropdown!.listevent!
//                                                   .add(TextEditingController());
//                                             },
//                                           ),
//                                         ),
//                                         Divider(
//                                           thickness: 2,
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 } else if (contoller.listForm[index].typeform ==
//                                     'Checkbox') {
//                                   return Container(
//                                     // color: Colors.amber,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 200,
//                                           child: Text('หัวข้อ'),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 200,
//                                               height: 50,
//                                               child: TextFormField(
//                                                 controller: contoller
//                                                     .listForm[index]
//                                                     .checkbox!
//                                                     .title,
//                                                 autofocus: false,
//                                                 decoration: InputDecoration(
//                                                   fillColor: colorWhite,
//                                                   hintText: "หัวข้อ",
//                                                   hintStyle: TextStyle(
//                                                       fontSize: 15.0,
//                                                       color: colorGrey,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   filled: true,
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       color: colorGrey,
//                                                       width: 2,
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             OutlinedButton.icon(
//                                               icon: const Icon(Icons.close,
//                                                   color: Colors.red),
//                                               label: const Text('ลบ',
//                                                   style: TextStyle(
//                                                       color: Colors.red)),
//                                               style: OutlinedButton.styleFrom(
//                                                 foregroundColor: Colors.red,
//                                                 side: const BorderSide(
//                                                     color: Colors.red),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                               ),
//                                               onPressed: () {
//                                                 contoller.listForm
//                                                     .removeAt(index);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         Obx(
//                                           () => ListView.builder(
//                                             shrinkWrap: true,
//                                             itemCount: contoller.listForm[index]
//                                                 .checkbox!.listevent!.length,
//                                             itemBuilder:
//                                                 (context, indexEvenList) {
//                                               return Container(
//                                                 margin: EdgeInsets.all(10),
//                                                 width: 200,
//                                                 height: 50,
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(
//                                                       Icons
//                                                           .check_box_outline_blank,
//                                                       color: Colors.grey,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Container(
//                                                       child: TextFormField(
//                                                         controller: contoller
//                                                                 .listForm[index]
//                                                                 .checkbox!
//                                                                 .listevent![
//                                                             indexEvenList],
//                                                         autofocus: false,
//                                                         decoration:
//                                                             InputDecoration(
//                                                           fillColor: colorWhite,
//                                                           hintText:
//                                                               "ตัวเลือก ${indexEvenList + 1}",
//                                                           hintStyle: TextStyle(
//                                                               fontSize: 15.0,
//                                                               color: colorGrey,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                           filled: true,
//                                                           border:
//                                                               OutlineInputBorder(
//                                                             borderSide:
//                                                                 BorderSide(
//                                                               color: colorGrey,
//                                                               width: 2,
//                                                             ),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       width: 200,
//                                                       height: 50,
//                                                     ),
//                                                     InkWell(
//                                                       child: Container(
//                                                         height: 50,
//                                                         width: 50,
//                                                         // color: Colors.red,
//                                                         child: Icon(
//                                                           Icons.close,
//                                                           size: 20,
//                                                         ),
//                                                       ),
//                                                       onTap: () {
//                                                         contoller
//                                                             .listForm[index]
//                                                             .checkbox!
//                                                             .listevent!
//                                                             .removeAt(
//                                                                 indexEvenList);
//                                                       },
//                                                     )
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.all(10),
//                                           child: OutlinedButton(
//                                             child: const Text('เพิ่มตัวเลือก',
//                                                 style: TextStyle(
//                                                     color: Colors.blue)),
//                                             style: OutlinedButton.styleFrom(
//                                               foregroundColor: Colors.blue,
//                                               side: const BorderSide(
//                                                   color: Colors.grey),
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(4)),
//                                             ),
//                                             onPressed: () {
//                                               contoller.listForm[index]
//                                                   .checkbox!.listevent!
//                                                   .add(TextEditingController());
//                                             },
//                                           ),
//                                         ),
//                                         Divider(
//                                           thickness: 2,
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 } else if (contoller.listForm[index].typeform ==
//                                     'Radio') {
//                                   return Container(
//                                     // color: Colors.amber,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 200,
//                                           child: Text('หัวข้อ'),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 200,
//                                               height: 50,
//                                               child: TextFormField(
//                                                 controller: contoller
//                                                     .listForm[index]
//                                                     .radio!
//                                                     .title,
//                                                 autofocus: false,
//                                                 decoration: InputDecoration(
//                                                   fillColor: colorWhite,
//                                                   hintText: "หัวข้อ",
//                                                   hintStyle: TextStyle(
//                                                       fontSize: 15.0,
//                                                       color: colorGrey,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   filled: true,
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       color: colorGrey,
//                                                       width: 2,
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             OutlinedButton.icon(
//                                               icon: const Icon(Icons.close,
//                                                   color: Colors.red),
//                                               label: const Text('ลบ',
//                                                   style: TextStyle(
//                                                       color: Colors.red)),
//                                               style: OutlinedButton.styleFrom(
//                                                 foregroundColor: Colors.red,
//                                                 side: const BorderSide(
//                                                     color: Colors.red),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                               ),
//                                               onPressed: () {
//                                                 contoller.listForm
//                                                     .removeAt(index);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         Obx(
//                                           () => ListView.builder(
//                                             shrinkWrap: true,
//                                             itemCount: contoller.listForm[index]
//                                                 .radio!.listevent!.length,
//                                             itemBuilder:
//                                                 (context, indexEvenList) {
//                                               return Container(
//                                                 margin: EdgeInsets.all(10),
//                                                 width: 200,
//                                                 height: 50,
//                                                 child: Row(
//                                                   children: [
//                                                     Icon(
//                                                       Icons
//                                                           .radio_button_unchecked, // Use Icons.radio_button_checked for checked state
//                                                       color: Colors.grey,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 10,
//                                                     ),
//                                                     Container(
//                                                       child: TextFormField(
//                                                         controller: contoller
//                                                                 .listForm[index]
//                                                                 .radio!
//                                                                 .listevent![
//                                                             indexEvenList],
//                                                         autofocus: false,
//                                                         decoration:
//                                                             InputDecoration(
//                                                           fillColor: colorWhite,
//                                                           hintText:
//                                                               "ตัวเลือก ${indexEvenList + 1}",
//                                                           hintStyle: TextStyle(
//                                                               fontSize: 15.0,
//                                                               color: colorGrey,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400),
//                                                           filled: true,
//                                                           border:
//                                                               OutlineInputBorder(
//                                                             borderSide:
//                                                                 BorderSide(
//                                                               color: colorGrey,
//                                                               width: 2,
//                                                             ),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       width: 200,
//                                                       height: 50,
//                                                     ),
//                                                     InkWell(
//                                                       child: Container(
//                                                         height: 50,
//                                                         width: 50,
//                                                         // color: Colors.red,
//                                                         child: Icon(
//                                                           Icons.close,
//                                                           size: 20,
//                                                         ),
//                                                       ),
//                                                       onTap: () {
//                                                         contoller
//                                                             .listForm[index]
//                                                             .radio!
//                                                             .listevent!
//                                                             .removeAt(
//                                                                 indexEvenList);
//                                                       },
//                                                     )
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Container(
//                                           padding: EdgeInsets.all(10),
//                                           child: OutlinedButton(
//                                             child: const Text('เพิ่มตัวเลือก',
//                                                 style: TextStyle(
//                                                     color: Colors.blue)),
//                                             style: OutlinedButton.styleFrom(
//                                               foregroundColor: Colors.blue,
//                                               side: const BorderSide(
//                                                   color: Colors.grey),
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(4)),
//                                             ),
//                                             onPressed: () {
//                                               contoller.listForm[index].radio!
//                                                   .listevent!
//                                                   .add(TextEditingController());
//                                             },
//                                           ),
//                                         ),
//                                         Divider(
//                                           thickness: 2,
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 } else if (contoller.listForm[index].typeform ==
//                                     'Image') {
//                                   return Container(
//                                     height: 175,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 200,
//                                           child: Text('หัวข้อ'),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 200,
//                                               height: 50,
//                                               child: TextFormField(
//                                                 controller: contoller
//                                                     .listForm[index]
//                                                     .image!
//                                                     .title,
//                                                 autofocus: false,
//                                                 decoration: InputDecoration(
//                                                   fillColor: colorWhite,
//                                                   hintText: "หัวข้อ",
//                                                   hintStyle: TextStyle(
//                                                       fontSize: 15.0,
//                                                       color: colorGrey,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   filled: true,
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       color: colorGrey,
//                                                       width: 2,
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             OutlinedButton.icon(
//                                               icon: const Icon(Icons.close,
//                                                   color: Colors.red),
//                                               label: const Text('ลบ',
//                                                   style: TextStyle(
//                                                       color: Colors.red)),
//                                               style: OutlinedButton.styleFrom(
//                                                 foregroundColor: Colors.red,
//                                                 side: const BorderSide(
//                                                     color: Colors.red),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                               ),
//                                               onPressed: () {
//                                                 contoller.listForm
//                                                     .removeAt(index);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         Container(
//                                           width: 200,
//                                           child: Text('เพิ่มรูป'),
//                                         ),
//                                         DottedBorder(
//                                             padding: const EdgeInsets.all(12),
//                                             color: Colors.grey,
//                                             child: Container(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 12, vertical: 4),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(4),
//                                               ),
//                                               child: Text(
//                                                 'เลือกรูป',
//                                                 style: textStyle(context,
//                                                     color: Colors.blue,
//                                                     fontSize: 15),
//                                               ),
//                                             )),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Divider(
//                                           thickness: 2,
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 } else if (contoller.listForm[index].typeform ==
//                                     'File') {
//                                   return Container(
//                                     height: 175,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 200,
//                                           child: Text('หัวข้อ'),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 200,
//                                               height: 50,
//                                               child: TextFormField(
//                                                 controller: contoller
//                                                     .listForm[index]
//                                                     .file!
//                                                     .title,
//                                                 autofocus: false,
//                                                 decoration: InputDecoration(
//                                                   fillColor: colorWhite,
//                                                   hintText: "หัวข้อ",
//                                                   hintStyle: TextStyle(
//                                                       fontSize: 15.0,
//                                                       color: colorGrey,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                   filled: true,
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       color: colorGrey,
//                                                       width: 2,
//                                                     ),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               width: 20,
//                                             ),
//                                             OutlinedButton.icon(
//                                               icon: const Icon(Icons.close,
//                                                   color: Colors.red),
//                                               label: const Text('ลบ',
//                                                   style: TextStyle(
//                                                       color: Colors.red)),
//                                               style: OutlinedButton.styleFrom(
//                                                 foregroundColor: Colors.red,
//                                                 side: const BorderSide(
//                                                     color: Colors.red),
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4)),
//                                               ),
//                                               onPressed: () {
//                                                 contoller.listForm
//                                                     .removeAt(index);
//                                               },
//                                             ),
//                                           ],
//                                         ),
//                                         Container(
//                                           width: 200,
//                                           child: Text('เพิ่มไฟล์'),
//                                         ),
//                                         DottedBorder(
//                                             padding: const EdgeInsets.all(12),
//                                             color: Colors.grey,
//                                             child: Container(
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 12, vertical: 4),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(4),
//                                               ),
//                                               child: Text(
//                                                 'เลือกไฟล์',
//                                                 style: textStyle(context,
//                                                     color: Colors.blue,
//                                                     fontSize: 15),
//                                               ),
//                                             )),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Divider(
//                                           thickness: 2,
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }
//                                 return SizedBox();
//                               },
//                             );
//                           }),
//                           // เพิ่มฟอร์ม
//                           Row(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: colorWhite,
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(color: Colors.brown[200]!),
//                                 ),
//                                 height: 40,
//                                 width: 120,
//                                 alignment: Alignment.centerLeft,
//                                 child: InkWell(
//                                   onTap: () {
//                                     contoller.showDropdown.value = true;
//                                     if (contoller.selectedField.value ==
//                                         'TextField') {
//                                       contoller.listForm.add(ListFormModel(
//                                           typeform: 'TextField',
//                                           textfield: Textfield(
//                                               listevent:
//                                                   [TextEditingController()].obs,
//                                               title: TextEditingController())));
//                                     }
//                                     if (contoller.selectedField.value ==
//                                         'Dropdown') {
//                                       contoller.listForm.add(ListFormModel(
//                                           typeform: 'Dropdown',
//                                           dropdown: MyDropdown(
//                                               listevent:
//                                                   [TextEditingController()].obs,
//                                               title: TextEditingController())));
//                                     }
//                                     if (contoller.selectedField.value ==
//                                         'Checkbox') {
//                                       contoller.listForm.add(ListFormModel(
//                                           typeform: 'Checkbox',
//                                           checkbox: MyCheckBox(
//                                               listevent:
//                                                   [TextEditingController()].obs,
//                                               title: TextEditingController())));
//                                     }
//                                     if (contoller.selectedField.value ==
//                                         'Radio') {
//                                       contoller.listForm.add(ListFormModel(
//                                           typeform: 'Radio',
//                                           radio: MyRadio(
//                                               listevent:
//                                                   [TextEditingController()].obs,
//                                               title: TextEditingController())));
//                                     }
//                                     if (contoller.selectedField.value ==
//                                         'Image') {
//                                       contoller.listForm.add(ListFormModel(
//                                           typeform: 'Image',
//                                           image: MyImg(
//                                               title: TextEditingController())));
//                                     }
//                                     if (contoller.selectedField.value ==
//                                         'File') {
//                                       contoller.listForm.add(ListFormModel(
//                                           typeform: 'File',
//                                           file: MyFile(
//                                               title: TextEditingController())));
//                                     }
//                                   },
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(Icons.edit_calendar_outlined,
//                                           color: colorBlack),
//                                       SizedBox(width: 5),
//                                       Text(
//                                         'เพิ่มฟอร์ม',
//                                         style: textStyle(context,
//                                             color: colorBlack, fontSize: 15),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container(
//                               height: 40,
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'พิกัด(บน Map)',
//                                 style: textStyle(context,
//                                     color: colorBlack, fontSize: 15),
//                               )),
//                           Stack(
//                             children: [
//                               Container(
//                                 color: Colors.blue,
//                                 height: 400,
//                                 child: Center(
//                                     child: FlutterMap(
//                                   mapController: contoller.mapController.value,
//                                   options: MapOptions(
//                                       initialCenter: LatLng(
//                                           double.parse(
//                                               contoller.lat.value.text),
//                                           double.parse(
//                                               contoller.lng.value.text)),
//                                       initialZoom: 14,
//                                       interactionOptions: InteractionOptions(
//                                         flags:
//                                             InteractiveFlag.doubleTapDragZoom |
//                                                 InteractiveFlag.drag,
//                                       ),
//                                       onPointerUp: (v,c)async{
//                                         // addressModel location =
//                                         // await getLatLong(long: contoller.lng.value.text, lat: contoller.lat.value.text,index: 2);
//                                         // contoller.address.value.text=location.address!;
//                                       },
//                                       onPositionChanged: (v, c) {
//                                         contoller.lat.value.text =
//                                             contoller.mapController.value.camera.center.latitude.toString();
//                                         contoller.lng.value.text = contoller.mapController.value.camera.center.longitude.toString();
//                                       }
//
//                                       // maxZoom: 17,
//                                       // minZoom: 10
//                                       ),
//                                   children: [
//                                     TileLayer(
//                                       urlTemplate:
//                                           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                                       userAgentPackageName: 'com.example.app',
//                                     ),
//                                   ],
//                                 )),
//                               ),
//                               Positioned(
//                                   top: 20,
//                                   left: 20,
//                                   child: Container(
//                                     height: 350,
//                                     width: 300,
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           height: 40,
//                                           color: colorWhite,
//                                           child: TextFormField(
//                                             controller: contoller.search.value,
//                                             autofocus: false,
//                                             onChanged: (value) {
//                                               // if (value.isNotEmpty) {
//                                               //   contoller.searchMap(value);
//                                               // }
//                                               if (value.isEmpty) {
//                                                 contoller.listSearchMap.clear();
//                                               }
//                                             },
//                                             decoration: InputDecoration(
//                                               suffixIcon: InkWell(
//                                                   onTap: () async {
//                                                     contoller.searchMap(
//                                                         contoller
//                                                             .search.value.text);
//                                                   },
//                                                   child: Icon(Icons.search)),
//                                               fillColor: colorWhite,
//                                               hintText: "ค้นหา",
//                                               hintStyle: TextStyle(
//                                                   fontSize: 15.0,
//                                                   color: colorGrey,
//                                                   fontWeight: FontWeight.w400),
//                                               filled: true,
//                                               border: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                   color: colorGrey,
//                                                   width: 2,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(5),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           height: 310,
//                                           child: ListView.builder(
//                                             itemCount: contoller
//                                                 .listSearchMap.value.length,
//                                             itemBuilder: (context, index) =>
//                                                 InkWell(
//                                               onTap: () {
//                                                 contoller.mapController.value.move(
//                                                     LatLng(
//                                                         double.parse(contoller
//                                                             .listSearchMap
//                                                             .value[index]
//                                                             .lat!),
//                                                         double.parse(contoller
//                                                             .listSearchMap
//                                                             .value[index]
//                                                             .lon!)),
//                                                     16);
//                                                 contoller.listSearchMap.clear();
//                                               },
//                                               child: Container(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 5,
//                                                     right: 5,
//                                                     top: 2,
//                                                     bottom: 2),
//                                                 height: 45,
//                                                 color: (index % 2 == 1)
//                                                     ? Colors.grey.shade300
//                                                     : Colors.white,
//                                                 child: Text(contoller
//                                                     .listSearchMap
//                                                     .value[index]
//                                                     .displayName
//                                                     .toString()),
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )),
//                               Container(
//                                 height: 400,
//                                 child: Center(
//                                   child: Container(
//                                     height: 60,
//                                     child: Column(
//                                       children: [
//                                         SizedBox(
//                                           height: 30,
//                                           child: Icon(
//                                             Icons.location_pin,
//                                             color: Colors.red,
//                                             size: 30,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 30,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             height: 180,
//                             child: Column(
//                               children: [
//                                 Row(children: [
//                                   Expanded(
//                                     flex: 5,
//                                     child: Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Text(
//                                           'ที่อยู่',
//                                           style: textStyle(context,
//                                               color: colorBlack, fontSize: 15),
//                                         )),
//                                   ),
//                                 ]),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Container(
//                                         padding: const EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           border:
//                                               Border.all(color: Colors.grey),
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: colorWhite,
//                                         ),
//                                         height: 150,
//                                         child: TextFormField(
//                                           enabled: false,
//                                           maxLines: 300,
//                                           controller: contoller.address.value,
//                                           decoration: InputDecoration.collapsed(
//                                             fillColor: colorWhite,
//                                             hintText: "ที่อยู่",
//                                             hintStyle: TextStyle(
//                                                 fontSize: 15.0,
//                                                 color: colorGrey,
//                                                 fontWeight: FontWeight.w400),
//                                             filled: true,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 60,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'ละติจูด',
//                                             style: textStyle(context,
//                                                 color: colorBlack,
//                                                 fontSize: 15),
//                                           )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'ลองจิจูด',
//                                             style: textStyle(context,
//                                                 color: colorBlack,
//                                                 fontSize: 15),
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                         height: 40,
//                                         color: colorWhite,
//                                         child: TextFormField(
//                                           controller: contoller.lat.value,
//                                           autofocus: false,
//                                           onChanged: (value) {
//                                             contoller.mapController.value.move(
//                                                 LatLng(
//                                                     double.parse(contoller
//                                                         .lat.value.text),
//                                                     double.parse(contoller
//                                                         .lng.value.text)),
//                                                 16);
//                                           },
//                                           decoration: InputDecoration(
//                                             fillColor: colorWhite,
//                                             hintText: "ละติจูด",
//                                             hintStyle: TextStyle(
//                                                 fontSize: 15.0,
//                                                 color: colorGrey,
//                                                 fontWeight: FontWeight.w400),
//                                             filled: true,
//                                             border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color: colorGrey,
//                                                 width: 2,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                         height: 40,
//                                         color: colorWhite,
//                                         child: TextFormField(
//                                           controller: contoller.lng.value,
//                                           onChanged: (value) {
//                                             contoller.mapController.value.move(
//                                                 LatLng(
//                                                     double.parse(contoller
//                                                         .lat.value.text),
//                                                     double.parse(contoller
//                                                         .lng.value.text)),
//                                                 16);
//                                           },
//                                           decoration: InputDecoration(
//                                             fillColor: colorWhite,
//                                             hintText: "ลองจิจูด",
//                                             hintStyle: TextStyle(
//                                                 fontSize: 15.0,
//                                                 color: colorGrey,
//                                                 fontWeight: FontWeight.w400),
//                                             filled: true,
//                                             border: OutlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color: colorGrey,
//                                                 width: 2,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Divider(
//                             height: 2,
//                             color: colorGrey,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             children: [
//                               const Spacer(),
//                               InkWell(
//                                 onTap: () async {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             'คำเตือน',
//                                             style: textStyle(context,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ],
//                                       ),
//                                       content: Text('คุณต้องการยกเลิกหรือไม่'),
//                                       actions: [
//                                         InkWell(
//                                             onTap: () {
//                                               Navigator.pop(context);
//                                             },
//                                             child: Text(
//                                               'ยกเลิก',
//                                               style: textStyle(context,
//                                                   fontSize: 15),
//                                             )),
//                                         InkWell(
//                                             onTap: () async {
//                                               await contoller.clearData();
//                                               Navigator.pop(context);
//                                             },
//                                             child: Text(
//                                               'ตกลง',
//                                               style: textStyle(context,
//                                                   fontSize: 15),
//                                             )),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 40,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: colorGrey),
//                                   child: Text(
//                                     'ยกเลิก',
//                                     style: textStyle(context,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: colorWhite),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               InkWell(
//                                 onTap: () async {
//                                   await contoller.submit(context);
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 40,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: colorAmber),
//                                   child: Text(
//                                     'บันทึก',
//                                     style: textStyle(context,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: colorWhite),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                             ],
//                           )
//                         ],
//                       ))),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
