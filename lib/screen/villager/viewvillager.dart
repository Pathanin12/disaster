// import 'package:disaster/screen/villager/contollervillager.dart';
// import 'package:disaster/screen/villager/home_view_mobile.dart';
// import 'package:disaster/screen/villager/home_view_web.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, String> args = Get.arguments;
//     final String qrcode = args['qrcode'] ?? '';
//     if (kIsWeb) {
//       return const HomeViewWeb();
//     } else {
//       return HomeViewMobile(
//         eventID: qrcode,
//       );
//     }
//   }
// }

import 'dart:convert';
import 'package:disaster/router.dart';
import 'package:disaster/screen/villager/contollervillager.dart';
import 'package:disaster/api/apiservice/create_people_news.dart';
import 'package:disaster/screen/villager/web_camera.dart';
import 'package:disaster/stye/colors.dart';
import 'package:disaster/stye/font.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// vil

class HomeViewWeb extends GetView<HomeController> {
  const HomeViewWeb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(), permanent: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  'ส่งรูปถ่าย',
                  style: textStyle(context,
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Container(
                width: screenWidth * 0.5,
                decoration: BoxDecoration(
                  // border: Border.all(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: const Color(0xffC9C9C9)),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => controller.images.isEmpty
                          ? Container()
                          : SizedBox(
                              width: screenWidth * 0.425,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'อัพโหลดรูป',
                                        style: textStyle(
                                          context,
                                          fontSize: 15,
                                        ),
                                      )),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: 150,
                                            crossAxisCount: 3,
                                            childAspectRatio: (1 / .4)),
                                    itemCount: controller.images.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: screenWidth * 0.01,
                                                vertical: screenHeight * 0.01),
                                            child: SizedBox(
                                              width: screenHeight,
                                              height: screenHeight,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.memory(
                                                  controller.images[index],
                                                  fit: BoxFit.cover,
                                                  filterQuality:
                                                      FilterQuality.medium,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: GestureDetector(
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                onTap: () {
                                                  controller.images
                                                      .removeAt(index);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.425,
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.005,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              child: Text(
                                'เพิ่มรูป',
                                style: textStyle(
                                  context,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedBorder(
                                padding: const EdgeInsets.all(4),
                                color: Colors.grey,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue,
                                    shape: const RoundedRectangleBorder(),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.04,
                                        vertical: 4),
                                  ),
                                  child: Text(
                                    'ถ่ายรูป',
                                    style: textStyle(context,
                                        fontSize: 15, color: colorBlue),
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child: WebCamera()),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              DottedBorder(
                                padding: const EdgeInsets.all(4),
                                color: Colors.grey,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue,
                                    shape: const RoundedRectangleBorder(),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.04,
                                        vertical: 4),
                                  ),
                                  child: Text(
                                    'เลือกไฟล์',
                                    style: textStyle(context,
                                        fontSize: 15, color: colorBlue),
                                  ),
                                  onPressed: () {
                                    controller.getPicture();
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth * 0.425,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              child: Text(
                                'ชื่อผู้ส่ง',
                                style: textStyle(
                                  context,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 35,
                            child: TextField(
                              controller: controller.nameController,
                              maxLines: 1,
                              cursorColor: colorGrey,
                              decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffC9C9C9)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                  labelStyle: textStyle(
                                    context,
                                    fontSize: 15,
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(1))),
                                  hintStyle: textStyle(context,
                                      fontSize: 15,
                                      color: const Color(0xff515151)),
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 5, left: 10),
                                  hintText: 'ชื่อผู้ส่ง'),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                controller.toggle();
                              },
                              child: Container(
                                color: Colors.transparent,
                                alignment: Alignment.centerLeft,
                                // decoration: BoxDecoration(border: Border.all()),
                                width: double.infinity,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 3,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.toggle();
                                      },
                                      child: Obx(() => Icon(
                                            controller.isChecked.value
                                                ? Icons.check_box
                                                : Icons.check_box_outline_blank,
                                            color: controller.isChecked.value
                                                ? Colors.blueAccent
                                                : const Color(0xFFD0D0D0),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        'ไม่ระบุชื่อ',
                                        style: textStyle(
                                          context,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth * 0.425,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              child: Text(
                                'รายละเอียด (ไม่บังคับ)',
                                style: textStyle(
                                  context,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: controller.detailsController,
                            maxLines: 5,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffC9C9C9)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                labelStyle: textStyle(
                                  context,
                                  fontSize: 15,
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1))),
                                hintStyle: textStyle(context,
                                    fontSize: 15,
                                    color: const Color(0xff515151)),
                                contentPadding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                hintText: 'ใส่รายละเอียด'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFBD28),
              foregroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06, vertical: 6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.send, color: Colors.white),
                SizedBox(width: screenWidth * 0.01),
                Text(
                  'ส่งรูป',
                  style: textStyle(context, fontSize: 15, color: colorWhite),
                ),
              ],
            ),
            onPressed: () async {
              if (controller.images.isNotEmpty) {
                // EventID
                String eventid = controller.eventID!;
                String name = controller.nameController.text;
                String details = controller.detailsController.text;
                bool isChecked = controller.isChecked.value;
                List<String> base64Images = controller.images
                    .map((image) => base64Encode(image))
                    .toList();
                await createPeopleNews(
                    base64Images, eventid, name, details, isChecked);
                Get.dialog(
                  AlertDialog(
                    title: Text(
                      'สำเร็จ',
                      style: textStyle(Get.context!,
                          fontSize: 15, color: colorBlack),
                    ),
                    content: Text(
                      'ส่งรายการสำเร็จ',
                      style: textStyle(Get.context!,
                          fontSize: 15, color: colorBlack),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text(
                          'ตกลง',
                          style: textStyle(Get.context!,
                              fontSize: 15, color: colorBlack),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              } else {
                Get.dialog(
                  AlertDialog(
                    title: Text(
                      'คำเตือน',
                      style:
                          textStyle(context, fontSize: 15, color: colorBlack),
                    ),
                    content: Text(
                      'กรุณาเพิ่มรูปอย่างน้อย 1 รูป',
                      style:
                          textStyle(context, fontSize: 15, color: colorBlack),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text(
                          'ตกลง',
                          style: textStyle(context,
                              fontSize: 15, color: colorBlack),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
        ],
      )),
    );
  }
}
