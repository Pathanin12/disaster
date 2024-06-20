import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scan/scan.dart';

class HomeController extends GetxController {
  RxBool isChecked = false.obs;
  RxString qrcode = ''.obs;
  final images = [].obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggle() {
    isChecked.value = !isChecked.value;
  }

  Future<void> pickAndScanImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print(pickedFile.path);
      String? str = await Scan.parse(pickedFile.path);
      if (str != null) {
        qrcode.value = str;
        print(qrcode.value);
      }
    }
  }

  void takeMyPicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      images.add(bytes);
    }
  }

  void getPicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      images.add(bytes);
    }
  }
}
