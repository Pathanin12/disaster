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
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      'ชื่อ-นามสกุล',
                                      style: textStyle(context, fontSize: 14),
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
                                      style: textStyle(context, fontSize: 14),
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
                                      style: textStyle(context, fontSize: 14),
                                    ),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      'สิทธิ์',
                                      style: textStyle(context, fontSize: 14),
                                    ),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(flex: 2, child: Container()),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                          Container(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  contoller.dataAdmin.value.userList!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                contoller.dataAdmin.value
                                                    .userList![index].name!,
                                                style: textStyle(context,
                                                    fontSize: 14),
                                              ),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                contoller.dataAdmin.value
                                                    .userList![index].email!,
                                                style: textStyle(context,
                                                    fontSize: 14),
                                              ),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              child: Text(
                                                contoller.dataAdmin.value
                                                    .userList![index].positionName!,
                                                style: textStyle(context,
                                                    fontSize: 14),
                                              ),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text(
                                                contoller.dataAdmin.value
                                                    .userList![index].roleName!,
                                                style: textStyle(context,
                                                    fontSize: 14),
                                              ),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                Obx(() =>   Switch(
                                                  // This bool value toggles the switch.
                                                  value: contoller.dataAdmin.value
                                                      .userList![index].isAccept!,
                                                  activeColor: Colors.green,
                                                  onChanged: (bool value) async{
                                                   await updateAdmin(id:contoller.dataAdmin.value.userList![index].id!,status: value );
                                                    contoller.dataAdmin.value.userList![index].isAccept = value;
                                                    setState(() {

                                                    });

                                                  },
                                                ))
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Divider(height: 1,color: Colors.grey.shade200,),
                                    SizedBox(height: 5,),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
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
