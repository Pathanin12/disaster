import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:latlong2/latlong.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:uuid/uuid.dart';

import '../../../stye/colors.dart';
import '../../../stye/font.dart';
import '../../api/apiservice/createevenapi.dart';
import '../../api/latlongapi.dart';
import '../../api/map/searchmap.dart';
import '../../model/createevenmodel.dart';
import '../../model/eventbyidmodel.dart' as edit;
import '../../model/searchmap.dart';

class ContollerCreateList extends GetxController {
  final keyForm = GlobalKey<FormState>();
  final mapController = MapController().obs;
  var dataEditEvent= edit.EventByIDModel().obs;
  String? imageFile;
  // var listImage = <Uint8List>[].obs;
  var listConvertImage = <edit.ImageList>[].obs;
  var listDeleteImage=<ImageDeleteList>[].obs;
  var date = DateTime.now().toString().split(" ")[0].obs;
  final nameCon = TextEditingController().obs,
      createBy = TextEditingController().obs,
      lat = TextEditingController().obs,
      lng = TextEditingController().obs,
      responsible = TextEditingController().obs,
      die = TextEditingController().obs,
      relevant = TextEditingController().obs,
      mandie = TextEditingController().obs,
      womenDie = TextEditingController().obs,
      unGenderDie = TextEditingController().obs,
      injured = TextEditingController().obs,
      manInjured = TextEditingController().obs,
      womenInjured = TextEditingController().obs,
      unGenderInjured = TextEditingController().obs,
      remark = TextEditingController().obs,
      search = TextEditingController().obs;
  var radio = 1.obs;

  var listSearchMap=<SearchMapModel>[].obs;
  final NumberPaginatorController controllerNumPage =
      NumberPaginatorController();

