import 'package:disaster/screen/detail/contollerdetail.dart';
import 'package:disaster/stye/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../stye/colors.dart';

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
                      Container(
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
                                'ประเภทภัยพิบัคิ',
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
                                (contoller.dataEvent.value.events==null)?'':contoller.category[contoller.dataEvent.value.events!.disasterType!],
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
                                'ชื่อรายการประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ชื่อรายการประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ชื่อรายการประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ชื่อรายการประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิ',
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
                                'ประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
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
                                'ชื่อรายการประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิประเภทภัยพิบัคิ',
                                style: textStyle(context,
                                    fontSize: 13, color: colorGrey),
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          color: Colors.blue,
                          height: 400,
                          child: Center(
                              child: FlutterMap(
                            mapController: contoller.mapController.value,
                            options: const MapOptions(
                              initialCenter: LatLng(18.3170581, 99.3986862),
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
                              if(contoller.dataEvent.value.events!=null)MarkerLayer(
                                markers: [
                                  Marker(
                                    point: LatLng(
                                        double.parse(contoller.dataEvent.value.events!.latitude!),
                                        double.parse(contoller.dataEvent.value.events!.longitude!)),
                                    width: 80,
                                    height: 80,
                                    child: (contoller.dataEvent.value.events!.disasterType == 0 &&
                                        contoller.dataEvent.value.events!.statusItem == 0)
                                        ? SvgPicture.asset(
                                            'assets/icons/svg/fire0.svg',
                                          )
                                        : (contoller.dataEvent.value.events!.disasterType == 0 &&
                                        contoller.dataEvent.value.events!.statusItem == 1)
                                            ? SvgPicture.asset(
                                                'assets/icons/svg/fire1.svg',
                                              )
                                            : (contoller.dataEvent.value.events!.disasterType == 0 &&
                                        contoller.dataEvent.value.events!.statusItem == 2)
                                                ? SvgPicture.asset(
                                                    'assets/icons/svg/fire2.svg',
                                                  )
                                                : (contoller.dataEvent.value.events!.disasterType == 1 &&
                                        contoller.dataEvent.value.events!.statusItem == 0)
                                                    ? SvgPicture.asset(
                                                        'assets/icons/svg/flood0.svg',
                                                      )
                                                    : (contoller.dataEvent.value.events!.disasterType ==
                                                                1 &&
                                        contoller.dataEvent.value.events!.statusItem ==
                                                                1)
                                                        ? SvgPicture.asset(
                                                            'assets/icons/svg/flood1.svg',
                                                          )
                                                        : (contoller.dataEvent.value.events!.disasterType ==
                                                                    1 &&
                                        contoller.dataEvent.value.events!.statusItem ==
                                                                    2)
                                                            ? SvgPicture.asset(
                                                                'assets/icons/svg/flood2.svg',
                                                              )
                                                            : (contoller.dataEvent.value.events!.disasterType ==
                                                                        2 &&
                                        contoller.dataEvent.value.events!.statusItem ==
                                                                        0)
                                                                ? SvgPicture
                                                                    .asset(
                                                                    'assets/icons/svg/windstorm0.svg',
                                                                  )
                                                                : (contoller.dataEvent.value.events!.disasterType ==
                                                                            2 &&
                                        contoller.dataEvent.value.events!.statusItem ==
                                                                            1)
                                                                    ? SvgPicture
                                                                        .asset(
                                                                        'assets/icons/svg/windstorm1.svg',
                                                                      )
                                                                    : (contoller.dataEvent.value.events!.disasterType == 2 &&
                                        contoller.dataEvent.value.events!.statusItem ==
                                                                                2)
                                                                        ? SvgPicture
                                                                            .asset(
                                                                            'assets/icons/svg/windstorm2.svg',
                                                                          )
                                                                        : (contoller.dataEvent.value.events!.disasterType == 3 &&
                                        contoller.dataEvent.value.events!.statusItem == 0)
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
