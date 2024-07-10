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
import 'package:url_launcher/url_launcher.dart';

import '../../../router.dart';
import '../../../stye/colors.dart';
import 'contollerdetail.dart';

class DetailVillager extends StatefulWidget {
  const DetailVillager({super.key});

  @override
  State<DetailVillager> createState() => _DetailVillagerState();
}

class _DetailVillagerState extends State<DetailVillager> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ContollerDetailVillager contoller =
        Get.put(ContollerDetailVillager(), permanent: false);
  }

  @override
  Widget build(BuildContext context) {
    final ContollerDetailVillager contoller =
        Get.put(ContollerDetailVillager(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: InkWell(
          onTap: () {
            Get.offAndToNamed(RouterName.userPage);
          },
          child: Container(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.zero,
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo/logo.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'กระทรวงมหาดไทย',
                        style: textStyle(context,
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Ministry of Interior. Thailand',
                        style: textStyle(context, fontSize: 15),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: colorBackground,
            padding: const EdgeInsets.only(
                left: 20, right: 20, bottom: 150, top: 20),
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
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: Container(
                                        // child: Text(
                                        //   'ประเภทภัยพิบัติ',
                                        //   style: textStyle(context,
                                        //       fontSize: 15, color: colorBlack),
                                        // ),
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
                                        : contoller
                                            .dataEvent.value.events!.eventName!,
                                    style: textStyle(context,
                                        fontSize: 25, color: colorGrey),
                                  ),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: Container(
                                        // child: Text(
                                        //   (contoller.dataEvent.value.events == null)
                                        //       ? ''
                                        //       : contoller.category[contoller
                                        //       .dataEvent.value.events!.disasterType!],
                                        //   style: textStyle(context,
                                        //       fontSize: 15, color: colorGrey),
                                        // ),
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
                                        fontSize: 25, color: colorBlack),
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
                                        : '${DateTime.parse(contoller.dataEvent.value.events!.datetime!).day} ${mountList[DateTime.parse(contoller.dataEvent.value.events!.datetime!).month - 1]} ${DateTime.parse(contoller.dataEvent.value.events!.datetime!).year + 543}',
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
                                        : contoller.dataEvent.value.events!
                                            .receiveFrom!,
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
                                    'หน่วยงานที่เกียวข้อง',
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
                                    'สถานะหน่วยงานที่เกี่ยวข้อง',
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
                                            .relatedAgency!,
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
                                        : contoller.StatusList[contoller
                                            .dataEvent
                                            .value
                                            .events!
                                            .statusRelatedAgency!],
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
                                        : contoller.StatusList[contoller
                                            .dataEvent
                                            .value
                                            .events!
                                            .statusAgency!],
                                    style: textStyle(context,
                                        fontSize: 25, color: colorGrey),
                                  ),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //         child: Container(
                            //           child: Text(
                            //             'ผู้ประสบภัย',
                            //             style: textStyle(context,
                            //                 fontSize: 15, color: colorBlack),
                            //           ),
                            //         )),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Expanded(
                            //         child: Container(
                            //           child: Text(
                            //             'ระดับความรุนแรง',
                            //             style: textStyle(context,
                            //                 fontSize: 15, color: colorBlack),
                            //           ),
                            //         ))
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //         child: Container(
                            //           child: Column(
                            //             crossAxisAlignment: CrossAxisAlignment.start,
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: [
                            //               Text(
                            //                 (contoller.dataEvent.value.events == null)
                            //                     ? ''
                            //                     : 'ผู้เสียชีวิต ${contoller.dataEvent.value.events!.deceased!.total!} ราย เพศชาย ${contoller.dataEvent.value.events!.deceased!.male!} คน เพศหญิง ${contoller.dataEvent.value.events!.deceased!.feMale!} คน ไม่สามารถระบุเพศได้ ${contoller.dataEvent.value.events!.deceased!.unidentify!} คน',
                            //                 style: textStyle(context,
                            //                     fontSize: 15, color: colorGrey),
                            //               ),
                            //               Text(
                            //                 (contoller.dataEvent.value.events == null)
                            //                     ? ''
                            //                     : 'ผู้บาดเจ็บ ${contoller.dataEvent.value.events!.injured!.total!} ราย เพศชาย ${contoller.dataEvent.value.events!.injured!.male!} คน เพศหญิง ${contoller.dataEvent.value.events!.injured!.feMale!} คน ไม่สามารถระบุเพศได้ ${contoller.dataEvent.value.events!.injured!.unidentify!} คน',
                            //                 style: textStyle(context,
                            //                     fontSize: 15, color: colorGrey),
                            //               ),
                            //               // SizedBox(
                            //               //   height: 5,
                            //               // ),
                            //               // InkWell(
                            //               //   onTap: () {
                            //               //     contoller.dialogListName(context);
                            //               //   },
                            //               //   child: Container(
                            //               //     alignment: Alignment.center,
                            //               //     height: 40,
                            //               //     width: 80,
                            //               //     decoration: BoxDecoration(
                            //               //         border: Border.all(color: colorGrey),
                            //               //         borderRadius:
                            //               //         BorderRadius.circular(5),
                            //               //         color: colorWhite),
                            //               //     child: Text(
                            //               //       'ดูรายชื่อ',
                            //               //       style: textStyle(context,
                            //               //           fontSize: 15, color: colorBlue),
                            //               //     ),
                            //               //   ),
                            //               // )
                            //             ],
                            //           ),
                            //         )),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Expanded(
                            //         child: Container(
                            //           child: Text(
                            //             (contoller.dataEvent.value.events == null)
                            //                 ? ''
                            //                 : (contoller.dataEvent.value.events!
                            //                 .violence ==
                            //                 1)
                            //                 ? 'เล็กน้อย'
                            //                 : (contoller.dataEvent.value.events!
                            //                 .violence ==
                            //                 2)
                            //                 ? 'ปานกลาง'
                            //                 : 'รุนแรง',
                            //             style: textStyle(context,
                            //                 fontSize: 15, color: colorGrey),
                            //           ),
                            //         )),
                            //   ],
                            // ),
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
                                        fontSize: 25, color: colorBlack),
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
                                            .dataEvent
                                            .value
                                            .events!
                                            .statusItem!],
                                    style: textStyle(context,
                                        fontSize: 25, color: colorGrey),
                                  ),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Stack(
                              children: [
                                Container(
                                  color: Colors.blue,
                                  height: 400,
                                  child: Center(
                                      child: FlutterMap(
                                    mapController:
                                        contoller.mapController.value,
                                    options: MapOptions(
                                      keepAlive: true,
                                      initialCenter:
                                          LatLng(18.3170581, 99.3986862),
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
                                                    child: Stack(
                                                      children: [
                                                        Center(
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/svg/fire0.svg',
                                                            color: (contoller
                                                                        .dataEvent
                                                                        .value
                                                                        .events!
                                                                        .statusItem ==
                                                                    0)
                                                                ? Colors.amber
                                                                : (contoller
                                                                            .dataEvent
                                                                            .value
                                                                            .events!
                                                                            .statusItem ==
                                                                        1)
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .green,
                                                            width: 80,
                                                            height: 80,
                                                          ),
                                                        ),
                                                        Positioned(
                                                            top: 15,
                                                            left: 25,
                                                            child: SvgPicture
                                                                .asset(
                                                              listIconType[contoller
                                                                      .dataEvent
                                                                      .value
                                                                      .events!
                                                                      .iconMap ??
                                                                  0],
                                                              width: 30,
                                                              height: 30,
                                                            ))
                                                      ],
                                                    ))),
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
                                              controller:
                                                  contoller.search.value,
                                              autofocus: false,
                                              onChanged: (value) {
                                                // if (value.isNotEmpty) {
                                                //   contoller.searchMap(value);
                                                // }
                                                if (value.isEmpty) {
                                                  contoller.listSearchMap
                                                      .clear();
                                                }
                                              },
                                              decoration: InputDecoration(
                                                suffixIcon: InkWell(
                                                    onTap: () async {
                                                      contoller.searchMap(
                                                          contoller.search.value
                                                              .text);
                                                    },
                                                    child: Icon(Icons.search)),
                                                fillColor: colorWhite,
                                                hintText: "ค้นหา",
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
                                                  contoller.listSearchMap
                                                      .clear();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
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
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    'รูปที่อัพโหลด',
                                    style: textStyle(context,
                                        fontSize: 25, color: colorBlack),
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
                                            fontSize: 25, color: colorBlack),
                                      ),
                                    )),
                                    const SizedBox(
                                      width: 20,
                                    ),
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
                                            .dataEvent.value.events!.note!,
                                    style: textStyle(context,
                                        fontSize: 25, color: colorGrey),
                                  ),
                                )),
                              ],
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ภาพถ่ายจากทางบ้าน',
                                    style: textStyle(context,
                                        fontSize: 25,
                                        color: colorBlack,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.offAndToNamed(
                                        '${RouterName.villager}?id=${contoller.eventID}');
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
                                                Spacer(),
                                                Text(
                                                    "${contoller.dataEvent.value.peopleNewList![index].createDatetime!.split("T")[0]} ${contoller.dataEvent.value.peopleNewList![index].createDatetime!.split("T")[1]}",
                                                    style: textStyle(context,
                                                        fontSize: 25,
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
      ),
    );
  }
}