  editEvent(edit.EventByIDModel data)async{
  dataEditEvent.value=data;
  nameCon.value.text = data.events!.eventName??'';
  createBy.value.text = data.events!.receiveFrom??'';
  lat.value.text = data.events!.latitude!;
  unGenderDie.value.text=data.events!.deceased!.unidentify.toString()??'';
  lng.value.text = data.events!.longitude!;
  responsible.value.text = data.events!.responsibleAgency??'';
  die.value.text = data.events!.deceased!.total!.toString()??'';
  relevant.value.text = data.events!.relatedAgency??'';
  mandie.value.text = data.events!.deceased!.male.toString()??'';
  womenDie.value.text = data.events!.deceased!.feMale.toString()??'';
  injured.value.text = data.events!.injured!.total.toString()??'';
  manInjured.value.text = data.events!.injured!.male.toString()??'';
  womenInjured.value.text = data.events!.injured!.feMale.toString()??'';
  unGenderInjured.value.text = data.events!.injured!.unidentify.toString()??'';
  remark.value.text = data.events!.note??'';
  listConvertImage.value = data.events!.imageList!;
  radio.value = data.events!.violence??1;
  date.value = data.events!.datetime!;
  // listImage.value.clear();
  selectCategory!.value = category[data.events!.disasterType!];
  selectStatusList!.value = StatusList[data.events!.statusItem!];
  selectStatusResponsible!.value = StatusList[data.events!.statusRelatedAgency!];
  selectStatusrelevant!.value = StatusList[data.events!.statusAgency!];
  selectAgerangeDie!.value = AgerangeList[data.events!.deceased!.ageRange!];
  selectAgerange!.value = AgerangeList[data.events!.injured!.ageRange!];
  mapController.value.move(
      LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
  }

  clearData() async {
    nameCon.value.text = '';
    createBy.value.text = '';
    lat.value.text = "18.3170581";
    lng.value.text = "99.3986862";
    responsible.value.text = '';
    die.value.text = '';
    relevant.value.text = '';
    mandie.value.text = '';
    womenDie.value.text = '';
    unGenderDie.value.text = '';
    injured.value.text = '';
    manInjured.value.text = '';
    womenInjured.value.text = '';
    unGenderInjured.value.text = '';
    search.value.text='';
    remark.value.text = '';
    radio.value = 1;
    date.value = DateTime.now().toString().split(" ")[0];
    listDeleteImage.value.clear();
    // listImage.value.clear();
    listConvertImage.value.clear();
    selectCategory!.value = 'อัคคีภัย';
    selectStatusList!.value = 'รับเรื่อง';
    selectStatusResponsible!.value = 'รับเรื่อง';
    selectStatusrelevant!.value = 'รับเรื่อง';
    selectAgerangeDie!.value = '0-20';
    selectAgerange!.value = '0-20';
    mapController.value.move(
        LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
    dataEditEvent= edit.EventByIDModel().obs;
  }


  RxString? selectCategory = 'อัคคีภัย'.obs;
  List<String> category = [
    "อัคคีภัย",
    "อุทกภัย",
    "วาตภัย",
    "ไฟป่า",
  ];

  RxString? selectStatusList = 'รับเรื่อง'.obs;
  List<String> StatusList = [
    "รับเรื่อง",
    "กำลังดำเนินการ",
    "เสร็จสิ้น",
  ];

  RxString? selectStatusResponsible = 'รับเรื่อง'.obs;
  List<String> StatusResponsible = [
    "รับเรื่อง",
    "กำลังดำเนินการ",
    "เสร็จสิ้น",
  ];

  RxString? selectStatusrelevant = 'รับเรื่อง'.obs;
  List<String> Statusrelevant = [
    "รับเรื่อง",
    "กำลังดำเนินการ",
    "เสร็จสิ้น",
  ];

  RxString? selectAgerangeDie = '0-20'.obs;
  RxString? selectAgerange = '0-20'.obs;
  List<String> AgerangeList = [
    "0-20",
    "21-40",
    "41-60",
    "61 ขึ้นไป",
  ];

  searchMap(String data)async{
    listSearchMap.value=await searchMapApi(data);
  }

  Future<void> submit(BuildContext context) async {
    try {
      String uuid='';
      if(dataEditEvent.value.events!=null){
        uuid = dataEditEvent.value.events!.eventID!;
      }else{
        uuid = const Uuid().v4();
      }
      String location =
          await getLatLong(long: lng.value.text, lat: lat.value.text);
      List<ImageList> listImageBase64 = [];
      for (var element in listConvertImage) {
        if(element.imageName=='new'){
          listImageBase64.add(ImageList(image: element.pathImage));
        }

      }
      CreateEven even = CreateEven(
          eventID: uuid,
          isDelete: false,
          isActive: true,
          // createBy: createBy.value.text,
          datetime: date.value,
          eventName: nameCon.value.text,
          disasterType: category.indexOf(selectCategory.toString()),
          longitude: lng.value.text,
          latitude: lat.value.text,
          note: remark.value.text,
          province: location,
          violence: radio.value,
          relatedAgency: relevant.value.text,
          imageList: listImageBase64,
          imageDeleteList: listDeleteImage,
          receiveFrom: createBy.value.text,
          deceased: Deceased(
            ageRange: AgerangeList.indexOf(selectAgerangeDie!.value.toString()),
            total: int.parse(die.value.text),
            feMale: int.parse(womenDie.value.text),
            male: int.parse(mandie.value.text),
            unidentify: int.parse(unGenderDie.value.text),
          ),
          injured: Deceased(
            unidentify: int.parse(unGenderInjured.value.text),
            male: int.parse(manInjured.value.text),
            ageRange: AgerangeList.indexOf(selectAgerange!.value.toString()),
            feMale: int.parse(womenInjured.value.text),
            total: int.parse(injured.value.text),
          ),
          statusRelatedAgency:
              Statusrelevant.indexOf(selectStatusResponsible!.value),
          statusAgency:
              StatusResponsible.indexOf(selectStatusrelevant!.value),
          statusItem: StatusList.indexOf(selectStatusList!.value),
          responsibleAgency: responsible.value.text);
      await createEvenApi(even).then((value) {});
      await clearData();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'บันทึกสำเร็จ',
                style:
                    textStyle(context, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Icon(
            Icons.download_done,
            size: 40,
            color: Colors.green,
          ),
          actions: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Text(
              'ตกลง',
              style:
                  textStyle(context, fontSize: 14),
            )),
          ],
        ),
      );
    } catch (_) {}
  }

  late MapShapeSource mapSource = const MapShapeSource.asset(
    "assets/world_map.json",
    shapeDataField: "name",
  );

  selectedFileImage(BuildContext context) async {
    List<Uint8List> image = (await ImagePickerWeb.getMultiImagesAsBytes())!;
    image.forEach((element) {
      listConvertImage.add(edit.ImageList(
        imageName: 'new',
        pathImage:"data:image/png;base64,${base64Encode(element)}"
      ));
    });
  }

//   Future<void> pickImageFeed(ImageSource source, int index,
//       {required BuildContext context,
//         double? maxWidth,
//         double? maxHeight,
//         int? quality}) async {
//
//     try {
//       final XFile? image = await picker.pickImage(
//         source: source,
//         imageQuality: 25,
//         // maxHeight: 600.0,
//         // maxWidth: 600.0,
//       );
//       if (image != null) {
//         var tempImg = File(image.path).readAsBytesSync();
//           imageFile = base64Encode(tempImg);
//
//       }
//     } catch (_) {
//
//     }
//
// }

  @override
  void onInit() {
    super.onInit();
    lat.value.text = "18.3170581";
    lng.value.text = "99.3986862";
  }

  @override
  void dispose() {
    super.dispose();
    listConvertImage.clear();
  }
}
