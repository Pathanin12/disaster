import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:disaster/api/apiservice/createventfreeformapi.dart';
import 'package:disaster/model/createeventfreeform.dart';
import 'package:disaster/screen/createlist/contollercreatelist.dart';
import 'package:disaster/service/config.dart';
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

import '../../../../stye/colors.dart';
import '../../../../stye/font.dart';
import '../../../api/apiservice/createevenapi.dart';
import '../../../api/latlongapi.dart';
import '../../../api/map/searchmap.dart';
import '../../../model/createevenmodel.dart';
import '../../../model/eventbyidmodel.dart' as edit;
import '../../../model/searchmap.dart';

class DataNa {
  DataNa(this.xData, this.yData);

  final String xData;
  final int yData;
}

List<DataNa> testData = [
  DataNa('Category 1', 25),
  DataNa('Category 2', 35),
  DataNa('Category 3', 40),
];

class ContollerCreateOthersList extends GetxController {
  var showDropdown = false.obs;
  var selectedField = ''.obs;
  var listForm = <ListFormModel>[].obs;

  final keyForm = GlobalKey<FormState>();
  final mapController = MapController().obs;
  var dataEditEvent = edit.EventByIDModel().obs;
  addressModel locationAddress = addressModel();

  var listStringNameDeleteDie = <String>[].obs;
  var listStringNameDeleteInjured = <String>[].obs;
  var listDataIDUserDie = <String>[].obs;
  var listDataIDUserInjured = <String>[].obs;
  var listDataDeleteIDUserInjured = <RemoveDeceasedList>[].obs;
  var listDataDeleteIDUserDie = <RemoveDeceasedList>[].obs;
  // String? imageFile;

  var listTextNameDie = <TextEditingController>[].obs;
  var listTextAgeDie = <TextEditingController>[].obs;
  var listGenderDie = <RxString>[].obs;

  var listTextNameInjured = <TextEditingController>[].obs;
  var listTextAgeInjured = <TextEditingController>[].obs;
  var listGenderInjured = <RxString>[].obs;

  // var listImage = <Uint8List>[].obs;
  var listConvertImage = <edit.ImageList>[].obs;
  var listConvertImageLog = <edit.ImageList>[].obs;
  var listConvertFileLog = <edit.ImageList>[].obs;
  var listDeleteImage = <ImageDeleteList>[].obs;
  var date = DateTime.now().toString().split(" ")[0].obs;
  final nameCon = TextEditingController().obs,
      createBy = TextEditingController().obs,
      lat = TextEditingController().obs,
      address = TextEditingController().obs,
      remarkReport = TextEditingController().obs,
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
  var listSearchMap = <SearchMapModel>[].obs;
  final NumberPaginatorController controllerNumPage =
      NumberPaginatorController();

  final listGender = ["ไม่ระบุ", "ชาย", "หญิง"];

