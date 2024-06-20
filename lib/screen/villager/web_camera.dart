import 'dart:html';
import 'package:camera/camera.dart';
import 'package:disaster/screen/villager/contollervillager.dart';
import 'package:disaster/stye/colors.dart';
import 'package:disaster/stye/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebCamera extends StatefulWidget {
  @override
  _WebCameraState createState() => _WebCameraState();
}

class _WebCameraState extends State<WebCamera> {
  bool cameraAccess = false;
  String? error;
  List<CameraDescription>? cameras;
  final HomeController homeController = Get.find();

  @override
  void initState() {
    getCameras();
    super.initState();
  }

  Future<void> getCameras() async {
    try {
      await window.navigator.mediaDevices!
          .getUserMedia({'video': true, 'audio': false});
      setState(() {
        cameraAccess = true;
      });
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        homeController.getPicture();
        return;
      }
      setState(() {
        this.cameras = cameras;
      });
    } on DomException catch (e) {
      setState(() {
        error = '${e.name}: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      homeController.getPicture();
      return Center(
          child: Text(
        'Error: $error',
        style: textStyle(
          context,
          fontSize: 14,
        ),
      ));
    }
    if (!cameraAccess) {
      return Center(
          child: Text(
        'Camera access not granted yet.',
        style: textStyle(
          context,
          fontSize: 14,
        ),
      ));
    }
    if (cameras == null) {
      return Center(
          child: Text(
        'Reading cameras',
        style: textStyle(
          context,
          fontSize: 14,
        ),
      ));
    }
    return CameraView(cameras: cameras!);
  }
}

class CameraView extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraView({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  String? error;
  CameraController? controller;
  late CameraDescription cameraDescription = widget.cameras[0];

  Future<void> initCam(CameraDescription description) async {
    setState(() {
      controller = CameraController(description, ResolutionPreset.max);
    });
    try {
      await controller!.initialize();
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initCam(cameraDescription);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (error != null) {
      homeController.getPicture();
      return Center(
        child: Text(
          'Initializing error: $error\nCamera list:',
          style: textStyle(
            context,
            fontSize: 14,
          ),
        ),
      );
    }
    if (controller == null) {
      return Center(
          child: Text(
        'Loading controller...',
        style: textStyle(
          context,
          fontSize: 14,
        ),
      ));
    }
    if (!controller!.value.isInitialized) {
      return Center(
          child: Text(
        'Initializing camera...',
        style: textStyle(
          context,
          fontSize: 14,
        ),
      ));
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CameraPreview(controller!),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Devices',
                  style: textStyle(
                    context,
                    fontSize: 14,
                  ),
                )),
            Material(
              child: DropdownButton<CameraDescription>(
                isExpanded: true,
                underline: const SizedBox(),
                value: cameraDescription,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                iconSize: 24,
                onChanged: (CameraDescription? newValue) async {
                  if (controller != null) {
                    await controller!.dispose();
                  }
                  setState(() {
                    controller = null;
                    cameraDescription = newValue!;
                  });

                  initCam(newValue!);
                },
                items: widget.cameras
                    .map<DropdownMenuItem<CameraDescription>>((value) {
                  return DropdownMenuItem<CameraDescription>(
                    value: value,
                    child: Text(
                      '${value.name}: ${value.lensDirection}',
                      style: textStyle(
                        context,
                        fontSize: 14,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                ),
                onPressed: controller == null
                    ? null
                    : () async {
                        try {
                          final file = await controller!.takePicture();
                          final bytes = await file.readAsBytes();
                          homeController.images.add(bytes);
                        } catch (e) {
                          print('Error taking picture: $e');
                        }
                        // final link = AnchorElement(
                        //     href:
                        //         Uri.dataFromBytes(bytes, mimeType: 'image/png')
                        //             .toString());

                        // link.download = 'picture.png';
                        // link.click();
                        // link.remove();
                      },
                child: Text(
                  'ถ่ายภาพ',
                  style: textStyle(context, fontSize: 16, color: colorBlue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
