// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'dart:html' as html;
//
// import 'package:disaster/api/apiservice/createventfreeformapi.dart';
// import 'package:disaster/screen/createlist/contollercreatelist.dart';
// import 'package:disaster/service/config.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:number_paginator/number_paginator.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../../../stye/colors.dart';
// import '../../../../stye/font.dart';
// import '../../../api/latlongapi.dart';
// import '../../../api/map/searchmap.dart';
// import '../../../model/searchmap.dart';
// import '../../model/freeformbyidmodel.dart' as edit;
// import '../../model/updatafreeformmodel.dart';
//
// class ContollerEditOthersList extends GetxController {
//   var listConvertImageLog = <edit.ImageList>[].obs;
//   var showDropdown = false.obs;
//   var selectedField = ''.obs;
//   // var listForm = <ListFormModel>[].obs;
//   var listConvertFileLog = <edit.ImageList>[].obs;
//   var listAnswer = <ListAnswerModel>[].obs;
//
//   final keyForm = GlobalKey<FormState>();
//   final mapController = MapController().obs;
//   var dataEditEvent = edit.EventAllFreeFormByIDModel().obs;
//   addressModel locationAddress = addressModel();
//
//   var date = DateTime.now().toString().split(" ")[0].obs;
//   final nameCon = TextEditingController().obs,
//       createBy = TextEditingController().obs,
//       lat = TextEditingController().obs,
//       address = TextEditingController().obs,
//       remarkReport = TextEditingController().obs,
//       lng = TextEditingController().obs,
//       responsible = TextEditingController().obs,
//       die = TextEditingController().obs,
//       relevant = TextEditingController().obs,
//       mandie = TextEditingController().obs,
//       womenDie = TextEditingController().obs,
//       unGenderDie = TextEditingController().obs,
//       injured = TextEditingController().obs,
//       manInjured = TextEditingController().obs,
//       womenInjured = TextEditingController().obs,
//       unGenderInjured = TextEditingController().obs,
//       remark = TextEditingController().obs,
//       search = TextEditingController().obs;
//   var radio = 1.obs;
//   var listSearchMap = <SearchMapModel>[].obs;
//   final NumberPaginatorController controllerNumPage =
//       NumberPaginatorController();
//
//   final listGender = ["ไม่ระบุ", "ชาย", "หญิง"];
//
//   editEvent(edit.EventAllFreeFormByIDModel data) async {
//     await clearData();
//     dataEditEvent.value = data;
//     nameCon.value.text = data.events!.eventName ?? '';
//     lat.value.text = data.events!.latitude!;
//     lng.value.text = data.events!.longitude!;
//     responsible.value.text = data.events!.responsibleAgency ?? '';
//     date.value = data.events!.datetime!;
//     selectStatusList!.value = StatusList[data.events!.statusItem!];
//     selectStatusResponsible!.value = StatusList[data.events!.statusAgency!];
//     address.value.text = data.events!.address.toString() ?? '';
//     mapController.value.move(
//         LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
//     for (var element in data.events!.freeFormDetailList!) {
//       if (element.types == 0) {
//         listAnswer.add(ListAnswerModel(
//           dropdown: Dropdown(
//             listoption: element.freeFormSubDetailList!
//                 .map((e) => e.optionName ?? '')
//                 .toList(),
//             listoptionID:
//                 element.freeFormSubDetailList!.map((e) => e.id ?? '').toList(),
//           ),
//         ));
//       } else if (element.types == 1) {
//         List<bool> list=[];
//         for (var element in element.freeFormSubDetailList!) {
//           list.add(false);
//         }
//         listAnswer.add(ListAnswerModel(
//             checkbox: Checkbox(
//           listoption:
//               element.freeFormSubDetailList!.map((e) => e.optionName ?? '').toList(),
//               listoptionID:
//               element.freeFormSubDetailList!.map((e) => e.id ?? '').toList(),
//               valueID: [],
//               value: [],
//               listvalueoption:list,
//         )));
//       } else if (element.types == 2) {
//         listAnswer.add(ListAnswerModel(
//           radio:  Dropdown(
//             listoption: element.freeFormSubDetailList!
//                 .map((e) => e.optionName ?? '')
//                 .toList(),
//             listoptionID:
//             element.freeFormSubDetailList!.map((e) => e.id ?? '').toList(),
//           ),
//         ));
//       } else if (element.types == 3) {
//         listAnswer.add(ListAnswerModel(textfield: Textfield(value:TextEditingController())));
//       } else if (element.types == 4) {
//         listAnswer.add(ListAnswerModel(image: Image(value: "")));
//       } else if (element.types == 5) {
//         listAnswer.add(ListAnswerModel(file: Image(value: "")));
//       }
//     }
//   }
//
//   clearData() async {
//     nameCon.value.text = '';
//     createBy.value.text = '';
//     lat.value.text = "18.3170581";
//     lng.value.text = "99.3986862";
//     responsible.value.text = '';
//     listAnswer.clear();
//     die.value.text = '';
//     relevant.value.text = '';
//     // listForm.clear();
//     mandie.value.text = '';
//     womenDie.value.text = '';
//     unGenderDie.value.text = '';
//     injured.value.text = '';
//     manInjured.value.text = '';
//     womenInjured.value.text = '';
//     unGenderInjured.value.text = '';
//     search.value.text = '';
//     locationAddress = addressModel();
//     remark.value.text = '';
//     radio.value = 1;
//     date.value = DateTime.now().toString().split(" ")[0];
//     remarkReport.value.text = '';
//     // listImage.value.clear();
//     selectCategory!.value = 'อัคคีภัย';
//     selectStatusList!.value = 'รับเรื่อง';
//     selectStatusResponsible!.value = 'รับเรื่อง';
//     listConvertImageLog.clear();
//     listConvertFileLog.clear();
//     address.value.text = '';
//     mapController.value.move(
//         LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
//     dataEditEvent = edit.EventAllFreeFormByIDModel().obs;
//     listSearchMap.clear();
//   }
//
//   RxString? selectCategory = 'อัคคีภัย'.obs;
//   List<String> category = [
//     "อัคคีภัย",
//     "อุทกภัย",
//     "วาตภัย",
//     "ไฟป่า",
//   ];
//
//   RxString? selectStatusList = 'รับเรื่อง'.obs;
//   List<String> StatusList = [
//     "รับเรื่อง",
//     "กำลังดำเนินการ",
//     "เสร็จสิ้น",
//   ];
//
//   RxString? selectStatusResponsible = 'รับเรื่อง'.obs;
//   List<String> StatusResponsible = [
//     "รับเรื่อง",
//     "กำลังดำเนินการ",
//     "เสร็จสิ้น",
//   ];
//
//   searchMap(String data) async {
//     listSearchMap.value = await searchMapApi(data);
//   }
//   selectedImage(BuildContext context,int index) async {
//
//       List<Uint8List> image = (await ImagePickerWeb.getMultiImagesAsBytes())!;
//       image.forEach((element) {
//         listConvertImageLog.add(edit.ImageList(
//             imageName: 'new',
//             pathImage:"data:image/png;base64,${base64Encode(element)}"
//         ));
//       });
//
//
//   }
//   selectedFile(BuildContext context) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'xlsx', 'doc','docx'],
//     );
//     if (result != null) {
//       Uint8List fileBytes = result.files.first.bytes!;
//       String fileName = result.files.first.name;
//
//       if(result.files.first.extension=='pdf'){
//         listConvertFileLog.add(edit.ImageList(
//             imageName: fileName,
//             pathImage:"data:application/pdf;base64,${base64Encode(fileBytes)}"
//         )
//         );
//       }else if(result.files.first.extension=='xlsx'){
//         listConvertFileLog.add(edit.ImageList(
//             imageName: fileName,
//             pathImage:"data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${base64Encode(fileBytes)}"
//         )
//         );
//       }else if(result.files.first.extension=='docx'){
//         listConvertFileLog.add(edit.ImageList(
//             imageName: fileName,
//             pathImage:"data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,${base64Encode(fileBytes)}"
//         )
//         );
//       }else if(result.files.first.extension=='doc'){
//         listConvertFileLog.add(edit.ImageList(
//             imageName: fileName,
//             pathImage:"data:application/msword;base64,${base64Encode(fileBytes)}"
//         )
//         );
//       }
//     }
//
//
//   }
//   Future<void> submit(BuildContext context) async {
//     try {
//       String uuid='';
//       addressModel location =
//       await getLatLong(long: lng.value.text, lat: lat.value.text,index: 1);
//       List<ImageList> listImageBase64Log=[];
//       List<FileList> listFileBase64=[];
//       for (var element in listConvertImageLog) {
//         listImageBase64Log.add(ImageList(image: element.pathImage));
//       }
//       for (var element in listConvertFileLog) {
//         listFileBase64.add(FileList(file: element.pathImage,fileName: element.imageName));
//       }
//       UpdateBy? dataUpdate;
//       if(dataEditEvent.value.events!=null){
//         uuid = dataEditEvent.value.events!.eventID!;
//         List<LogList>? listLog=[];
//
//         if(nameCon.value.text.trim() !=dataEditEvent.value.events!.eventName){
//           listLog.add(LogList(header: 'ชื่อรายงาน',
//               description: nameCon.value.text.trim()));
//         }
//         if(date.value !=dataEditEvent.value.events!.datetime){
//           listLog.add(LogList(header: 'วันที่รับเรื่อง',
//               description: date.value));
//         }
//         if(StatusList.indexOf(selectStatusList!.value)!= dataEditEvent.value.events!.statusItem){
//           listLog.add(LogList(header: 'สถานะรายงาน',
//               description: selectStatusList!.value));
//         }
//         if(lat.value.text.trim()!=dataEditEvent.value.events!.latitude||lng.value.text.trim()!=dataEditEvent.value.events!.longitude){
//           listLog.add(LogList(header: 'แก้ไขจุดพิกัด',
//               description:'${lat.value.text.trim()},${lng.value.text.trim()}'));
//         }
//         if(address.value.text.trim()!=dataEditEvent.value.events!.address){
//           listLog.add(LogList(header: 'แก้ไขที่อยู่',
//               description:address.value.text.trim()));
//         }
//
//         print("<><><><><><><><><><><>tet");
//         dataUpdate= UpdateBy(
//             name: (dataUser==null)?"":dataUser!.profile!.name??'Unhnow',
//             datetime: DateTime.now().toString(),
//             staffID: (dataUser==null)?"":dataUser!.profile!.code??'123',
//             userName: (dataUser==null)?"":dataUser!.profile!.username??'test@test.com',
//             imageList: listImageBase64Log,
//             logList: listLog,
//             fileList: listFileBase64,
//             reportDetail: remarkReport.value.text.trim()
//         );
//         print("<><><><><><><><><><><>${dataUpdate.toJson()}");
//       }else{
//         uuid = const Uuid().v4();
//       }
//       List<FreeFormAnswerList> listAnswerDetail=[];
//       for(int i=0;i<dataEditEvent.value.events!.freeFormDetailList!.length;i++){
//
//         if(dataEditEvent.value.events!.freeFormDetailList![i].types==0){
//           listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: "",freeFormAnswerDetailList:[FreeFormAnswerDetailList(id: listAnswer[i].dropdown!.valueID)]));
//         }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==1){
//           List<FreeFormAnswerDetailList> list =[];
//           listAnswer[i].checkbox!.valueID!.forEach((element) {
//             list.add(FreeFormAnswerDetailList(id: element));
//           });
//           listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: "", freeFormAnswerDetailList:list));
//         }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==2){
//           listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: "",freeFormAnswerDetailList:[FreeFormAnswerDetailList(id: listAnswer[i].radio!.valueID)]));
//         }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==3){
//           listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: listAnswer[i].textfield!.value!.text.trim(),freeFormAnswerDetailList:[]));
//         }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==4){
//           listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,fileName: "",image: listAnswer[i].image!.value,file: "",answer: "",freeFormAnswerDetailList:[]));
//         }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==5){
//           listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",fileName: listAnswer[i].file!.name,file: listAnswer[i].file!.value,answer: "",freeFormAnswerDetailList:[]));
//         }
//
//       }
//
//       UpdateEventFreeForm even = UpdateEventFreeForm(
//           eventID: uuid,
//           // createBy: createBy.value.text,
//           datetime: date.value,
//           eventName: nameCon.value.text.trim(),
//           longitude: lng.value.text.trim(),
//           statusAgency: StatusList.indexOf(selectStatusResponsible!.value),
//           latitude: lat.value.text.trim(),
//           province: location.province,
//           address: address.value.text.trim(),
//           updateBy:dataUpdate,
//           freeFormAnswerList:listAnswerDetail,
//           amphure: location.amphure,
//           tambon: location.tambon,
//           zipCode: location.zipCode,
//           createBy: (dataEditEvent.value.events!=null)?null:(dataUser==null)?'':dataUser!.profile!.name,
//           statusItem: StatusList.indexOf(selectStatusList!.value),
//           responsibleAgency: responsible.value.text.trim());
//       await UpdateEventFreeFrom(even).then((value) {});
//       await clearData();
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'บันทึกสำเร็จ',
//                 style:
//                 textStyle(context, fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           content: Icon(
//             Icons.download_done,
//             size: 40,
//             color: Colors.green,
//           ),
//           actions: [
//             InkWell(
//                 onTap: (){
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   'ตกลง',
//                   style:
//                   textStyle(context, fontSize: 15),
//                 )),
//           ],
//         ),
//       );
//     } catch (e) {
//       print('ERROR UPDATE => $e');
//     }
//   }
//
//   // Future<void> submit(BuildContext context) async {
//   //   try {
//   //     String uuid = '';
//   //     if (dataEditEvent.value.events != null) {
//   //       uuid = dataEditEvent.value.events!.eventID!;
//   //     } else {
//   //       uuid = const Uuid().v4();
//   //     }
//   //     List<FreeFormDetailList> detailLists = [];
//   //     addressModel location =
//   //         await getLatLong(long: lng.value.text, lat: lat.value.text);
//   //
//   //     CreateEventFreeForm eventFreeForm = CreateEventFreeForm(
//   //       eventID: uuid,
//   //       eventName: nameCon.value.text,
//   //       statusAgency: StatusResponsible.indexOf(selectStatusResponsible!.value),
//   //       statusItem: StatusList.indexOf(selectStatusList!.value),
//   //       datetime: date.value,
//   //       responsibleAgency: responsible.value.text,
//   //       latitude: lat.value.text,
//   //       longitude: lng.value.text,
//   //       address: address.value.text,
//   //       tambon: location.tambon,
//   //       amphure: location.amphure,
//   //       province: location.province,
//   //       zipCode: location.zipCode,
//   //       createBy: createBy.value.text,
//   //       freeFormDetailList: detailLists,
//   //     );
//   //
//   //     await creatOrUpdateEventFreeFrom(eventFreeForm).then((value) {});
//   //     await clearData();
//   //
//   //     // await createEvenApi(even).then((value) {});
//   //     // await clearData();
//   //     showDialog(
//   //       context: context,
//   //       builder: (context) => AlertDialog(
//   //         title: Row(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             Text(
//   //               'บันทึกสำเร็จ',
//   //               style: textStyle(context,
//   //                   fontSize: 18, fontWeight: FontWeight.bold),
//   //             ),
//   //           ],
//   //         ),
//   //         content: Icon(
//   //           Icons.download_done,
//   //           size: 40,
//   //           color: Colors.green,
//   //         ),
//   //         actions: [
//   //           InkWell(
//   //               onTap: () {
//   //                 Navigator.pop(context);
//   //               },
//   //               child: Text(
//   //                 'ตกลง',
//   //                 style: textStyle(context, fontSize: 15),
//   //               )),
//   //         ],
//   //       ),
//   //     );
//   //   } catch (_) {}
//   // }
//
//   late MapShapeSource mapSource = const MapShapeSource.asset(
//     "assets/world_map.json",
//     shapeDataField: "name",
//   );
//
//   selectedFileImage(BuildContext context) async {
//     List<Uint8List> image = (await ImagePickerWeb.getMultiImagesAsBytes())!;
//     image.forEach((element) {
//       // listConvertImage.add(ImageList(
//       //     imageName: 'new',
//       //     pathImage: "data:image/png;base64,${base64Encode(element)}"));
//     });
//   }  selectedFileSingle(BuildContext context,{required int type,required int index}) async {
//     if(type==4){
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['png', 'jpg', 'jpeg'],
//       );
//       if (result != null) {
//         Uint8List fileBytes = result.files.first.bytes!;
//         String fileName = result.files.first.name;
//         listAnswer[index].image!.value="data:image/png;base64,${base64Encode(fileBytes)}";
//
//       }
//
//     }else if(type==5){
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'xlsx', 'doc','docx'],
//       );
//       if (result != null) {
//         Uint8List fileBytes = result.files.first.bytes!;
//         String fileName = result.files.first.name;
//         listAnswer[index].file!.name=fileName;
//         if(result.files.first.extension=='pdf'){
//           listAnswer[index].file!.value="data:application/pdf;base64,${base64Encode(fileBytes)}";
//
//         }else if(result.files.first.extension=='xlsx'){
//           listAnswer[index].file!.value="data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${base64Encode(fileBytes)}";
//
//         }else if(result.files.first.extension=='docx'){
//           listAnswer[index].file!.value="data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,${base64Encode(fileBytes)}";
//
//         }else if(result.files.first.extension=='doc'){
//           listAnswer[index].file!.value="data:application/msword;base64,${base64Encode(fileBytes)}";
//
//         }
//       }
//
//     }
//
//   }
//
// //   Future<void> pickImageFeed(ImageSource source, int index,
// //       {required BuildContext context,
// //         double? maxWidth,
// //         double? maxHeight,
// //         int? quality}) async {
// //
// //     try {
// //       final XFile? image = await picker.pickImage(
// //         source: source,
// //         imageQuality: 25,
// //         // maxHeight: 600.0,
// //         // maxWidth: 600.0,
// //       );
// //       if (image != null) {
// //         var tempImg = File(image.path).readAsBytesSync();
// //           imageFile = base64Encode(tempImg);
// //
// //       }
// //     } catch (_) {
// //
// //     }
// //
// // }
//
//   @override
//   void onInit() {
//     super.onInit();
//     lat.value.text = "18.3170581";
//     lng.value.text = "99.3986862";
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
//
// // class ListAnswer {
// //   Rx<String?>? type;
// //   RxString? id;
// //   Rx? title;
// //   RxList<Listoption>? listoption;
// //   RxList<Listoption>? selectvaluelist;
// //   Rx<Listoption>? selectoption;
// //   RxString? value;
// //
// //   ListAnswer({this.type, this.listoption, this.selectvaluelist, this.value});
// //
// //   ListAnswer.fromJson(Map<String, dynamic> json) {
// //     type = json['type'].obs;
// //     id = json['id'].obs;
// //     title = json['title'].obs;
// //     selectoption = json['selectoption'] != null
// //         ? new Listoption.fromJson(json['selectoption']).obs
// //         : null;
// //     if (json['listoption'] != null) {
// //       listoption = <Listoption>[].obs;
// //       json['listoption'].forEach((v) {
// //         listoption!.add(new Listoption.fromJson(v));
// //       });
// //     }
// //     if (json['selectvaluelist'] != null) {
// //       selectvaluelist = <Listoption>[].obs;
// //       json['selectvaluelist'].forEach((v) {
// //         selectvaluelist!.add(new Listoption.fromJson(v));
// //       });
// //     }
// //     value = json['value'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['type'] = this.type;
// //     if (this.listoption != null) {
// //       data['listoption'] = this.listoption!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.selectvaluelist != null) {
// //       data['selectvaluelist'] =
// //           this.selectvaluelist!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.selectoption != null) {
// //       data['selectoption'] = this.selectoption!.toJson();
// //     }
// //     data['value'] = this.value;
// //     data['title'] = this.title;
// //     data['id'] = this.id;
// //     return data;
// //   }
// // }
//
// // class Listoption {
// //   Rx<String?>? id;
// //   Rx<String?>? name;
// //
// //   Listoption({this.id, this.name});
// //
// //   Listoption.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     return data;
// //   }
// // }
//
// class ListAnswerModel {
//   Dropdown? dropdown;
//   Checkbox? checkbox;
//   Dropdown? radio;
//   Textfield? textfield;
//   Image? image;
//   Image? file;
//
//   ListAnswerModel(
//       {this.dropdown,
//       this.checkbox,
//       this.radio,
//       this.textfield,
//       this.image,
//       this.file});
//
//   ListAnswerModel.fromJson(Map<String, dynamic> json) {
//     dropdown = json['dropdown'] != null
//         ? new Dropdown.fromJson(json['dropdown'])
//         : null;
//     checkbox = json['checkbox'] != null
//         ? new Checkbox.fromJson(json['checkbox'])
//         : null;
//     radio = json['radio'] != null ? new Dropdown.fromJson(json['radio']) : null;
//     textfield = json['textfield'] != null
//         ? new Textfield.fromJson(json['textfield'])
//         : null;
//     image = json['image'] != null ? new Image.fromJson(json['image']) : null;
//     file = json['file'] != null ? new Image.fromJson(json['file']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dropdown != null) {
//       data['dropdown'] = this.dropdown!.toJson();
//     }
//     if (this.checkbox != null) {
//       data['checkbox'] = this.checkbox!.toJson();
//     }
//     if (this.radio != null) {
//       data['radio'] = this.radio!.toJson();
//     }
//     if (this.textfield != null) {
//       data['textfield'] = this.textfield!.toJson();
//     }
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     if (this.file != null) {
//       data['file'] = this.file!.toJson();
//     }
//     return data;
//   }
// }
//
// class Dropdown {
//   List<String>? listoption;
//   List<String>? listoptionID;
//   String? value;
//   String? valueID;
//
//   Dropdown({this.listoption, this.listoptionID, this.value, this.valueID});
//
//   Dropdown.fromJson(Map<String, dynamic> json) {
//     listoption = json['listoption'].cast<String>();
//     listoptionID = json['listoptionID'].cast<String>();
//     value = json['value'];
//     valueID = json['valueID'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['listoption'] = this.listoption;
//     data['listoptionID'] = this.listoptionID;
//     data['value'] = this.value;
//     data['valueID'] = this.valueID;
//     return data;
//   }
// }
//
// class Checkbox {
//   List<String>? listoption;
//   List<bool>? listvalueoption;
//   List<String>? listoptionID;
//   List<String>? value;
//   List<String>? valueID;
//
//   Checkbox(
//       {this.listoption,
//       this.listvalueoption,
//       this.listoptionID,
//       this.value,
//       this.valueID});
//
//   Checkbox.fromJson(Map<String, dynamic> json) {
//     listoption = json['listoption'].cast<String>();
//     listvalueoption = json['listvalueoption'].cast<bool>();
//     listoptionID = json['listoptionID'].cast<String>();
//     value = json['value'].cast<String>();
//     valueID = json['valueID'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['listoption'] = this.listoption;
//     data['listvalueoption'] = this.listvalueoption;
//     data['listoptionID'] = this.listoptionID;
//     data['value'] = this.value;
//     data['valueID'] = this.valueID;
//     return data;
//   }
// }
//
// class Textfield {
//   TextEditingController? value;
//
//   Textfield({this.value});
//
//   Textfield.fromJson(Map<String, dynamic> json) {
//     value = json['value'].cast<TextEditingController>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     return data;
//   }
// }
//
// class Image {
//   String? value;
//   String? name;
//
//   Image({this.value,this.name});
//
//   Image.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['name'] = this.name;
//     return data;
//   }
// }