  editEvent(edit.EventByIDModel data) async {
    await clearData();
    dataEditEvent.value = data;
    nameCon.value.text = data.events!.eventName ?? '';
    createBy.value.text = data.events!.receiveFrom ?? '';
    lat.value.text = data.events!.latitude!;
    unGenderDie.value.text = data.events!.deceased!.unidentify.toString() ?? '';
    lng.value.text = data.events!.longitude!;
    responsible.value.text = data.events!.responsibleAgency ?? '';
    die.value.text = data.events!.deceased!.total!.toString() ?? '';
    relevant.value.text = data.events!.relatedAgency ?? '';
    mandie.value.text = data.events!.deceased!.male.toString() ?? '';
    womenDie.value.text = data.events!.deceased!.feMale.toString() ?? '';
    injured.value.text = data.events!.injured!.total.toString() ?? '';
    manInjured.value.text = data.events!.injured!.male.toString() ?? '';
    womenInjured.value.text = data.events!.injured!.feMale.toString() ?? '';
    unGenderInjured.value.text =
        data.events!.injured!.unidentify.toString() ?? '';
    remark.value.text = data.events!.note ?? '';
    if (isAdmin) listConvertImage.value = data.events!.imageList!;
    radio.value = data.events!.violence ?? 1;
    date.value = data.events!.datetime!;
    // listImage.value.clear();
    selectCategory!.value = category[data.events!.disasterType!];
    selectStatusList!.value = StatusList[data.events!.statusItem!];
    selectStatusResponsible!.value = StatusList[data.events!.statusAgency!];
    selectStatusrelevant!.value = StatusList[data.events!.statusRelatedAgency!];
    address.value.text = data.events!.address.toString() ?? '';
    mapController.value.move(
        LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
    for (int i = 0; i < data.events!.deceased!.deceaseList!.length; i++) {
      listGenderDie
          .add(listGender[data.events!.deceased!.deceaseList![i].sex!].obs);
      listTextAgeDie.add(TextEditingController(
          text: data.events!.deceased!.deceaseList![i].age.toString()));
      listTextNameDie.add(TextEditingController(
          text: data.events!.deceased!.deceaseList![i].name.toString()));
      listDataIDUserDie.add(data.events!.deceased!.deceaseList![i].id ?? '');
    }
    for (int i = 0; i < data.events!.injured!.injureList!.length; i++) {
      listGenderInjured
          .add(listGender[data.events!.injured!.injureList![i].sex!].obs);
      listTextAgeInjured.add(TextEditingController(
          text: data.events!.injured!.injureList![i].age.toString()));
      listTextNameInjured.add(TextEditingController(
          text: data.events!.injured!.injureList![i].name.toString()));
      listDataIDUserInjured.add(data.events!.injured!.injureList![i].id ?? '');
    }
  }

  UpdateListGenderDie(String gender, int index) {
    listGenderDie[index].value = gender;
  }

  addDataDie() {
    listTextAgeDie.add(TextEditingController());
    listGenderDie.add('ไม่ระบุ'.obs);
    listTextNameDie.add(TextEditingController());
    listDataIDUserDie.add('new');
  }

  UpdateListGenderInjured(String gender, int index) {
    listGenderInjured[index].value = gender;
  }

  addDataInjured() {
    listTextAgeInjured.add(TextEditingController());
    listGenderInjured.add('ไม่ระบุ'.obs);
    listTextNameInjured.add(TextEditingController());
    listDataIDUserInjured.add('new');
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
    search.value.text = '';
    locationAddress = addressModel();
    remark.value.text = '';
    radio.value = 1;
    date.value = DateTime.now().toString().split(" ")[0];
    listDeleteImage.clear();
    listConvertImageLog.clear();
    listConvertFileLog.clear();
    listStringNameDeleteInjured.clear();
    listStringNameDeleteDie.clear();
    remarkReport.value.text = '';
    // listImage.value.clear();
    listConvertImage.clear();
    selectCategory!.value = 'อัคคีภัย';
    selectStatusList!.value = 'รับเรื่อง';
    selectStatusResponsible!.value = 'รับเรื่อง';
    selectStatusrelevant!.value = 'รับเรื่อง';
    address.value.text = '';
    listForm.clear();
    mapController.value.move(
        LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
    dataEditEvent = edit.EventByIDModel().obs;
    listTextNameDie.clear();
    listTextAgeDie.clear();
    listGenderDie.clear();
    listTextNameInjured.clear();
    listTextNameDie.clear();
    listDataIDUserInjured.clear();
    listDataIDUserDie.clear();
    listSearchMap.clear();
    listDataDeleteIDUserDie.clear();
    listDataDeleteIDUserInjured.clear();
    listTextNameInjured.clear();
    listTextAgeInjured.clear();
    listGenderInjured.clear();
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

  searchMap(String data) async {
    listSearchMap.value = await searchMapApi(data);
  }

  Future<void> submit(BuildContext context) async {
    try {
      String uuid = '';
      if (dataEditEvent.value.events != null) {
        uuid = dataEditEvent.value.events!.eventID!;
      } else {
        uuid = const Uuid().v4();
      }
      List<FreeFormDetailList> detailLists = [];
      addressModel location =
          await getLatLong(long: lng.value.text, lat: lat.value.text);
      for (var item in listForm) {
        List<FreeFormSubDetaiOptionlList> subDetailList = [];
        String? section;
        int? type;
        if (item.radio != null) {
          section = item.radio!.title?.text;
          type = item.radio!.type;
          item.radio!.listevent?.forEach((e) {
            subDetailList.add(FreeFormSubDetaiOptionlList(optionName: e.text));
          });
        }
        if (item.dropdown != null) {
          section = item.dropdown!.title?.text;
          type = item.dropdown!.type;
          item.dropdown!.listevent?.forEach((e) {
            subDetailList.add(FreeFormSubDetaiOptionlList(optionName: e.text));
          });
        }
        if (item.checkbox != null) {
          section = item.checkbox!.title?.text;
          type = item.checkbox!.type;
          item.checkbox!.listevent?.forEach((e) {
            subDetailList.add(FreeFormSubDetaiOptionlList(optionName: e.text));
          });
        }
        if (item.textfield != null) {
          section = item.textfield!.title?.text;
          type = item.textfield!.type;
          item.textfield!.listevent?.forEach((e) {
            subDetailList.add(FreeFormSubDetaiOptionlList(optionName: e.text));
          });
        }
        if (item.image != null) {
          section = item.image!.title?.text;
          type = item.image!.type;
        }
        if (item.file != null) {
          section = item.file!.title?.text;
          type = item.file!.type;
        }
        if (section != null && type != null) {
          detailLists.add(FreeFormDetailList(
            description: "",
            section: section,
            types: type,
            freeFormSubDetailList: subDetailList,
          ));
        }
      }

      print(detailLists.toList());

      for (var item in listForm) {
        print('Form Type: ${item.typeform}');
        if (item.textfield != null) {
          print('Textfield Title: ${item.textfield!.title?.text}');
          print(
              'Textfield Events: ${item.textfield!.listevent?.map((e) => e.text).toList()}');
        }
        if (item.dropdown != null) {
          print('Dropdown Title: ${item.dropdown!.title?.text}');
          print(
              'Dropdown Events: ${item.dropdown!.listevent?.map((e) => e.text).toList()}');
        }
        if (item.checkbox != null) {
          print('Checkbox Title: ${item.checkbox!.title?.text}');
          print(
              'Checkbox Events: ${item.checkbox!.listevent?.map((e) => e.text).toList()}');
        }
        if (item.radio != null) {
          print('Radio Title: ${item.radio!.title?.text}');
          print(
              'Radio Events: ${item.radio!.listevent?.map((e) => e.text).toList()}');
          print('Radio type: ${item.radio!.type}');
        }
        if (item.image != null) {
          print('Image Title: ${item.image!.title?.text}');
        }
        if (item.file != null) {
          print('File Title: ${item.file!.title?.text}');
        }
        print('---');
      }

      CreateEventFreeForm eventFreeForm = CreateEventFreeForm(
        eventID: uuid,
        eventName: nameCon.value.text,
        statusAgency: StatusResponsible.indexOf(selectStatusrelevant!.value),
        statusItem: StatusList.indexOf(selectStatusList!.value),
        datetime: date.value,
        responsibleAgency: responsible.value.text,
        latitude: lat.value.text,
        longitude: lng.value.text,
        address: address.value.text,
        tambon: location.tambon,
        amphure: location.amphure,
        province: location.province,
        zipCode: location.zipCode,
        createBy: createBy.value.text,
        freeFormDetailList: detailLists,
      );

      // print('Event ID: ${eventFreeForm.eventID}');
      // print('Event Name: ${eventFreeForm.eventName}');
      // print('Status Agency: ${eventFreeForm.statusAgency}');
      // print('Status Item: ${eventFreeForm.statusItem}');
      // print('Datetime: ${eventFreeForm.datetime}');
      // print('Responsible Agency: ${eventFreeForm.responsibleAgency}');
      // print('Latitude: ${eventFreeForm.latitude}');
      // print('Longitude: ${eventFreeForm.longitude}');
      // print('Address: ${eventFreeForm.address}');
      // print('Tambon: ${eventFreeForm.tambon}');
      // print('Amphure: ${eventFreeForm.amphure}');
      // print('Province: ${eventFreeForm.province}');
      // print('Zip Code: ${eventFreeForm.zipCode}');
      // print('Create By: ${eventFreeForm.createBy}');
      // eventFreeForm.freeFormDetailList?.forEach((detail) {
      //   print('Section: ${detail.section}');
      //   print('Description: ${detail.description}');
      //   print('Types: ${detail.types}');
      //   detail.freeFormSubDetailList?.forEach((subDetail) {
      //     print('Option Name: ${subDetail.optionName}');
      //   });
      // });

      await creatOrUpdateEventFreeFrom(eventFreeForm).then((value) {});
      await clearData();

      // await createEvenApi(even).then((value) {});
      // await clearData();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'บันทึกสำเร็จ',
                style: textStyle(context,
                    fontSize: 18, fontWeight: FontWeight.bold),
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
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ตกลง',
                  style: textStyle(context, fontSize: 14),
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
          pathImage: "data:image/png;base64,${base64Encode(element)}"));
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

class ListFormModel {
  String? typeform;
  Textfield? textfield;
  MyDropdown? dropdown;
  MyCheckBox? checkbox;
  MyRadio? radio;
  MyImg? image;
  MyFile? file;
  // List<String>? imageList;
  // List<String>? fileList;

  ListFormModel({
    this.typeform,
    this.textfield,
    this.dropdown,
    this.checkbox,
    this.radio,
    this.image,
    this.file,
    // this.imageList,
    // this.fileList
  });

  ListFormModel.fromJson(Map<String, dynamic> json) {
    typeform = json['typeform'];
    textfield = json['textfield'] != null
        ? new Textfield.fromJson(json['textfield'])
        : null;
    dropdown =
        json['dropdown'] != null ? MyDropdown.fromJson(json['dropdown']) : null;
    checkbox =
        json['checkbox'] != null ? MyCheckBox.fromJson(json['checkbox']) : null;
    radio = json['radio'] != null ? MyRadio.fromJson(json['radio']) : null;
    image = json['image'] != null ? MyImg.fromJson(json['image']) : null;
    file = json['file'] != null ? MyFile.fromJson(json['file']) : null;
    // imageList = json['imageList'].cast<String>();
    // fileList = json['fileList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeform'] = this.typeform;
    if (this.textfield != null) {
      data['textfield'] = this.textfield!.toJson();
    }
    if (this.dropdown != null) {
      data['dropdown'] = this.dropdown!.toJson();
    }
    if (this.checkbox != null) {
      data['checkbox'] = this.checkbox!.toJson();
    }
    if (this.radio != null) {
      data['radio'] = this.radio!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    // data['imageList'] = this.imageList;
    // data['fileList'] = this.imageList;
    return data;
  }
}

class Textfield {
  TextEditingController? title;
  RxList<TextEditingController>? listevent;
  int type = 3;

  Textfield({this.title, this.listevent, this.type = 3});

  Textfield.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<TextEditingController>();
    listevent = json['listevent'].cast<TextEditingController>();
    type = json['type'] ?? 3;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['listevent'] = this.listevent;
    data['type'] = this.type;
    return data;
  }
}

class MyDropdown {
  TextEditingController? title;
  RxList<TextEditingController>? listevent;
  int type = 0;

  MyDropdown({this.title, this.listevent, this.type = 0});

  MyDropdown.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<TextEditingController>();
    listevent = json['listevent'].cast<TextEditingController>();
    type = json['type'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['listevent'] = this.listevent;
    data['type'] = this.type;
    return data;
  }
}

class MyCheckBox {
  TextEditingController? title;
  RxList<TextEditingController>? listevent;
  int type = 1;

  MyCheckBox({this.title, this.listevent, this.type = 1});

  MyCheckBox.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<TextEditingController>();
    listevent = json['listevent'].cast<TextEditingController>();
    type = json['type'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['listevent'] = this.listevent;
    data['type'] = this.type;
    return data;
  }
}

class MyRadio {
  TextEditingController? title;
  RxList<TextEditingController>? listevent;
  int type = 2;

  MyRadio({this.title, this.listevent, this.type = 2});

  MyRadio.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<TextEditingController>();
    listevent = json['listevent'].cast<TextEditingController>();
    type = json['type'] ?? 2;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['listevent'] = this.listevent;
    data['type'] = this.type;
    return data;
  }
}

class MyImg {
  TextEditingController? title;
  int type = 4;

  MyImg({this.title, this.type = 4});

  MyImg.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<TextEditingController>();
    type = json['type'] ?? 4;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;

    return data;
  }
}

class MyFile {
  TextEditingController? title;
  int type = 5;

  MyFile({this.title, this.type = 5});

  MyFile.fromJson(Map<String, dynamic> json) {
    title = json['title'].cast<TextEditingController>();
    type = json['type'] ?? 5;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['type'] = this.type;

    return data;
  }
}
