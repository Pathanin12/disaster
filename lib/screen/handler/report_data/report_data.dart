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
// import '../../createlist/contollercreatelist.dart';
//
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class ReportData extends StatelessWidget {
//   ReportData({super.key});
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
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                     height: 20,
//                                     child: Text(
//                                         (contoller.dataEditEvent.value.events ==
//                                                 null)
//                                             ? 'ข้อมูลรายงาน'
//                                             : 'แก้ไขรายงาน',
//                                         style: textStyle(context,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold))),
//                               ),
//                               InkWell(
//                                 onTap: () async {
//                                   await contoller.submit(context);
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: colorAmber),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 4),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Icon(Icons.edit,
//                                             color: colorWhite), // ไอคอน 'edit'
//                                         SizedBox(width: 5),
//                                         Text(
//                                           'แก้ไขรายงาน',
//                                           style: textStyle(context,
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.bold,
//                                               color: colorWhite),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
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
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         'ไฟไหม้บ้านเรือนประชาชน',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
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
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'สถานะของรายการ',
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
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         '5 มิ.ย. 67',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         'กำลังดำเนินการ',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
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
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'สถานะหน่วยงาน',
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
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         'เทศบาลนครปากเกร็ด',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         'รับเรื่อง',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
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
//                                             'รายละเอียดเหตุการณ์ไฟไหม้',
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
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         'วันที่ 3 มิถุนายน 2567 เวลา 09.30 น. ได้รับแจ้งเหตุเพลิงไหม้ที่บ้าน คูเดื้อ ตำบลเกาะเกร็ด อำเภอ ปากเกร็ด จังหวัดนนทบุรี โดยเพลงไหม้ดังกล่าวำให้บ้านเรือนได้รับความเสียหายทั้งหลัง จำนวน 1 หลัง และเสียหายบางส่วน จำนวน 2 หลัง 1 วันที่ 3 มิถุนายน 2567 เวลา 09.30 น. ได้รับแจ้งเหตุเพลิงไหม้ที่บ้าน คูเดื้อ ตำบลเกาะเกร็ด อำเภอ ปากเกร็ด จังหวัดนนทบุรี โดยเพลงไหม้ดังกล่าวำให้บ้านเรือนได้รับความเสียหายทั้งหลัง จำนวน 1 หลัง และเสียหายบางส่วน จำนวน 2 หลัง 1',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             child: Row(
//                               children: [
//                                 const Expanded(
//                                     flex: 5,
//                                     child: Column(
//                                       children: [
//                                         Text('Hello1'),
//                                         Text('Hello2'),
//                                       ],
//                                     )),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 Expanded(
//                                   flex: 5,
//                                   child: Column(
//                                     children: [
//                                       SfCircularChart(
//                                         series: <PieSeries>[
//                                           PieSeries<DataNa, String>(
//                                             dataSource: testData,
//                                             xValueMapper: (DataNa data, _) =>
//                                                 data.xData,
//                                             yValueMapper: (DataNa data, _) =>
//                                                 data.yData,
//                                             dataLabelMapper: (DataNa data, _) =>
//                                                 '${data.yData}%',
//                                             dataLabelSettings:
//                                                 DataLabelSettings(
//                                                     isVisible: true),
//                                           )
//                                         ],
//                                       ),
//                                       SfCircularChart(
//                                         series: <PieSeries>[
//                                           PieSeries<DataNa, String>(
//                                             dataSource: testData,
//                                             xValueMapper: (DataNa data, _) =>
//                                                 data.xData,
//                                             yValueMapper: (DataNa data, _) =>
//                                                 data.yData,
//                                             dataLabelMapper: (DataNa data, _) =>
//                                                 '${data.yData}%',
//                                             dataLabelSettings:
//                                                 DataLabelSettings(
//                                                     isVisible: true),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             // height: 60,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'ความต้องการเร่งด่วน',
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
//                                         height: 100,
//                                         color: colorWhite,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             // height: 60,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           alignment: Alignment.centerLeft,
//                                           child: Text(
//                                             'ความต้องการเร่งด่วน',
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
//                                         height: 100,
//                                         color: colorWhite,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
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
//                                       onPositionChanged: (v, c) {
//                                         contoller.lat.value.text =
//                                             v.center!.latitude.toString();
//                                         contoller.lng.value.text =
//                                             v.center!.longitude.toString();
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
//                                             'ที่อยู่',
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
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         'บ้านคูเดื้อ ตำบลเกาะเกร็ด อำเภอปากเกร็ด จังหวัดนนทบุรี',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
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
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         '13.908722',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Expanded(
//                                       flex: 5,
//                                       child: Container(
//                                           // height: 40,
//                                           // color: colorWhite,
//                                           child: Text(
//                                         '101.133695',
//                                         style: textStyle(context,
//                                             color: colorGrey, fontSize: 15),
//                                       )),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                               height: 20,
//                               child: Text(
//                                   (contoller.dataEditEvent.value.events == null)
//                                       ? 'ข้อมูลรายงาน'
//                                       : 'แก้ไขรายงาน',
//                                   style: textStyle(context,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold))),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.white,
//                             height: 175,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                               height: 20,
//                               child: Text(
//                                   (contoller.dataEditEvent.value.events == null)
//                                       ? 'ภาพถ่ายจากทางบ้าน'
//                                       : 'แก้ไขรายงาน',
//                                   style: textStyle(context,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold))),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.white,
//                             height: 175,
//                           ),
//                         ],
//                       ))),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
