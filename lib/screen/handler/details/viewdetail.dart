import 'package:disaster/screen/detail/contollerdetail.dart';
import 'package:disaster/screen/handler/details/contollerdetail.dart';
import 'package:disaster/service/config.dart';
import 'package:disaster/stye/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../stye/colors.dart';
import '../../createlist/contollercreatelist.dart';
import '../../drawer/admin/contollerdraweradmin.dart';

class Detailz extends StatelessWidget {
  const Detailz({super.key});

  @override
  Widget build(BuildContext context) {
    final ContollerDetailz contoller =
        Get.put(ContollerDetailz(), permanent: false);
    return ListView(
      children: [
        Container(
          color: colorBackground,
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 150, top: 20),
          child: Obx(() => Column(
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
                          final ContollerCreateList contollerEdite =
                              Get.put(ContollerCreateList(), permanent: false);
                          final LandingPageControllerAdmin
                              landingPageController = Get.put(
                                  LandingPageControllerAdmin(),
                                  permanent: false);
                          await contollerEdite
                              .editEvent(contoller.dataEvent.value);
                          landingPageController.tabIndex.value = 6;
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
                                    : contoller.category[contoller
                                        .dataEvent.value.events!.disasterType!],
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
                                    : '${DateTime.parse(contoller.dataEvent.value.events!.datetime!).day} ${mountList[DateTime.parse(contoller.dataEvent.value.events!.datetime!).month]} ${DateTime.parse(contoller.dataEvent.value.events!.datetime!).year + 543}',
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
                                    : contoller
                                        .dataEvent.value.events!.relatedAgency!,
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
                                    : contoller.StatusList[contoller
                                        .dataEvent.value.events!.statusAgency!],
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
                              child: Text(
                                (contoller.dataEvent.value.events == null)
                                    ? ''
                                    : 'ผู้เสียชีวิต ${contoller.dataEvent.value.events!.deceased!.total!} ราย เพศชาย ${contoller.dataEvent.value.events!.deceased!.male!} คน เพศหญิง ${contoller.dataEvent.value.events!.deceased!.feMale!} คน ไม่สามารถระบุเพศได้ ${contoller.dataEvent.value.events!.deceased!.unidentify!} คน\nผู้บาดเจ็บ ${contoller.dataEvent.value.events!.injured!.total!} ราย เพศชาย ${contoller.dataEvent.value.events!.injured!.male!} คน เพศหญิง ${contoller.dataEvent.value.events!.injured!.feMale!} คน ไม่สามารถระบุเพศได้ ${contoller.dataEvent.value.events!.injured!.unidentify!} คน',
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
                          height: 30,
                        ),
                        Stack(
                          children: [
                            if (contoller.dataEvent.value.events != null)  Container(
                              height: 400,
                              child: Center(
                                  child: FlutterMap(
                                mapController: contoller.mapController.value,
                                options:  MapOptions(
                                  initialCenter: LatLng(double.parse(contoller.dataEvent.value.events!.latitude!), double.parse(contoller.dataEvent.value.events!.latitude!)),
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
                                  if (contoller.dataEvent.value.events != null)
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
                                          child: (contoller.dataEvent.value.events!.disasterType == 0 &&
                                                  contoller.dataEvent.value
                                                          .events!.statusItem ==
                                                      0)
                                              ? SvgPicture.asset(
                                                  'assets/icons/svg/fire0.svg',
                                                )
                                              : (contoller.dataEvent.value.events!.disasterType == 0 &&
                                                      contoller
                                                              .dataEvent
                                                              .value
                                                              .events!
                                                              .statusItem ==
                                                          1)
                                                  ? SvgPicture.asset(
                                                      'assets/icons/svg/fire1.svg',
                                                    )
                                                  : (contoller.dataEvent.value.events!.disasterType == 0 &&
                                                          contoller
                                                                  .dataEvent
                                                                  .value
                                                                  .events!
                                                                  .statusItem ==
                                                              2)
                                                      ? SvgPicture.asset(
                                                          'assets/icons/svg/fire2.svg',
                                                        )
                                                      : (contoller
                                                                      .dataEvent
                                                                      .value
                                                                      .events!
                                                                      .disasterType ==
                                                                  1 &&
                                                              contoller
                                                                      .dataEvent
                                                                      .value
                                                                      .events!
                                                                      .statusItem ==
                                                                  0)
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
                                        ),
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
                                                  contoller.searchMap(contoller
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
                                              contoller.mapController.value
                                                  .move(
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
