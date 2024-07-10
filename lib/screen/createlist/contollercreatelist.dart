import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:disaster/service/config.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
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
import '../../model/listanswermodel.dart' as answer;
import '../../model/searchmap.dart';
import '../drawer/admin/contollerdraweradmin.dart';

class ContollerCreateList extends GetxController {
  var mapController = MapController().obs;
  var dataEditEvent= edit.EventByIDModel().obs;
  final tooltipController = JustTheController();
  final formKey = GlobalKey<FormState>();
  var selectIcon=0.obs;
  addressModel locationAddress = addressModel();
  var selectedField = ''.obs;
  var listForm = <ListFormModel>[].obs;
  var showDropdown = false.obs;
  // var listStringNameDeleteDie =<String>[].obs;
  // var listStringNameDeleteInjured =<String>[].obs;
  // var listDataIDUserDie=<String>[].obs;
  var listAnswer = <answer.ListAnswerModel>[].obs;
  // var listDataIDUserInjured=<String>[].obs;
  // var listDataDeleteIDUserInjured=<RemoveDeceasedList>[].obs;
  // var listDataDeleteIDUserDie=<RemoveDeceasedList>[].obs;
  // String? imageFile;

  // var listTextNameDie=<TextEditingController>[].obs;
  // var listTextAgeDie=<TextEditingController>[].obs;
  // var listGenderDie=<RxString>[].obs;
  //
  // var listTextNameInjured=<TextEditingController>[].obs;
  // var listTextAgeInjured=<TextEditingController>[].obs;
  // var listGenderInjured=<RxString>[].obs;

  // var listImage = <Uint8List>[].obs;
  var listConvertImage = <edit.ImageList>[].obs;
  var listConvertImageLog = <edit.ImageList>[].obs;
  var listConvertFileLog = <edit.ImageList>[].obs;
  var listDeleteImage=<ImageDeleteList>[].obs;
  var date = DateTime.now().toString().split(" ")[0].obs;
  final nameCon = TextEditingController().obs,
      createBy = TextEditingController().obs,
      lat = TextEditingController().obs,
      address = TextEditingController().obs,
      remarkReport = TextEditingController().obs,
      lng = TextEditingController().obs,
      responsible = TextEditingController().obs,
      // die = TextEditingController(text: '0').obs,
      relevant = TextEditingController().obs,
      // mandie = TextEditingController(text: '0').obs,
      // womenDie = TextEditingController(text: '0').obs,
      // unGenderDie = TextEditingController(text: '0').obs,
      // injured = TextEditingController(text: '0').obs,
      // manInjured = TextEditingController(text: '0').obs,
      // womenInjured = TextEditingController(text: '0').obs,
      // unGenderInjured = TextEditingController(text: '0').obs,
      remark = TextEditingController().obs,
      search = TextEditingController().obs;
  var listSearchMap=<SearchMapModel>[].obs;
  final NumberPaginatorController controllerNumPage =
  NumberPaginatorController();

  final listGender=[
    "ชาย",
    "หญิง",
    "ไม่ระบุ"
  ];

