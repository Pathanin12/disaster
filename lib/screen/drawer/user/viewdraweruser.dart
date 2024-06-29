import 'package:disaster/stye/font.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../api/apiservice/createevenapi.dart';
import '../../../api/apiservice/logintoken.dart';
import '../../../api/latlongapi.dart';
import '../../../router.dart';
import '../../../stye/colors.dart';
import '../../createlist/viewcreatelist.dart';
import '../../dashboard/viewdashboard.dart';
import '../../detail/viewdetail.dart';
import '../../home.dart';
import '../../report/firereport/viewfirereport.dart';
import '../../report/floodreport/viewfloodreport.dart';
import '../../report/forestfirereport/viewforestfirereport.dart';
import '../../report/mainreport/viewmainreport.dart';
import '../../report/mainreport/viewmainreport.dart';
import '../../report/winestormreport/viewwinestormreport.dart';
import 'contollerdraweruser.dart';

class LandingPageUser extends StatefulWidget {
  @override
  State<LandingPageUser> createState() => _LandingPageUserState();
}

class _LandingPageUserState extends State<LandingPageUser> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getToken();
    // getToken();
    // // HttpRequest.signOutToken();
    // createEvenApi();
  }

  Widget build(BuildContext context) {
    final LandingPageControllerUser landingPageController =
        Get.put(LandingPageControllerUser(), permanent: false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: InkWell(
          onTap: () {
            // Get.offAndToNamed(RouterName.fixRole);
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
                        style: textStyle(context, fontSize: 14),
                      ),
                    ])
              ],
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'Upload') {
                landingPageController.pickImage();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                value: 'Upload',
                child: Text(
                  'อัพโหลด',
                  style: textStyle(context, fontSize: 14),
                ),
              ),
            ],
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              size: 30,
            ),
          ),
          // InkWell(
          //   onTap: (){
          //     Get.offAndToNamed(RouterName.villager);
          //   },
          //   child: Icon(Icons.qr_code_scanner_sharp,size: 30,),
          // ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
      body: Obx(() => Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 200,
                  child: IndexedStack(
                    index: landingPageController.tabIndex.value,
                    children: [
                      DashBoardPage(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
