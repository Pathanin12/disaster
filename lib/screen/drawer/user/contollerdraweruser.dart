import 'package:disaster/router.dart';
import 'package:disaster/service/config.dart';
import 'package:disaster/stye/colors.dart';
import 'package:disaster/stye/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qrcode_reader_web/qrcode_reader_web.dart';

import 'dart:html' as html;
import 'dart:js' as js;

import '../../detail/contollerdetail.dart';

class LandingPageControllerUser extends GetxController {
  var tabIndex = 0.obs;

  final List<QRCodeCapture> list = [];

  void scanQRCode(html.File imageFile) {
    final reader = html.FileReader();
    reader.readAsDataUrl(imageFile);
    reader.onLoadEnd.listen((event) {
      final html.ImageElement image = html.ImageElement();
      image.src = reader.result as String;
      image.onLoad.listen((_) {
        final html.CanvasElement canvas =
            html.CanvasElement(width: image.width!, height: image.height!);
        canvas.context2D.drawImage(image, 0, 0);
        final html.ImageData imageData =
            canvas.context2D.getImageData(0, 0, canvas.width!, canvas.height!);
        final result = js.context.callMethod('jsQR', [
          imageData.data,
          imageData.width,
          imageData.height,
        ]);
        if (result != null) {
          print('Found QR code: ${result['data']}');
          Uri pathConfig = Uri.parse(pathQR);
          Uri qrCodeUri = Uri.parse(result['data']);
          List<String> pathSegments = qrCodeUri.pathSegments;
          if (qrCodeUri.scheme == pathConfig.scheme &&
              qrCodeUri.authority == pathConfig.authority) {
            print("ตรงกัน ${pathSegments[pathSegments.length-2]}");
            if (pathSegments.isNotEmpty) {
              String eventID = pathSegments.last;
if((pathSegments[pathSegments.length-2]=='detail')){
  // final ContollerDetail contollerEvent =
  // Get.put(ContollerDetail(), permanent: false);
  // contollerEvent.getEvent(eventID);
  // Get.toNamed(RouterName.detail);
  // print(eventID);
  Get.offAndToNamed('${RouterName.detailvalliger}?id=$eventID');
  // Get.offAndToNamed(RouterName.villager,
  //     arguments: {'eventID': eventID});
}else{
  Get.offAndToNamed('${RouterName.detailvalliger}?id=$eventID');
}
            }
          } else {
            Get.dialog(
              AlertDialog(
                title: Text(
                  'ผิดพลาด',
                  style:
                      textStyle(Get.context!, fontSize: 15, color: colorBlack),
                ),
                content: Text(
                  'มีข้อผิดพลาดเกิดขึ้น กรุณาลองใหม่อีกครั้ง',
                  style:
                      textStyle(Get.context!, fontSize: 15, color: colorBlack),
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
            print("ไม่ตรงกับใน config");
          }
          if (pathSegments.isEmpty) {
            print('ไม่เจอ path');
            Get.dialog(
              AlertDialog(
                title: Text(
                  'ผิดพลาด',
                  style:
                      textStyle(Get.context!, fontSize: 15, color: colorBlack),
                ),
                content: Text(
                  'ไม่พบ EventID',
                  style:
                      textStyle(Get.context!, fontSize: 15, color: colorBlack),
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
          }
        } else {
          Get.dialog(
            AlertDialog(
              title: Text(
                'คำเตือน',
                style: textStyle(Get.context!, fontSize: 15, color: colorBlack),
              ),
              content: Text(
                'ไม่พบ QR code',
                style: textStyle(Get.context!, fontSize: 15, color: colorBlack),
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
          print('No QR code found');
        }
      });
    });
  }

  Future<void> pickImage() async {
    final input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      scanQRCode(file);
    });
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
