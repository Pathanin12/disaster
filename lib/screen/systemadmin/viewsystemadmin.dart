import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../api/systemadminapi/updateadminapi.dart';
import '../../stye/colors.dart';
import '../../stye/font.dart';
import 'contollersystemadmin.dart';

class SystemAdminPage extends StatefulWidget {
  const SystemAdminPage({super.key});

  @override
  State<SystemAdminPage> createState() => _SystemAdminPageState();
}

class _SystemAdminPageState extends State<SystemAdminPage> {
  @override
  Widget build(BuildContext context) {
    final ContollerSystemAdmin contoller =
        Get.put(ContollerSystemAdmin(), permanent: false);
    return ListView(
      children: [
        Container(
            color: colorBackground,
            padding: const EdgeInsets.only(
                left: 20, right: 20, bottom: 150, top: 20),
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(contoller.title.value,
                            style: textStyle(context,
                                fontSize: 30, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width < 1130)
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width * 0.82,
                      height:
                          (contoller.dataAdmin.value.userList!.length * 80) +
                              80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.trackpad,
                          },
                        ),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 1300,
                                  height: (contoller.dataAdmin.value.userList!
                                              .length *
                                          80) +
                                      50,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 1300,
                                        height: 50,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Text(
                                                    'ชื่อ-นามสกุล',
                                                    style: textStyle(context,
                                                        fontSize: 25),
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Text(
                                                    'อีเมลล์',
                                                    style: textStyle(context,
                                                        fontSize: 25),
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 4,
                                                child: Container(
                                                  child: Text(
                                                    'ตำแหน่ง',
                                                    style: textStyle(context,
                                                        fontSize: 25),
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Text(
                                                    'สิทธิ์',
                                                    style: textStyle(context,
                                                        fontSize: 25),
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                flex: 3, child: Container()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey.shade200,
                                      ),
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: contoller
                                            .dataAdmin.value.userList!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Text(
                                                          contoller
                                                              .dataAdmin
                                                              .value
                                                              .userList![index]
                                                              .name!,
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Text(
                                                          contoller
                                                              .dataAdmin
                                                              .value
                                                              .userList![index]
                                                              .email!,
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        child: Text(
                                                          contoller
                                                              .dataAdmin
                                                              .value
                                                              .userList![index]
                                                              .positionName!,
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child: Text(
                                                          contoller
                                                              .dataAdmin
                                                              .value
                                                              .userList![index]
                                                              .roleName!,
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 25),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 20,
                                                                      right: 5),
                                                              width: 200,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color:
                                                                          colorWhite,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black26,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: SizedBox(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    DropdownButtonHideUnderline(
                                                                  child:
                                                                      DropdownButton2<
                                                                          String>(
                                                                    dropdownStyleData:
                                                                        DropdownStyleData(
                                                                      maxHeight:
                                                                          300,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      scrollbarTheme:
                                                                          ScrollbarThemeData(
                                                                        radius: const Radius
                                                                            .circular(
                                                                            5),
                                                                        thickness:
                                                                            MaterialStateProperty.all<double>(6),
                                                                        thumbVisibility:
                                                                            MaterialStateProperty.all<bool>(true),
                                                                      ),
                                                                    ),
                                                                    autofocus:
                                                                        true,
                                                                    isExpanded:
                                                                        true,
                                                                    value: contoller
                                                                            .dropdownListAdmin[
                                                                        index],
                                                                    items: contoller
                                                                        .listAdmin
                                                                        .map<
                                                                            DropdownMenuItem<
                                                                                String>>((String?
                                                                            value) {
                                                                      return DropdownMenuItem<
                                                                          String>(
                                                                        value:
                                                                            value!,
                                                                        child:
                                                                            Text(
                                                                          value,
                                                                          style: textStyle(
                                                                              context,
                                                                              fontSize: 25,
                                                                              color: colorGrey,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                      );
                                                                    }).toList(),
                                                                    iconStyleData:
                                                                        const IconStyleData(
                                                                            icon:
                                                                                Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down,
                                                                      size: 24,
                                                                    )),
                                                                    onChanged:
                                                                        (valueSelect) async {
                                                                      await updateAdmin(
                                                                          id: contoller
                                                                              .dataAdmin
                                                                              .value
                                                                              .userList![
                                                                                  index]
                                                                              .id!,
                                                                          role: contoller.listAdmin.indexOf(valueSelect) +
                                                                              1,
                                                                          status: contoller
                                                                              .dataAdmin
                                                                              .value
                                                                              .userList![index]
                                                                              .isAccept!);
                                                                      setState(
                                                                          () {
                                                                        contoller.dropdownListAdmin[index] =
                                                                            valueSelect!;
                                                                        contoller
                                                                            .dataAdmin
                                                                            .value
                                                                            .userList![index]
                                                                            .roleName = valueSelect;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Obx(() => Switch(
                                                                  // This bool value toggles the switch.
                                                                  value: contoller
                                                                      .dataAdmin
                                                                      .value
                                                                      .userList![
                                                                          index]
                                                                      .isAccept!,
                                                                  activeColor:
                                                                      Colors
                                                                          .green,
                                                                  onChanged: (bool
                                                                      value) async {
                                                                    await updateAdmin(
                                                                        id: contoller
                                                                            .dataAdmin
                                                                            .value
                                                                            .userList![
                                                                                index]
                                                                            .id!,
                                                                        status:
                                                                            value,
                                                                        role: contoller.listAdmin.indexOf(contoller.dropdownListAdmin[index]) +
                                                                            1);
                                                                    contoller
                                                                        .dataAdmin
                                                                        .value
                                                                        .userList![
                                                                            index]
                                                                        .isAccept = value;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                ))
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.shade200,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 150,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )))
      ],
    );
  }
}