  editEvent(edit.EventByIDModel data)async{
    // mapController.value.dispose();
   if(lat.value.text==''){
     mapController = MapController().obs;
   }
    await  clearData();
    dataEditEvent.value=data;
    nameCon.value.text = data.events!.eventName??'';
    createBy.value.text = data.events!.receiveFrom??'';
    lat.value.text = double.parse(data.events!.latitude!).toStringAsFixed(6);
    // unGenderDie.value.text=data.events!.deceased!.unidentify.toString()??'';
    lng.value.text = double.parse(data.events!.longitude!).toStringAsFixed(6);
    responsible.value.text = data.events!.responsibleAgency??'';
    // die.value.text = data.events!.deceased!.total!.toString()??'';
    relevant.value.text = data.events!.relatedAgency??'';
    // mandie.value.text = data.events!.deceased!.male.toString()??'';
    // womenDie.value.text = data.events!.deceased!.feMale.toString()??'';
    // injured.value.text = data.events!.injured!.total.toString()??'';
    // manInjured.value.text = data.events!.injured!.male.toString()??'';
    // womenInjured.value.text = data.events!.injured!.feMale.toString()??'';
    // unGenderInjured.value.text = data.events!.injured!.unidentify.toString()??'';
    remark.value.text = data.events!.note??'';
    if(isAdmin)listConvertImage.value = data.events!.imageList!;
    // radio.value = data.events!.violence??1;
    date.value = data.events!.datetime!;
    // listImage.value.clear();
    selectCategory!.value = category[data.events!.disasterType!];
    selectStatusList!.value = StatusList[data.events!.statusItem!];
    selectStatusResponsible!.value = StatusList[data.events!.statusAgency!];
    selectStatusrelevant!.value = StatusList[data.events!.statusRelatedAgency!];
    address.value.text= data.events!.address.toString()??'';


    // for(int i=0;i< data.events!.deceased!.deceaseList!.length;i++){
    //   // listGenderDie.add(listGender[data.events!.deceased!.deceaseList![i].sex!].obs);
    //   // listTextAgeDie.add(TextEditingController(text:data.events!.deceased!.deceaseList![i].age.toString() ));
    //   // listTextNameDie.add(TextEditingController(text: data.events!.deceased!.deceaseList![i].name.toString()));
    //   listDataIDUserDie.add(data.events!.deceased!.deceaseList![i].id??'');
    // }
    // for(int i=0;i< data.events!.injured!.injureList!.length;i++){
    //   listGenderInjured.add(listGender[data.events!.injured!.injureList![i].sex!].obs);
    //   listTextAgeInjured.add(TextEditingController(text:data.events!.injured!.injureList![i].age.toString() ));
    //   listTextNameInjured.add(TextEditingController(text: data.events!.injured!.injureList![i].name.toString()));
    //   listDataIDUserInjured.add(data.events!.injured!.injureList![i].id??'');
    // }
    for (var element in data.events!.freeFormDetailList!) {
      if (element.types == 0) {
        listAnswer.add(answer.ListAnswerModel(
          dropdown: answer.Dropdown(
            listoption: element.freeFormSubDetailList!
                .map((e) => e.optionName ?? '')
                .toList(),
            listoptionID:
            element.freeFormSubDetailList!.map((e) => e.id ?? '').toList(),
          ),
        ));
      } else if (element.types == 1) {
        List<bool> list=[];
        for (var element in element.freeFormSubDetailList!) {
          list.add(false);
        }
        listAnswer.add(answer.ListAnswerModel(
            checkbox: answer.Checkbox(
              listoption:
              element.freeFormSubDetailList!.map((e) => e.optionName ?? '').toList(),
              listoptionID:
              element.freeFormSubDetailList!.map((e) => e.id ?? '').toList(),
              valueID: [],
              value: [],
              listvalueoption:list,
            )));
      } else if (element.types == 2) {
        listAnswer.add(answer.ListAnswerModel(
          radio:  answer.Dropdown(
            listoption: element.freeFormSubDetailList!
                .map((e) => e.optionName ?? '')
                .toList(),
            listoptionID:
            element.freeFormSubDetailList!.map((e) => e.id ?? '').toList(),
          ),
        ));
      } else if (element.types == 3) {
        listAnswer.add(answer.ListAnswerModel(textfield: answer.Textfield(value:TextEditingController())));
      } else if (element.types == 4) {
        listAnswer.add(answer.ListAnswerModel(image: answer.Image(value: "")));
      } else if (element.types == 5) {
        listAnswer.add(answer.ListAnswerModel(file: answer.Image(value: "")));
      }
    }
    mapController.value.move(
        LatLng(double.parse(lat.value.text), double.parse(lng.value.text)), 16);
  }

  // UpdateListGenderDie(String gender, int index){
  //   listGenderDie[index].value=gender;
  // }


