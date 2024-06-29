import 'package:disaster/screen/detail/contollerdetail.dart';
import 'package:disaster/service/config.dart';
import 'package:disaster/stye/font.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/eventbyidmodel.dart';
import '../../stye/colors.dart';
import '../createlist/contollercreatelist.dart';
import '../drawer/admin/contollerdraweradmin.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final ContollerDetail contoller =
        Get.put(ContollerDetail(), permanent: false);
    return ListView(
      children: [
        Container(
          color: colorBackground,
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 150, top: 20),
          child: Obx(() => (contoller.dataEvent.value.events == null)
              ? Center(
                  child: LoadingAnimationWidget.inkDrop(
                  color: Colors.white,
                  size: 50,
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          contoller.pageName.value,
                          style: textStyle(context,
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () async {
                            final ContollerCreateList contollerEdite = Get.put(
                                ContollerCreateList(),
                                permanent: false);
                            final LandingPageControllerAdmin
                                landingPageController = Get.put(
                                    LandingPageControllerAdmin(),
                                    permanent: false);

                            landingPageController.tabIndex.value = 6;
                            await contollerEdite
                                .editEvent(contoller.dataEvent.value);
                            // landingPageController.tabIndex.value = 6;
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit_note,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'แก้ไขรายงาน',
                                  style: textStyle(context,
                                      fontSize: 13, color: Colors.white),
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
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ประเภทภัยพิบัติ',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ชื่อรายการ',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.category[contoller.dataEvent
                                          .value.events!.disasterType!],
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller
                                          .dataEvent.value.events!.eventName!,
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'วันที่รับเรื่อง',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'รับเรื่องจาก',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : '${DateTime.parse(contoller.dataEvent.value.events!.datetime!).day} ${mountList[DateTime.parse(contoller.dataEvent.value.events!.datetime!).month - 1]} ${DateTime.parse(contoller.dataEvent.value.events!.datetime!).year + 543}',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller
                                          .dataEvent.value.events!.receiveFrom!,
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'หน่วยงานที่เกียวข้อง',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'สถานะหน่วยงานที่เกี่ยวข้อง',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.dataEvent.value.events!
                                          .relatedAgency!,
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.StatusList[contoller.dataEvent
                                          .value.events!.statusRelatedAgency!],
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'หน่วยงานที่รับผิดชอบ',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'สถานะหน่วยงานที่รับผิดชอบ',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.dataEvent.value.events!
                                              .responsibleAgency ??
                                          '',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.StatusList[contoller.dataEvent
                                          .value.events!.statusAgency!],
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ผู้ประสบภัย',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ระดับความรุนแรง',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      (contoller.dataEvent.value.events == null)
                                          ? ''
                                          : 'ผู้เสียชีวิต ${contoller.dataEvent.value.events!.deceased!.total!} ราย เพศชาย ${contoller.dataEvent.value.events!.deceased!.male!} คน เพศหญิง ${contoller.dataEvent.value.events!.deceased!.feMale!} คน ไม่สามารถระบุเพศได้ ${contoller.dataEvent.value.events!.deceased!.unidentify!} คน',
                                      style: textStyle(context,
                                          fontSize: 13, color: colorGrey),
                                    ),
                                    Text(
                                      (contoller.dataEvent.value.events == null)
                                          ? ''
                                          : 'ผู้บาดเจ็บ ${contoller.dataEvent.value.events!.injured!.total!} ราย เพศชาย ${contoller.dataEvent.value.events!.injured!.male!} คน เพศหญิง ${contoller.dataEvent.value.events!.injured!.feMale!} คน ไม่สามารถระบุเพศได้ ${contoller.dataEvent.value.events!.injured!.unidentify!} คน',
                                      style: textStyle(context,
                                          fontSize: 13, color: colorGrey),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        contoller.dialogListName(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: colorGrey),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: colorWhite),
                                        child: Text(
                                          'ดูรายชื่อ',
                                          style: textStyle(context,
                                              fontSize: 13, color: colorBlue),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : (contoller.dataEvent.value.events!
                                                  .violence ==
                                              1)
                                          ? 'เล็กน้อย'
                                          : (contoller.dataEvent.value.events!
                                                      .violence ==
                                                  2)
                                              ? 'ปานกลาง'
                                              : 'รุนแรง',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'สถานะรายงาน',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.StatusList[contoller
                                          .dataEvent.value.events!.statusItem!],
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                         Container(
                            padding: EdgeInsets.all(20),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: contoller.dataEvent.value.events!
                                  .freeFormDetailList!.length,
                              itemBuilder: (context, index) {
                                TooltipBehavior _tooltipBehavior =
                                TooltipBehavior(
                                    enable: true,
                                    tooltipPosition:
                                    TooltipPosition.pointer);
                                return (contoller
                                    .dataEvent
                                    .value
                                    .events!
                                    .freeFormDetailList![index]
                                    .types ==
                                    0 ||
                                    contoller
                                        .dataEvent
                                        .value
                                        .events!
                                        .freeFormDetailList![index]
                                        .types ==
                                        1 ||
                                    contoller
                                        .dataEvent
                                        .value
                                        .events!
                                        .freeFormDetailList![index]
                                        .types ==
                                        2)
                                    ? Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${contoller.dataEvent.value.events!.freeFormDetailList![index].section}',
                                        style: textStyle(context,
                                            fontSize: 15,
                                            color: colorBlack,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        (contoller
                                            .dataEvent
                                            .value
                                            .events!
                                            .freeFormDetailList![
                                        index]
                                            .types ==
                                            0)
                                            ?Container(
                                          width: 300,
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
                                            width: double.infinity,
                                            child:
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton2<
                                                  FreeFormSubDetailList>(
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
                                                    .dataEvent
                                                    .value
                                                    .events!
                                                    .freeFormDetailList![
                                                index]
                                                    .freeFormSubDetailList![0],
                                                hint: Text(
                                                  'เลือกทั้งหมด',
                                                  style: TextStyle(
                                                      fontSize:
                                                      13.0,
                                                      color:
                                                      colorGrey,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                ),
                                                items: contoller
                                                    .dataEvent
                                                    .value
                                                    .events!
                                                    .freeFormDetailList![
                                                index]
                                                    .freeFormSubDetailList!
                                                    .map<
                                                    DropdownMenuItem<
                                                        FreeFormSubDetailList>>(
                                                        (FreeFormSubDetailList?
                                                    value) {
                                                      return DropdownMenuItem<
                                                          FreeFormSubDetailList>(
                                                        value: value!,
                                                        child: Text(
                                                          value
                                                              .optionName!,
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
                                              ),
                                            ),
                                          ),
                                        )
                                            :(contoller
                                            .dataEvent
                                            .value
                                            .events!
                                            .freeFormDetailList![
                                        index]
                                            .types ==
                                            1)?Container(
                                          height: 300,
                                          width: 300,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: contoller
                                                .dataEvent
                                                .value
                                                .events!
                                                .freeFormDetailList![
                                            index]
                                                .freeFormSubDetailList!
                                                .length,
                                            itemBuilder:
                                                (context, indexCheck) {
                                              return Container(
                                                  height: 40,
                                                  width: 300,
                                                  padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.check_box_outline_blank,size: 20,),
                                                      SizedBox(width: 20,),
                                                      Text( contoller.dataEvent.value.events!.freeFormDetailList![index].freeFormSubDetailList![indexCheck].optionName??'cfdf',style: TextStyle(fontSize: 13,color: Colors.grey),),
                                                    ],
                                                  ));
                                            },
                                          ),
                                        ):Container(
                                          height: 300,
                                          width: 300,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: contoller
                                                .dataEvent
                                                .value
                                                .events!
                                                .freeFormDetailList![
                                            index]
                                                .freeFormSubDetailList!
                                                .length,
                                            itemBuilder:
                                                (context, indexCheck) {
                                              return   Container(
                                                  height: 40,
                                                  width: 300,
                                                  padding: EdgeInsets.all(5),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.radio_button_off,size: 20,),
                                                      SizedBox(width: 20,),
                                                      Text( contoller.dataEvent.value.events!.freeFormDetailList![index].freeFormSubDetailList![indexCheck].optionName??'cfdf',style: TextStyle(fontSize: 13,color: Colors.grey),),
                                                    ],
                                                  ));

                                            },
                                          ),
                                        ) ,
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child: SfCircularChart(
                                              tooltipBehavior:
                                              _tooltipBehavior,
                                              series: <CircularSeries>[
                                                PieSeries<
                                                    FreeFormSubDetailList,
                                                    String>(
                                                    name: contoller
                                                        .dataEvent
                                                        .value
                                                        .events!
                                                        .freeFormDetailList![
                                                    index]
                                                        .section,
                                                    dataLabelSettings:
                                                    const DataLabelSettings(
                                                        isVisible:
                                                        true,
                                                        // Positioning the data label
                                                        labelPosition:
                                                        ChartDataLabelPosition
                                                            .outside),
                                                    dataSource: contoller
                                                        .dataEvent
                                                        .value
                                                        .events!
                                                        .freeFormDetailList![
                                                    index]
                                                        .freeFormSubDetailList,
                                                    xValueMapper: (FreeFormSubDetailList
                                                    data,
                                                        _) =>
                                                    data.optionName,
                                                    yValueMapper:
                                                        (FreeFormSubDetailList
                                                    data,
                                                        _) =>
                                                    data.amount,
                                                    dataLabelMapper:
                                                        (FreeFormSubDetailList
                                                    data,
                                                        _) =>
                                                        data.amount
                                                            .toString(),
                                                    // Radius of pie
                                                    radius: '70%')
                                              ]),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                                    : SizedBox();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: contoller.dataEvent.value.events!
                                .freeFormDetailList!.length,
                            itemBuilder: (context, index) {
                              return (contoller.dataEvent.value.events!
                                  .freeFormDetailList![index].types ==
                                  4)
                                  ?(contoller
                                  .dataEvent
                                  .value
                                  .events!
                                  .freeFormDetailList![
                              index]
                                  .freeFormSubDetailList![0]
                                  .imageList!.isNotEmpty)? Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${contoller.dataEvent.value.events!.freeFormDetailList![index].section}',
                                      style: textStyle(context,
                                          fontSize: 15,
                                          color: colorBlack,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: colorWhite,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5)),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 150,
                                              crossAxisSpacing: 3.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 0.8,
                                            ),
                                            itemCount: contoller
                                                .dataEvent
                                                .value
                                                .events!
                                                .freeFormDetailList![
                                            index]
                                                .freeFormSubDetailList![0]
                                                .imageList!
                                                .length,
                                            itemBuilder:
                                                (context, indexImage) {
                                              return Container(
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(contoller
                                                            .dataEvent
                                                            .value
                                                            .events!
                                                            .freeFormDetailList![
                                                        index]
                                                            .freeFormSubDetailList![
                                                        0]
                                                            .imageList![
                                                        indexImage]
                                                            .image!),
                                                        fit: BoxFit
                                                            .cover)),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ):SizedBox()
                                  : SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: contoller.dataEvent.value.events!
                                .freeFormDetailList!.length,
                            itemBuilder: (context, index) {
                              return (contoller.dataEvent.value.events!
                                  .freeFormDetailList![index].types ==
                                  5)
                                  ?( contoller
                                  .dataEvent
                                  .value
                                  .events!
                                  .freeFormDetailList![index]
                                  .freeFormSubDetailList![0]
                                  .fileList!
                                  .isNotEmpty)? Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${contoller.dataEvent.value.events!.freeFormDetailList![index].section}',
                                      style: textStyle(context,
                                          fontSize: 15,
                                          color: colorBlack,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    color: Colors.white,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 250,
                                        crossAxisSpacing: 3.0,
                                        mainAxisSpacing: 5.0,
                                        childAspectRatio: 5,
                                      ),
                                      itemCount: contoller
                                          .dataEvent
                                          .value
                                          .events!
                                          .freeFormDetailList![index]
                                          .freeFormSubDetailList![0]
                                          .fileList!
                                          .length,
                                      itemBuilder: (context, indexFile) {
                                        return InkWell(
                                          onTap: () {
                                            contoller.downloadFile(contoller
                                                .dataEvent
                                                .value
                                                .events!
                                                .freeFormDetailList![
                                            index]
                                                .freeFormSubDetailList![0]
                                                .fileList![indexFile]
                                                .file!);
                                          },
                                          child: Container(
                                            height: 50,
                                            color: Colors.grey.shade100,
                                            width: 250,
                                            padding: EdgeInsets.all(4),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Icon(
                                                  CupertinoIcons
                                                      .doc_text_fill,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    contoller
                                                        .dataEvent
                                                        .value
                                                        .events!
                                                        .freeFormDetailList![
                                                    index]
                                                        .freeFormSubDetailList![
                                                    0]
                                                        .fileList![
                                                    indexFile]
                                                        .fileName ??
                                                        '',
                                                    style: textStyle(
                                                        context,
                                                        fontSize: 13,
                                                        color:
                                                        colorBlack)),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.download,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ):SizedBox()
                                  : SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: contoller.dataEvent.value.events!
                                .freeFormDetailList!.length,
                            itemBuilder: (context, index) {
                              return (contoller.dataEvent.value.events!
                                  .freeFormDetailList![index].types ==
                                  3)
                                  ? (contoller
                                  .dataEvent
                                  .value
                                  .events!
                                  .freeFormDetailList![index]
                                  .freeFormSubDetailList![0]
                                  .textboxList!
                                  .isNotEmpty)?Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      contoller
                                          .dataEvent
                                          .value
                                          .events!
                                          .freeFormDetailList![index]
                                          .section ??
                                          '',
                                      style: textStyle(context,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: colorBlack)),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: contoller
                                            .dataEvent
                                            .value
                                            .events!
                                            .freeFormDetailList![index]
                                            .freeFormSubDetailList![0]
                                            .textboxList!
                                            .length,
                                        itemBuilder: (context,
                                            indexText) =>
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        contoller
                                                            .dataEvent
                                                            .value
                                                            .events!
                                                            .freeFormDetailList![
                                                        index]
                                                            .freeFormSubDetailList![
                                                        0]
                                                            .textboxList![
                                                        indexText]
                                                            .name ??
                                                            '',
                                                        style: textStyle(
                                                            context,
                                                            fontSize: 13,
                                                            color:
                                                            colorBlack,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    SizedBox(
                                                      width: 13,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    contoller
                                                        .dataEvent
                                                        .value
                                                        .events!
                                                        .freeFormDetailList![
                                                    index]
                                                        .freeFormSubDetailList![
                                                    0]
                                                        .textboxList![
                                                    indexText]
                                                        .answer ??
                                                        '',
                                                    style: textStyle(
                                                        context,
                                                        fontSize: 13,
                                                        color:
                                                        colorBlack)),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Divider(
                                                  height: 1,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            )),
                                  ),
                                ],
                              ):SizedBox()
                                  : SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        if(contoller
                            .dataEvent.value.events!=null)  Stack(
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
                                        double.parse(contoller
                                            .dataEvent.value.events!.latitude!),
                                        double.parse(contoller.dataEvent.value
                                            .events!.longitude!)),
                                    initialZoom: 14,
                                    interactionOptions: InteractionOptions(
                                        flags: InteractiveFlag.none),

                                    // maxZoom: 17,
                                    // minZoom: 10
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                    if (contoller.dataEvent.value.events !=
                                        null)
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                              point: LatLng(
                                                  double.parse(contoller
                                                      .dataEvent
                                                      .value
                                                      .events!
                                                      .latitude!),
                                                  double.parse(contoller
                                                      .dataEvent
                                                      .value
                                                      .events!
                                                      .longitude!)),
                                              width: 80,
                                              height: 80,
                                              child: InkWell(
                                                onTap: () async {
                                                  await launchUrl(
                                                    Uri.parse(
                                                        "https://www.google.co.th/maps/@${contoller.dataEvent.value.events!.latitude!},${contoller.dataEvent.value.events!.longitude!},17z?hl=th&entry=ttu"),
                                                  );
                                                  //
                                                },
                                                child: (contoller
                                                                .dataEvent
                                                                .value
                                                                .events!
                                                                .disasterType ==
                                                            0 &&
                                                        contoller
                                                                .dataEvent
                                                                .value
                                                                .events!
                                                                .statusItem ==
                                                            0)
                                                    ? SvgPicture.asset(
                                                        'assets/icons/svg/fire0.svg',
                                                      )
                                                    : (contoller
                                                                    .dataEvent
                                                                    .value
                                                                    .events!
                                                                    .disasterType ==
                                                                0 &&
                                                            contoller
                                                                    .dataEvent
                                                                    .value
                                                                    .events!
                                                                    .statusItem ==
                                                                1)
                                                        ? SvgPicture.asset(
                                                            'assets/icons/svg/fire1.svg',
                                                          )
                                                        : (contoller
                                                                        .dataEvent
                                                                        .value
                                                                        .events!
                                                                        .disasterType ==
                                                                    0 &&
                                                                contoller
                                                                        .dataEvent
                                                                        .value
                                                                        .events!
                                                                        .statusItem ==
                                                                    2)
                                                            ? SvgPicture.asset(
                                                                'assets/icons/svg/fire2.svg',
                                                              )
                                                            : (contoller.dataEvent.value.events!.disasterType == 1 && contoller.dataEvent.value.events!.statusItem == 0)
                                                                ? SvgPicture.asset(
                                                                    'assets/icons/svg/flood0.svg',
                                                                  )
                                                                : (contoller.dataEvent.value.events!.disasterType == 1 && contoller.dataEvent.value.events!.statusItem == 1)
                                                                    ? SvgPicture.asset(
                                                                        'assets/icons/svg/flood1.svg',
                                                                      )
                                                                    : (contoller.dataEvent.value.events!.disasterType == 1 && contoller.dataEvent.value.events!.statusItem == 2)
                                                                        ? SvgPicture.asset(
                                                                            'assets/icons/svg/flood2.svg',
                                                                          )
                                                                        : (contoller.dataEvent.value.events!.disasterType == 2 && contoller.dataEvent.value.events!.statusItem == 0)
                                                                            ? SvgPicture.asset(
                                                                                'assets/icons/svg/windstorm0.svg',
                                                                              )
                                                                            : (contoller.dataEvent.value.events!.disasterType == 2 && contoller.dataEvent.value.events!.statusItem == 1)
                                                                                ? SvgPicture.asset(
                                                                                    'assets/icons/svg/windstorm1.svg',
                                                                                  )
                                                                                : (contoller.dataEvent.value.events!.disasterType == 2 && contoller.dataEvent.value.events!.statusItem == 2)
                                                                                    ? SvgPicture.asset(
                                                                                        'assets/icons/svg/windstorm2.svg',
                                                                                      )
                                                                                    : (contoller.dataEvent.value.events!.disasterType == 3 && contoller.dataEvent.value.events!.statusItem == 0)
                                                                                        ? SvgPicture.asset(
                                                                                            'assets/icons/svg/forestfire0.svg',
                                                                                          )
                                                                                        : (contoller.dataEvent.value.events!.disasterType == 3 && contoller.dataEvent.value.events!.statusItem == 1)
                                                                                            ? SvgPicture.asset(
                                                                                                'assets/icons/svg/forestfire1.svg',
                                                                                              )
                                                                                            : SvgPicture.asset(
                                                                                                'assets/icons/svg/forestfire2.svg',
                                                                                              ),
                                              )),
                                        ],
                                      )
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
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ที่อยู่',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.dataEvent.value.events!
                                              .address ??
                                          '',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ละติจูด',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'ลองติจูด',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller
                                          .dataEvent.value.events!.latitude!,
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller
                                          .dataEvent.value.events!.longitude!,
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  'รูปที่อัพโหลด',
                                  style: textStyle(context,
                                      fontSize: 13, color: colorBlack),
                                ),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if ((contoller.dataEvent.value.events != null))
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 150,
                                crossAxisSpacing: 3.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.8,
                              ),
                              itemCount: contoller
                                  .dataEvent.value.events!.imageList!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          contoller.dataEvent.value.events!
                                              .imageList![index].pathImage!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          if (contoller.dataEvent.value.events != null)
                            if (contoller.dataEvent.value.events!.note !=
                                    null &&
                                contoller.dataEvent.value.events!.note != '')
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      'รายละเอียดเพิ่มเติม',
                                      style: textStyle(context,
                                          fontSize: 13, color: colorBlack),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller.dataEvent.value.events!.note!,
                                  style: textStyle(context,
                                      fontSize: 13, color: colorGrey),
                                ),
                              )),
                            ],
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  contoller.IndexChart.value = 0;
                                },
                                child: Container(
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Text('อัพเดทสถานการณ์รายงาน',
                                          style: textStyle(context,
                                              fontSize: 13,
                                              color:
                                                  (contoller.IndexChart.value ==
                                                          0)
                                                      ? colorAmber
                                                      : colorBlack)),
                                      if (contoller.IndexChart.value == 0)
                                        Divider(
                                          height: 3,
                                          color: colorAmber,
                                        )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  contoller.IndexChart.value = 1;
                                },
                                child: Container(
                                  width: 70,
                                  child: Column(
                                    children: [
                                      Text('แผนภูมิแท่ง',
                                          style: textStyle(context,
                                              fontSize: 13,
                                              color:
                                                  (contoller.IndexChart.value ==
                                                          1)
                                                      ? colorAmber
                                                      : colorBlack)),
                                      if (contoller.IndexChart.value == 1)
                                        Divider(
                                          height: 3,
                                          color: colorAmber,
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (contoller.IndexChart.value == 0)
                            if (contoller.dataEvent.value.events != null)
                              Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white,
                                height: 600,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: contoller.dataEvent.value.events!
                                        .logList!.length,
                                    itemBuilder: (context, index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text('ลำดับที่ ${index + 1}',
                                                    style: textStyle(context,
                                                        fontSize: 13,
                                                        color: colorBlack)),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                Text(
                                                    contoller
                                                            .dataEvent
                                                            .value
                                                            .events!
                                                            .logList![index]
                                                            .name ??
                                                        '',
                                                    style: textStyle(context,
                                                        fontSize: 13,
                                                        color: colorBlack,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                Text(
                                                    contoller
                                                            .dataEvent
                                                            .value
                                                            .events!
                                                            .logList![index]
                                                            .userName ??
                                                        '',
                                                    style: textStyle(context,
                                                        fontSize: 13,
                                                        color: colorBlack)),
                                                Spacer(),
                                                Text(
                                                    "${contoller.dataEvent.value.events!.logList![index].datetime!.split("T")[0]} ${contoller.dataEvent.value.events!.logList![index].datetime!.split("T")[1]}",
                                                    style: textStyle(context,
                                                        fontSize: 13,
                                                        color: colorBlack)),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                contoller
                                                    .dataEvent
                                                    .value
                                                    .events!
                                                    .logList![index]
                                                    .logDetailList!
                                                    .map(
                                                      (e) => e.header,
                                                    )
                                                    .toList()
                                                    .join(" , ")
                                                    .toString(),
                                                style: textStyle(context,
                                                    fontSize: 13,
                                                    color: colorBlack)),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                contoller
                                                        .dataEvent
                                                        .value
                                                        .events!
                                                        .logList![index]
                                                        .reportDetail ??
                                                    '',
                                                style: textStyle(context,
                                                    fontSize: 13,
                                                    color: colorBlack)),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            if (contoller
                                                .dataEvent
                                                .value
                                                .events!
                                                .logList![index]
                                                .imageList!
                                                .isNotEmpty)
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: colorWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 150,
                                                    crossAxisSpacing: 3.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 0.8,
                                                  ),
                                                  itemCount: contoller
                                                      .dataEvent
                                                      .value
                                                      .events!
                                                      .logList![index]
                                                      .imageList!
                                                      .length,
                                                  itemBuilder:
                                                      (context, indexImage) {
                                                    return Container(
                                                      width: 200,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  contoller
                                                                      .dataEvent
                                                                      .value
                                                                      .events!
                                                                      .logList![
                                                                          index]
                                                                      .imageList![
                                                                          indexImage]
                                                                      .image!),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    );
                                                  },
                                                ),
                                              ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            if (contoller
                                                .dataEvent
                                                .value
                                                .events!
                                                .logList![index]
                                                .fileList!
                                                .isNotEmpty)
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: colorWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 250,
                                                    crossAxisSpacing: 3.0,
                                                    mainAxisSpacing: 5.0,
                                                    childAspectRatio: 5,
                                                  ),
                                                  itemCount: contoller
                                                      .dataEvent
                                                      .value
                                                      .events!
                                                      .logList![index]
                                                      .fileList!
                                                      .length,
                                                  itemBuilder:
                                                      (context, indexFile) {
                                                    return InkWell(
                                                      onTap: () {
                                                        contoller.downloadFile(
                                                            contoller
                                                                .dataEvent
                                                                .value
                                                                .events!
                                                                .logList![index]
                                                                .fileList![0]
                                                                .file!);
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        color: Colors
                                                            .grey.shade100,
                                                        width: 250,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .doc_text_fill,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                contoller
                                                                        .dataEvent
                                                                        .value
                                                                        .events!
                                                                        .logList![
                                                                            index]
                                                                        .fileList![
                                                                            0]
                                                                        .fileName ??
                                                                    '',
                                                                style: textStyle(
                                                                    context,
                                                                    fontSize:
                                                                        13,
                                                                    color:
                                                                        colorBlack)),
                                                            SizedBox(
                                                              width: 13,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Icon(
                                                              Icons.download,
                                                              size: 20,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Divider(
                                              height: 1,
                                              color: Colors.grey,
                                            )
                                          ],
                                        )),
                              ),
                          if (contoller.IndexChart.value == 1)
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colorWhite),
                                height: 450,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text('แกนY',
                                            style: textStyle(context,
                                                fontSize: 13,
                                                color: colorBlack)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 5),
                                          width: 200,
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
                                                isExpanded: true,
                                                value: contoller
                                                    .selectChartY.value,
                                                hint: Text(
                                                  'จำนวนผู้บาดเจ็บ',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: colorGrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                items: contoller.listChartY.map<
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
                                                  contoller.selectChartY.value =
                                                      valueSelect!;
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text('แกนX',
                                            style: textStyle(context,
                                                fontSize: 13,
                                                color: colorBlack)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 5),
                                          width: 200,
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
                                                isExpanded: true,
                                                value: contoller
                                                    .selectChartX.value,
                                                hint: Text(
                                                  'เพศ',
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: colorGrey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                items: contoller.listChartX.map<
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
                                                  contoller.selectChartX.value =
                                                      valueSelect!;
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    if (contoller.dataEvent.value.graph != null)
                                      contoller.chart(context)
                                  ],
                                )),
                          SizedBox(
                            height: 20,
                          ),
                          if (contoller.dataEvent.value.peopleNewList!.isNotEmpty)  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('ภาพถ่ายจากทางบ้าน',
                                  style: textStyle(context,
                                      fontSize: 16,
                                      color: colorBlack,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (contoller.dataEvent.value.peopleNewList!.isNotEmpty)
                            Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.white,
                              height: 600,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: contoller
                                      .dataEvent.value.peopleNewList!.length,
                                  itemBuilder: (context, index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text('ลำดับที่ ${index + 1}',
                                                  style: textStyle(context,
                                                      fontSize: 13,
                                                      color: colorBlack)),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              Text(
                                                  contoller
                                                          .dataEvent
                                                          .value
                                                          .peopleNewList![index]
                                                          .name ??
                                                      'ไม่ระบุชื่อ',
                                                  style: textStyle(context,
                                                      fontSize: 13,
                                                      color: colorBlack,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              Spacer(),
                                              Text(
                                                  "${contoller.dataEvent.value.peopleNewList![index].createDatetime!.split("T")[0]} ${contoller.dataEvent.value.peopleNewList![index].createDatetime!.split("T")[1]}",
                                                  style: textStyle(context,
                                                      fontSize: 13,
                                                      color: colorBlack)),
                                              SizedBox(
                                                width: 13,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              contoller
                                                      .dataEvent
                                                      .value
                                                      .peopleNewList![index]
                                                      .note ??
                                                  '',
                                              style: textStyle(context,
                                                  fontSize: 13,
                                                  color: colorBlack)),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (contoller
                                              .dataEvent
                                              .value
                                              .peopleNewList![index]
                                              .imageNewsList!
                                              .isNotEmpty)
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: colorWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: GridView.builder(
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent: 150,
                                                  crossAxisSpacing: 3.0,
                                                  mainAxisSpacing: 10.0,
                                                  childAspectRatio: 0.8,
                                                ),
                                                itemCount: contoller
                                                    .dataEvent
                                                    .value
                                                    .peopleNewList![index]
                                                    .imageNewsList!
                                                    .length,
                                                itemBuilder:
                                                    (context, indexImage) {
                                                  return Container(
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(contoller
                                                                .dataEvent
                                                                .value
                                                                .peopleNewList![
                                                                    index]
                                                                .imageNewsList![
                                                                    indexImage]
                                                                .pathImage!),
                                                            fit: BoxFit.cover)),
                                                  );
                                                },
                                              ),
                                            ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            height: 1,
                                            color: Colors.grey,
                                          )
                                        ],
                                      )),
                            ),
                        ],
                      ),
                    )
                  ],
                )),
        )
      ],
    );
  }
}
