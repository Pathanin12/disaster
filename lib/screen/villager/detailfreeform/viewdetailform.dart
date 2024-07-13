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

import '../../../model/freeformbyidmodel.dart';
import '../../../router.dart';
import '../../../stye/colors.dart';
import 'contollerfreeform.dart';

class DetailFreeFormVillager extends StatelessWidget {
  const DetailFreeFormVillager({super.key});

  @override
  Widget build(BuildContext context) {
    final ContollerDetailFreeFormVillager contoller =
        Get.put(ContollerDetailFreeFormVillager(), permanent: false);
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
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
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
                                  'ชื่อรายการ',
                                  style: textStyle(context,
                                      fontSize: 25, color: colorBlack),
                                ),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              // Expanded(
                              //     child: Container(
                              //   child: Text(
                              //     (contoller.dataEvent.value.events == null)
                              //         ? ''
                              //         : contoller.category[contoller
                              //             .dataEvent.value.events!.disasterType!],
                              //     style: textStyle(context,
                              //         fontSize: 15, color: colorGrey),
                              //   ),
                              // )),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              Expanded(
                                  child: Container(
                                child: Text(
                                  (contoller.dataEvent.value.events == null)
                                      ? ''
                                      : contoller
                                          .dataEvent.value.events!.eventName!,
                                  style: textStyle(context,
                                      fontSize: 25, color: colorGrey),
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
                                  flex: 5,
                                  child: Container(
                                    child: Text(
                                      'วันที่รับเรื่อง',
                                      style: textStyle(context,
                                          fontSize: 25, color: colorBlack),
                                    ),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Text(
                                      'สถานะรายงาน',
                                      style: textStyle(context,
                                          fontSize: 25, color: colorBlack),
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
                                  flex: 5,
                                  child: Container(
                                    child: Text(
                                      (contoller.dataEvent.value.events == null)
                                          ? ''
                                          : '${DateTime.parse(contoller.dataEvent.value.events!.datetime!).day} ${mountList[DateTime.parse(contoller.dataEvent.value.events!.datetime!).month - 1]} ${DateTime.parse(contoller.dataEvent.value.events!.datetime!).year}',
                                      style: textStyle(context,
                                          fontSize: 25, color: colorGrey),
                                    ),
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Text(
                                      (contoller.dataEvent.value.events == null)
                                          ? ''
                                          : contoller.StatusList[contoller
                                              .dataEvent
                                              .value
                                              .events!
                                              .statusItem!],
                                      style: textStyle(context,
                                          fontSize: 25, color: colorGrey),
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
                                      fontSize: 25, color: colorBlack),
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
                                      fontSize: 25, color: colorBlack),
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
                                      fontSize: 25, color: colorGrey),
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
                                      fontSize: 25, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: contoller.dataEvent.value.events!
                                .freeFormDetailList!.length,
                            itemBuilder: (context, index) {
                              TooltipBehavior _tooltipBehavior =
                                  TooltipBehavior(
                                      enable: true,
                                      tooltipPosition: TooltipPosition.pointer);
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
                                                fontSize: 25,
                                                color: colorBlack,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 300,
                                          width: 300,
                                          child: SfCircularChart(
                                              tooltipBehavior: _tooltipBehavior,
                                              series: <CircularSeries>[
                                                PieSeries<FreeFormSubDetailList,
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
                                                            isVisible: true,
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
                                                    xValueMapper:
                                                        (FreeFormSubDetailList
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
                                    )
                                  : SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: contoller.dataEvent.value.events!
                                .freeFormDetailList!.length,
                            itemBuilder: (context, index) {
                              return (contoller.dataEvent.value.events!
                                          .freeFormDetailList![index].types ==
                                      4)
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${contoller.dataEvent.value.events!.freeFormDetailList![index].section}',
                                            style: textStyle(context,
                                                fontSize: 25,
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
                                    )
                                  : SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: contoller.dataEvent.value.events!
                                .freeFormDetailList!.length,
                            itemBuilder: (context, index) {
                              return (contoller.dataEvent.value.events!
                                          .freeFormDetailList![index].types ==
                                      3)
                                  ? Column(
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
                                                fontSize: 25,
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
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
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
                                                                  fontSize: 25,
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
                                                              fontSize: 25,
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
                                    )
                                  : SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 400,
                                child: Center(
                                    child: FlutterMap(
                                  mapController: contoller.mapController.value,
                                  options: MapOptions(
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
                                                double.parse(contoller.dataEvent
                                                    .value.events!.latitude!),
                                                double.parse(contoller.dataEvent
                                                    .value.events!.longitude!)),
                                            width: 80,
                                            height: 80,
                                            child: InkWell(
                                                onTap: () async {
                                                  await launchUrl(
                                                    Uri.parse(
                                                        "https://www.google.co.th/maps/@${contoller.dataEvent.value.events!.latitude!},${contoller.dataEvent.value.events!.longitude!},17z?hl=th&entry=ttu"),
                                                  );
                                                },
                                                child: (contoller
                                                            .dataEvent
                                                            .value
                                                            .events!
                                                            .statusItem ==
                                                        0)
                                                    ? SvgPicture.asset(
                                                        'assets/icons/svg/freeform0.svg',
                                                      )
                                                    : (contoller
                                                                .dataEvent
                                                                .value
                                                                .events!
                                                                .statusItem ==
                                                            1)
                                                        ? SvgPicture.asset(
                                                            'assets/icons/svg/freeform2.svg',
                                                          )
                                                        : SvgPicture.asset(
                                                            'assets/icons/svg/freeform1.svg',
                                                          )),
                                          )
                                        ],
                                      )
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
                                                  child: Icon(Icons.search)),
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
                                      fontSize: 25, color: colorBlack),
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
                                      fontSize: 25, color: colorGrey),
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
                                      fontSize: 25, color: colorBlack),
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
                                      fontSize: 25, color: colorBlack),
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
                                      fontSize: 25, color: colorGrey),
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
                                      fontSize: 25, color: colorGrey),
                                ),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          if (contoller
                              .dataEvent.value.peopleNewList!.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ภาพถ่ายจากทางบ้าน',
                                    style: textStyle(context,
                                        fontSize: 30,
                                        color: colorBlack,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.offAndToNamed(RouterName.villager,
                                        arguments: {
                                          'eventID': contoller.eventID
                                        });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.send,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "ส่งรูปถ่าย",
                                          style: textStyle(
                                            context,
                                            fontSize: 25,
                                            color: colorWhite,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          SizedBox(
                            width: 13,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (contoller.dataEvent.value.peopleNewList != null)
                            if (contoller
                                .dataEvent.value.peopleNewList!.isNotEmpty)
                              Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white,
                                height: 600,
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                                        fontSize: 25,
                                                        color: colorBlack)),
                                                SizedBox(
                                                  width: 13,
                                                ),
                                                Text(
                                                    contoller
                                                            .dataEvent
                                                            .value
                                                            .peopleNewList![
                                                                index]
                                                            .name ??
                                                        'ไม่ระบุชื่อ',
                                                    style: textStyle(context,
                                                        fontSize: 25,
                                                        color: colorBlack,
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                                                    fontSize: 25,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