  // addDataDie(){
  //   listTextAgeDie.add(TextEditingController());
  //   listGenderDie.add('ไม่ระบุ'.obs);
  //   listTextNameDie.add(TextEditingController());
  //   listDataIDUserDie.add('new');
  //
  // }
  // UpdateListGenderInjured(String gender, int index){
  //   listGenderInjured[index].value=gender;
  // }
  // addDataInjured(){
  //   listTextAgeInjured.add(TextEditingController());
  //   listGenderInjured.add('ไม่ระบุ'.obs);
  //   listTextNameInjured.add(TextEditingController());
  //   listDataIDUserInjured.add('new');
  //
  // }
  clearData() async {
    nameCon.value.text = '';
    createBy.value.text = '';
    lat.value.text = "18.317058";
    lng.value.text = "99.398686";
    responsible.value.text = '';
    // die.value.text = '0';
    selectIcon.value=0;
    relevant.value.text = '';
    // mandie.value.text = '0';
    // womenDie.value.text = '0';
    // unGenderDie.value.text = '0';
    // injured.value.text = '0';
    // manInjured.value.text = '0';
    // womenInjured.value.text = '0';
    // unGenderInjured.value.text = '0';
    search.value.text='';
    locationAddress = addressModel();
    remark.value.text = '';
    // radio.value = 0;
    date.value = DateTime.now().toString().split(" ")[0];
    listDeleteImage.clear();
    listConvertImageLog.clear();
    listConvertFileLog.clear();
    listAnswer.clear();
    listForm.clear();
    // listStringNameDeleteInjured.clear();
    // listStringNameDeleteDie.clear();
    remarkReport.value.text='';
    // listImage.value.clear();
    listConvertImage.clear();
    selectCategory!.value = 'อัคคีภัย';
    selectStatusList!.value = 'รับเรื่อง';
    selectStatusResponsible!.value = 'รับเรื่อง';
    selectStatusrelevant!.value = 'รับเรื่อง';
    address.value.text='';
    // mapController.value.move(
    //     LatLng(latDefault, lngDefault), 16);
    dataEditEvent= edit.EventByIDModel().obs;
    // listTextNameDie.clear();
    // listTextAgeDie.clear();
    // listGenderDie.clear();
    // listTextNameInjured.clear();
    // listTextNameDie.clear();
    // listDataIDUserInjured.clear();
    // listDataIDUserDie.clear();
    listSearchMap.clear();
    // listDataDeleteIDUserDie.clear();
    // listDataDeleteIDUserInjured.clear();
    // listTextNameInjured.clear();
    // listTextAgeInjured.clear();
    // listGenderInjured.clear();

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


  searchMap(String data)async{
    listSearchMap.value=await searchMapApi(data);
  }

  Future<void> submit(BuildContext context) async {
    try {
      List<DeceaseList> listDataDie=[];
      List<DeceaseList> listDataInjured=[];
      List<FreeFormDetailList> detailLists = [];
      List<FreeFormAnswerList> listAnswerDetail=[];
      String uuid='';
      final LandingPageControllerAdmin landingPageController =
      Get.put(LandingPageControllerAdmin(), permanent: false);

      addressModel location =
      await getLatLong(long: lng.value.text, lat: lat.value.text,index: 1);
      List<ImageList> listImageBase64 = [],listImageBase64Log=[];
      List<FileList> listFileBase64=[];
      for (var element in listConvertImage) {
        if(element.imageName=='new'){
          listImageBase64.add(ImageList(image: element.pathImage));
        }
      }

      for (var element in listConvertImageLog) {
        listImageBase64Log.add(ImageList(image: element.pathImage));
      }

      for (var element in listConvertFileLog) {
          listFileBase64.add(FileList(file: element.pathImage,fileName: element.imageName));
      }

      UpdateBy? dataUpdate;
      if(dataEditEvent.value.events!=null){
        uuid = dataEditEvent.value.events!.eventID!;
        List<LogList>? listLog=[];
        if(category.indexOf(selectCategory!.value) != dataEditEvent.value.events!.disasterType!){
          listLog.add(LogList(header: 'ประเภทภัยพิบัติ',
              description: selectCategory!.value));
        }
        if(nameCon.value.text.trim() !=dataEditEvent.value.events!.eventName){
          listLog.add(LogList(header: 'ชื่อรายงาน',
              description: nameCon.value.text.trim()));
        }
        if(date.value !=dataEditEvent.value.events!.datetime){
          listLog.add(LogList(header: 'วันที่รับเรื่อง',
              description: date.value));
        }
        if(StatusList.indexOf(selectStatusList!.value)!= dataEditEvent.value.events!.statusItem){
          listLog.add(LogList(header: 'สถานะรายงาน',
              description: selectStatusList!.value));
        }
        if(StatusList.indexOf(selectStatusrelevant!.value)!= dataEditEvent.value.events!.statusRelatedAgency){
          listLog.add(LogList(header: 'สถานะหน่วยงานที่เกี่ยวข้อง',
              description: selectStatusrelevant!.value));
        }
        if(StatusList.indexOf(selectStatusResponsible!.value)!= dataEditEvent.value.events!.statusAgency){
          listLog.add(LogList(header: 'สถานะหน่วยงานที่รับผิดชอบ',
              description: selectStatusResponsible!.value));
        }
        if(createBy.value.text.trim()!=dataEditEvent.value.events!.receiveFrom){
          listLog.add(LogList(header: 'รับเรื่องจาก',
              description:createBy.value.text.trim()));
        }
        // if(radio.value!=dataEditEvent.value.events!.violence){
        //   listLog.add(LogList(header: 'ระดับความรุนแรง',
        //       description:radio.value.toString()));
        // }
        if(lat.value.text.trim()!=dataEditEvent.value.events!.latitude||lng.value.text.trim()!=dataEditEvent.value.events!.longitude){
          listLog.add(LogList(header: 'แก้ไขจุดพิกัด',
              description:'${lat.value.text.trim()},${lng.value.text.trim()}'));
        }
        if(address.value.text.trim()!=dataEditEvent.value.events!.address){
          listLog.add(LogList(header: 'แก้ไขที่อยู่',
              description:address.value.text.trim()));
        }

        dataUpdate= UpdateBy(
            name: landingPageController.dataUser!.value.profile!.name,
            datetime: DateTime.now().toString(),
            staffID: landingPageController.dataUser!.value.profile!.code,
            userName: landingPageController.dataUser!.value.profile!.username,
            imageList: listImageBase64Log,
            logList: listLog,
            fileList: listFileBase64,
          reportDetail: remarkReport.value.text.trim()
        );

        for(int i=0;i<dataEditEvent.value.events!.freeFormDetailList!.length;i++){

          if(dataEditEvent.value.events!.freeFormDetailList![i].types==0){
            listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: "",freeFormAnswerDetailList:[FreeFormAnswerDetailList(id: listAnswer[i].dropdown!.valueID)]));
          }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==1){
            List<FreeFormAnswerDetailList> list =[];
            listAnswer[i].checkbox!.valueID!.forEach((element) {
              list.add(FreeFormAnswerDetailList(id: element));
            });
            listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: "", freeFormAnswerDetailList:list));
          }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==2){
            listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: "",freeFormAnswerDetailList:[FreeFormAnswerDetailList(id: listAnswer[i].radio!.valueID)]));
          }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==3){
            listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",file: "",fileName: "",answer: listAnswer[i].textfield!.value!.text.trim(),freeFormAnswerDetailList:[]));
          }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==4){
            listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,fileName: "",image: listAnswer[i].image!.value,file: "",answer: "",freeFormAnswerDetailList:[]));
          }else if(dataEditEvent.value.events!.freeFormDetailList![i].types==5){
            listAnswerDetail.add(FreeFormAnswerList(id:dataEditEvent.value.events!.freeFormDetailList![i].id ,image: "",fileName: listAnswer[i].file!.name,file: listAnswer[i].file!.value,answer: "",freeFormAnswerDetailList:[]));
          }

        }

      }else{
        uuid = const Uuid().v4();
        for (var item in listForm) {
          List<FreeFormSubDetailList> subDetailList = [];
          String? section;
          int? type;
          if (item.radio != null) {
            section = item.radio!.title?.text;
            type = item.radio!.type;
            item.radio!.listevent?.forEach((e) {
              subDetailList.add(FreeFormSubDetailList(optionName: e.text));
            });
          }
          if (item.dropdown != null) {
            section = item.dropdown!.title?.text;
            type = item.dropdown!.type;
            item.dropdown!.listevent?.forEach((e) {
              subDetailList.add(FreeFormSubDetailList(optionName: e.text));
            });
          }
          if (item.checkbox != null) {
            section = item.checkbox!.title?.text;
            type = item.checkbox!.type;
            item.checkbox!.listevent?.forEach((e) {
              subDetailList.add(FreeFormSubDetailList(optionName: e.text));
            });
          }
          if (item.textfield != null) {
            section = item.textfield!.title?.text;
            type = item.textfield!.type;
            item.textfield!.listevent?.forEach((e) {
              subDetailList.add(FreeFormSubDetailList(optionName: e.text));
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
      }
      // for(int i=0;i<listDataIDUserDie.length;i++){
      //     if(listDataIDUserDie[i]=='new'){
      //       listDataDie.add(DeceaseList(
      //           name: listTextNameDie[i].text,
      //           age: int.parse(listTextAgeDie[i].text),
      //           sex: listGender.indexOf(listGenderDie[i].value)
      //       ));
      //     }
      // }
      // for(int i=0;i<listDataIDUserInjured.length;i++){
      //     if(listDataIDUserInjured[i]=='new'){
      //       listDataInjured.add(DeceaseList(
      //           name: listTextNameInjured[i].text,
      //           age: int.parse(listTextAgeInjured[i].text),
      //           sex: listGender.indexOf(listGenderInjured[i].value)
      //       ));
      //     }
      // }
      CreateEven even = CreateEven(
          eventID: uuid,
          isDelete: false,
          isActive: true,
          // createBy: createBy.value.text,
          datetime: date.value,
          iconMap: selectIcon.value,
          eventName: nameCon.value.text.trim(),
          // disasterType: category.indexOf(selectCategory.toString()),
          longitude: lng.value.text.trim(),
          latitude: lat.value.text.trim(),
          note: remark.value.text.trim(),
          province: location.province,
          // violence: radio.value,
          relatedAgency: relevant.value.text.trim(),
          imageList: listImageBase64,
          address: address.value.text.trim(),
          amphure: location.amphure,
          tambon: location.tambon,
          zipCode: location.zipCode,
          freeFormAnswerList:(!isAdmin)?listAnswerDetail:null,
          updateBy:dataUpdate,
          createBy: (dataEditEvent.value.events!=null)?null:landingPageController.dataUser!.value.profile!.name,
          imageDeleteList: listDeleteImage,
          receiveFrom: createBy.value.text.trim(),
          // deceased: Deceased(
          //     total: int.parse(die.value.text.trim()),
          //     feMale: int.parse(womenDie.value.text.trim()),
          //     male: int.parse(mandie.value.text.trim()),
          //     unidentify: int.parse(unGenderDie.value.text.trim()),
          //     deceaseList: listDataDie,
          //     removeDeceasedList: listDataDeleteIDUserDie
          // ),
          // injured: Injured(
          //     unidentify: int.parse(unGenderInjured.value.text.trim()),
          //     male: int.parse(manInjured.value.text.trim()),
          //     feMale: int.parse(womenInjured.value.text.trim()),
          //     total: int.parse(injured.value.text.trim()),
          //     removeInjuredList: listDataDeleteIDUserInjured,
          //
          //     injureList:  listDataInjured
          // ),
          statusRelatedAgency: StatusResponsible.indexOf(selectStatusrelevant!.value),
          statusAgency:
          Statusrelevant.indexOf(selectStatusResponsible!.value),
          statusItem: StatusList.indexOf(selectStatusList!.value),
          responsibleAgency: responsible.value.text.trim(),
           freeFormDetailList: detailLists,
      );
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
                textStyle(context, fontSize: 30, fontWeight: FontWeight.bold),
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
                  textStyle(context, fontSize: 26),
                )),
          ],
        ),
      );
    } catch (e) {
      print('ERROR SUBMIT CREATE=> $e');
    }
  }

  late MapShapeSource mapSource = const MapShapeSource.asset(
    "assets/world_map.json",
    shapeDataField: "name",
  );

  selectedImage(BuildContext context,int index) async {
    if(index==1){
      List<Uint8List> image = (await ImagePickerWeb.getMultiImagesAsBytes())!;
      image.forEach((element) {
        listConvertImage.add(edit.ImageList(
            imageName: 'new',
            pathImage:"data:image/png;base64,${base64Encode(element)}"
        ));
      });
    }else if(index==2){
      List<Uint8List> image = (await ImagePickerWeb.getMultiImagesAsBytes())!;
      image.forEach((element) {
        listConvertImageLog.add(edit.ImageList(
            imageName: 'new',
            pathImage:"data:image/png;base64,${base64Encode(element)}"
        ));
      });
    }

  }
  selectedFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'xlsx', 'doc','docx'],
    );
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

   if(result.files.first.extension=='pdf'){
     listConvertFileLog.add(edit.ImageList(
         imageName: fileName,
         pathImage:"data:application/pdf;base64,${base64Encode(fileBytes)}"
     )
     );
   }else if(result.files.first.extension=='xlsx'){
     listConvertFileLog.add(edit.ImageList(
         imageName: fileName,
         pathImage:"data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${base64Encode(fileBytes)}"
     )
     );
   }else if(result.files.first.extension=='docx'){
     listConvertFileLog.add(edit.ImageList(
         imageName: fileName,
         pathImage:"data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,${base64Encode(fileBytes)}"
     )
     );
   }else if(result.files.first.extension=='doc'){
     listConvertFileLog.add(edit.ImageList(
         imageName: fileName,
         pathImage:"data:application/msword;base64,${base64Encode(fileBytes)}"
     )
     );
   }
    }


  }
  selectedFileSingle(BuildContext context,{required int type,required int index}) async {
    if(type==4){
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
      );
      if (result != null) {
        Uint8List fileBytes = result.files.first.bytes!;
        String fileName = result.files.first.name;
        listAnswer[index].image!.value="data:image/png;base64,${base64Encode(fileBytes)}";

      }

    }else if(type==5){
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'xlsx', 'doc','docx'],
      );
      if (result != null) {
        Uint8List fileBytes = result.files.first.bytes!;
        String fileName = result.files.first.name;
        listAnswer[index].file!.name=fileName;
        if(result.files.first.extension=='pdf'){
          listAnswer[index].file!.value="data:application/pdf;base64,${base64Encode(fileBytes)}";

        }else if(result.files.first.extension=='xlsx'){
          listAnswer[index].file!.value="data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,${base64Encode(fileBytes)}";

        }else if(result.files.first.extension=='docx'){
          listAnswer[index].file!.value="data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64,${base64Encode(fileBytes)}";

        }else if(result.files.first.extension=='doc'){
          listAnswer[index].file!.value="data:application/msword;base64,${base64Encode(fileBytes)}";

        }
      }

    }

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
  }
  Future<void>setLoacationAddress()async{

  }

  @override
  void dispose() {
    super.dispose();
    listConvertImage.clear();
    //mapController.value.dispose();
  }
}

class ListDataNameModel {
  String? name;
  String? sex;
  String? age;
  String? edit;

  ListDataNameModel({this.name, this.sex, this.age, this.edit});

  ListDataNameModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sex = json['sex'];
    age = json['age'];
    edit = json['edit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['age'] = this.age;
    data['edit'] = this.edit;
    return data;
  }
}
class addressModel {
  String? amphure;
  String? address;
  String? tambon;
  String? zipCode;
  String? province;

  addressModel(
      { this.amphure, this.tambon, this.zipCode, this.province,this.address});
  addressModel.fromJson(Map<String, dynamic> json) {
    amphure = json['amphure'];
    tambon = json['tambon'];
    address = json['address'];
    zipCode = json['zipCode'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amphure'] = this.amphure;
    data['tambon'] = this.tambon;
    data['address'] = this.address;
    data['zipCode'] = this.zipCode;
    data['province'] = this.province;
    return data;
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

