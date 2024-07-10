import 'package:disaster/cookie/cookie.dart';
import 'package:disaster/router.dart';
import 'package:disaster/screen/handler/creatotherslist/creatotherlist.dart';
import 'package:disaster/service/config.dart';
import 'package:disaster/stye/font.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/apiservice/createevenapi.dart';
import '../../../api/apiservice/logintoken.dart';
import '../../../api/authapi/checkapikey.dart';
import '../../../api/latlongapi.dart';
import '../../../model/profileusermodel.dart';
import '../../../service/recheckkeyapi.dart';
import '../../../stye/colors.dart';
import '../../createlist/viewcreatelist.dart';
import '../../dashboard/viewdashboard.dart';
import '../../detail/viewdetail.dart';
import '../../detailfreeform/viewdetailform.dart';
import '../../editfreeformuser/editfreeform.dart';
import '../../home.dart';
import '../../report/firereport/viewfirereport.dart';
import '../../report/floodreport/viewfloodreport.dart';
import '../../report/forestfirereport/viewforestfirereport.dart';
import '../../report/freeformreport/viewfreeformreport.dart';
import '../../report/mainreport/viewmainreport.dart';
import '../../report/mainreport/viewmainreport.dart';
import '../../report/winestormreport/viewwinestormreport.dart';
import '../../systemadmin/viewsystemadmin.dart';
import 'contollerdraweradmin.dart';

class LandingPageAdmin extends StatefulWidget {
  @override
  State<LandingPageAdmin> createState() => _LandingPageAdminState();
}

enum SampleItem { itemOne }

class _LandingPageAdminState extends State<LandingPageAdmin> {
  // final TextStyle unselectedLabelStyle = TextStyle(
  //     color: Colors.white.withOpacity(0.5),
  //     fontWeight: FontWeight.w500,
  //     fontSize: );

  // final TextStyle selectedLabelStyle = const TextStyle(
  //     color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
  SampleItem? selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkApiKey();
    checkUser();
    // getToken();
    // getToken();
    // // HttpRequest.signOutToken();
    // createEvenApi();
  }

  checkUser() async {
    final LandingPageControllerAdmin landingPageController =
        Get.put(LandingPageControllerAdmin(), permanent: false);

    List<ProfileSaveModel>? listUser = await CookieSP().loadAllDataSetting();
    if (listUser!.isNotEmpty) {
      landingPageController.dataUser!.value = listUser.last;
      setState(() {
        isAdmin = (listUser.last.profile!.role == 3) ? false : true;
      });
    } else {
      Get.offAndToNamed(RouterName.userPage);
    }
  }

  Widget build(BuildContext context) {
    final LandingPageControllerAdmin landingPageController =
        Get.put(LandingPageControllerAdmin(), permanent: false);
    double screenWidth = MediaQuery.of(context).size.width;
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
                Container(
                  margin: EdgeInsets.zero,
                  height: 55,
                  width: 220,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo/logoooo.png'),
                          fit: BoxFit.cover)),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                // Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding:  EdgeInsets.zero,
                //         child: Text(
                //           'กระทรวงมหาดไทย',
                //           style: textStyle(context,
                //               fontWeight: FontWeight.bold, fontSize: 30),
                //         ),
                //       ),
                //       Padding(
                //         padding:  EdgeInsets.zero,
                //         child: Text(
                //           'Ministry of Interior. Thailand',
                //           style: textStyle(context, fontSize: 10),
                //         ),
                //       ),
                //     ])
              ],
            ),
          ),
        ),
        actions: screenWidth >= 1130
            ? [
                Obx(
                  () => Row(
                    children: [
                      Text(
                          (landingPageController.dataUser!.value.profile ==
                                  null)
                              ? 'Unknow'
                              : landingPageController
                                      .dataUser!.value.profile!.name ??
                                  'Unknow',
                          style: textStyle(context,fontSize: 25)),
                      SizedBox(
                        width: 10,
                      ),
                      PopupMenuButton<SampleItem>(
                        initialValue: selectedItem,
                        onSelected: (SampleItem item) async {
                          Get.offAndToNamed(RouterName.userPage);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          CookieSP().delDataUser();
                          landingPageController.dataUser =
                              ProfileSaveModel().obs;
                          landingPageController.dataUserAdmin.value.profile =
                              null;
                          await prefs.remove('apikey');
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<SampleItem>>[
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.itemOne,
                            child: Text(
                              'ออกจากระบบ',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
              ]
            : null,
        // actions: [
        //   Obx(
        //     () => Row(
        //       children: [
        //         Text(
        //             (landingPageController.dataUser!.value.profile == null)
        //                 ? 'Unknow'
        //                 : landingPageController.dataUser!.value.profile!.name ??
        //                     'Unknow',
        //             style: TextStyle(fontSize: 15)),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         PopupMenuButton<SampleItem>(
        //           initialValue: selectedItem,
        //           onSelected: (SampleItem item) async {
        //             Get.offAndToNamed(RouterName.userPage);
        //             SharedPreferences prefs =
        //                 await SharedPreferences.getInstance();
        //             CookieSP().delDataUser();
        //             landingPageController.dataUser = ProfileSaveModel().obs;
        //             landingPageController.dataUserAdmin.value.profile = null;
        //             await prefs.remove('apikey');
        //           },
        //           itemBuilder: (BuildContext context) =>
        //               <PopupMenuEntry<SampleItem>>[
        //             const PopupMenuItem<SampleItem>(
        //               value: SampleItem.itemOne,
        //               child: Text(
        //                 'ออกจากระบบ',
        //                 style: TextStyle(fontSize: 15),
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //       ],
        //     ),
        //   )
        // ],
      ),
      endDrawer: screenWidth <= 1130
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Drawer(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      enabled: false,
                      title: Text(
                        (landingPageController.dataUser!.value.profile == null)
                            ? 'Unknow'
                            : landingPageController
                                    .dataUser!.value.profile!.name ??
                                'Unknow',
                        style: textStyle(context,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: colorBlack),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.home,
                        color: colorBlack,
                        size: 22,
                      ),
                      title: Text(
                        'แดชบอร์ด',
                        style: textStyle(context,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            color: colorBlack),
                      ),
                      onTap: () {
                        landingPageController.tabIndex(0);
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        color: colorBlack,
                        'assets/icons/svg/reportmain.svg',
                      ),
                      title: Text(
                        'ดูรายงาน',
                        style: textStyle(context,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            color: colorBlack),
                      ),
                      onTap: () {
                        landingPageController.tabIndex(1);
                      },
                    ),
                    // ExpansionTile(
                    //   leading: SvgPicture.asset(
                    //     color: colorBlack,
                    //     'assets/icons/svg/reportmain.svg',
                    //   ),
                    //   title: Text(
                    //     'ดูรายงาน',
                    //     style: textStyle(context,
                    //         fontSize: 30,
                    //         fontWeight: FontWeight.w200,
                    //         color: colorBlack),
                    //   ),
                    //   onExpansionChanged: (value) {
                    //     if (value) {
                    //       landingPageController.tabIndex(1);
                    //     }
                    //   },
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8),
                    //       child: ListTile(
                    //         leading: SvgPicture.asset(
                    //           'assets/icons/svg/report1.svg',
                    //         ),
                    //         title: Text(
                    //           'รายงานอัคคีภัย',
                    //           style: textStyle(context,
                    //               fontSize: 30,
                    //               fontWeight: FontWeight.w200,
                    //               color: colorBlack),
                    //         ),
                    //         onTap: () {
                    //           landingPageController.tabIndex(2);
                    //         },
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8),
                    //       child: ListTile(
                    //         leading: SvgPicture.asset(
                    //           'assets/icons/svg/report2.svg',
                    //         ),
                    //         title: Text(
                    //           'รายงานอุทกภัย',
                    //           style: textStyle(context,
                    //               fontSize: 30,
                    //               fontWeight: FontWeight.w200,
                    //               color: colorBlack),
                    //         ),
                    //         onTap: () {
                    //           landingPageController.tabIndex(3);
                    //         },
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8),
                    //       child: ListTile(
                    //         leading: SvgPicture.asset(
                    //           'assets/icons/svg/report3.svg',
                    //         ),
                    //         title: Text(
                    //           'รายงานวาตภัย',
                    //           style: textStyle(context,
                    //               fontSize: 30,
                    //               fontWeight: FontWeight.w200,
                    //               color: colorBlack),
                    //         ),
                    //         onTap: () {
                    //           landingPageController.tabIndex(4);
                    //         },
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8),
                    //       child: ListTile(
                    //         leading: SvgPicture.asset(
                    //           'assets/icons/svg/report4.svg',
                    //         ),
                    //         title: Text(
                    //           'รายงานไฟป่า',
                    //           style: textStyle(context,
                    //               fontSize: 30,
                    //               fontWeight: FontWeight.w200,
                    //               color: colorBlack),
                    //         ),
                    //         onTap: () {
                    //           landingPageController.tabIndex(5);
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    if (isAdmin)
                      ListTile(
                        leading: Icon(
                          CupertinoIcons.list_bullet,
                          color: colorBlack,
                          size: 22,
                        ),
                        title: Text(
                          'สร้างรายการ',
                          style: textStyle(context,
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: colorBlack),
                        ),
                        onTap: () {
                          landingPageController.tabIndex(2);
                        },
                      ),
                    if (landingPageController.dataUser!.value.profile!=null) if (landingPageController.dataUser!.value.profile!.role==1)
                      ListTile(
                        leading: Icon(
                          Icons.supervised_user_circle,
                          color: colorBlack,
                          size: 22,
                        ),
                        title: Text(
                          'จัดการผู้ใช้งาน',
                          style: textStyle(context,
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                              color: colorBlack),
                        ),
                        onTap: () {
                          landingPageController.tabIndex(4);
                        },
                      ),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.square_arrow_right,
                        color: colorBlack,
                        size: 22,
                      ),
                      title: Text(
                        'ออกจากระบบ',
                        style: textStyle(context,
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            color: colorBlack),
                      ),
                      onTap: () async {
                        Get.offAndToNamed(RouterName.userPage);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        CookieSP().delDataUser();
                        landingPageController.dataUser = ProfileSaveModel().obs;
                        landingPageController.dataUserAdmin.value.profile =
                            null;
                        await prefs.remove('apikey');
                      },
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Obx(() => Row(
            children: [
              screenWidth >= 1130
                  ? Container(
                      width: 250,
                      color: colorBackground,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                landingPageController.tabIndex(0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      (landingPageController.tabIndex.value ==
                                              0)
                                          ? Colors.amber
                                          : Colors.transparent,
                                ),
                                padding:
                                    const EdgeInsets.only(left: 35, right: 10),
                                height: 40,
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.home,
                                      color: (landingPageController
                                                  .tabIndex.value ==
                                              0)
                                          ? Colors.white
                                          : Color(0xfff5a607f),
                                      size: 22,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'แดชบอร์ด',
                                      style: textStyle(context,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: (landingPageController
                                                      .tabIndex.value ==
                                                  0)
                                              ? Colors.white
                                              : Color(0xfff5a607f)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                landingPageController.tabIndex(1);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      (landingPageController.tabIndex.value ==
                                              1)
                                          ? Colors.amber
                                          : Colors.transparent,
                                ),
                                padding:
                                    const EdgeInsets.only(left: 35, right: 10),
                                height: 40,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      color: (landingPageController
                                                  .tabIndex.value ==
                                              1)
                                          ? Colors.white
                                          : Color(0xfff5a607f),
                                      'assets/icons/svg/reportmain.svg',
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'ดูรายงาน',
                                      style: textStyle(context,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200,
                                          color: (landingPageController
                                                      .tabIndex.value ==
                                                  1)
                                              ? Colors.white
                                              : Color(0xfff5a607f)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // if (landingPageController.tabIndex.value > 0 &&
                            //     landingPageController.tabIndex.value < 6)
                            //   Column(children: [
                            //     InkWell(
                            //       onTap: () {
                            //         landingPageController.tabIndex(2);
                            //       },
                            //       child: Container(
                            //         padding: const EdgeInsets.only(
                            //             left: 60, right: 10),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController
                            //                       .tabIndex.value ==
                            //                   2)
                            //               ? Colors.amber
                            //               : Colors.transparent,
                            //         ),
                            //         height: 30,
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               color: (landingPageController
                            //                           .tabIndex.value ==
                            //                       2)
                            //                   ? Colors.white
                            //                   : Color(0xfff5a607f),
                            //               'assets/icons/svg/report1.svg',
                            //             ),
                            //             const SizedBox(
                            //               width: 20,
                            //             ),
                            //             Text(
                            //               'รายงานอัคคีภัย',
                            //               style: textStyle(context,
                            //                   fontSize: 30,
                            //                   fontWeight: FontWeight.w200,
                            //                   color: (landingPageController
                            //                               .tabIndex.value ==
                            //                           2)
                            //                       ? Colors.white
                            //                       : Color(0xfff5a607f)),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       height: 10,
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         landingPageController.tabIndex(3);
                            //       },
                            //       child: Container(
                            //         padding: const EdgeInsets.only(
                            //             left: 60, right: 10),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController
                            //                       .tabIndex.value ==
                            //                   3)
                            //               ? Colors.amber
                            //               : Colors.transparent,
                            //         ),
                            //         height: 30,
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               color: (landingPageController
                            //                           .tabIndex.value ==
                            //                       3)
                            //                   ? Colors.white
                            //                   : Color(0xfff5a607f),
                            //               'assets/icons/svg/report2.svg',
                            //             ),
                            //             const SizedBox(
                            //               width: 20,
                            //             ),
                            //             Text(
                            //               'รายงานอุทกภัย',
                            //               style: textStyle(context,
                            //                   fontSize: 30,
                            //                   fontWeight: FontWeight.w200,
                            //                   color: (landingPageController
                            //                               .tabIndex.value ==
                            //                           3)
                            //                       ? Colors.white
                            //                       : Color(0xfff5a607f)),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       height: 10,
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         landingPageController.tabIndex(4);
                            //       },
                            //       child: Container(
                            //         padding: const EdgeInsets.only(
                            //             left: 60, right: 10),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController
                            //                       .tabIndex.value ==
                            //                   4)
                            //               ? Colors.amber
                            //               : Colors.transparent,
                            //         ),
                            //         height: 30,
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               color: (landingPageController
                            //                           .tabIndex.value ==
                            //                       4)
                            //                   ? Colors.white
                            //                   : Color(0xfff5a607f),
                            //               'assets/icons/svg/report3.svg',
                            //             ),
                            //             const SizedBox(
                            //               width: 20,
                            //             ),
                            //             Text(
                            //               'รายงานวาตภัย',
                            //               style: textStyle(context,
                            //                   fontSize: 30,
                            //                   fontWeight: FontWeight.w200,
                            //                   color: (landingPageController
                            //                               .tabIndex.value ==
                            //                           4)
                            //                       ? Colors.white
                            //                       : Color(0xfff5a607f)),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       height: 10,
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         landingPageController.tabIndex(5);
                            //       },
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController
                            //                       .tabIndex.value ==
                            //                   5)
                            //               ? Colors.amber
                            //               : Colors.transparent,
                            //         ),
                            //         padding: const EdgeInsets.only(
                            //             left: 60, right: 10),
                            //         height: 30,
                            //         child: Row(
                            //           children: [
                            //             SvgPicture.asset(
                            //               color: (landingPageController
                            //                           .tabIndex.value ==
                            //                       5)
                            //                   ? Colors.white
                            //                   : Color(0xfff5a607f),
                            //               'assets/icons/svg/report4.svg',
                            //             ),
                            //             const SizedBox(
                            //               width: 20,
                            //             ),
                            //             Text(
                            //               'รายงานไฟป่า',
                            //               style: textStyle(context,
                            //                   fontSize: 30,
                            //                   fontWeight: FontWeight.w200,
                            //                   color: (landingPageController
                            //                               .tabIndex.value ==
                            //                           5)
                            //                       ? Colors.white
                            //                       : Color(0xfff5a607f)),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ]),
                            // InkWell(
                            //   onTap: () {
                            //     landingPageController.tabIndex(9);
                            //   },
                            //   child: Container(
                            //     padding: const EdgeInsets.only(left: 35, right: 10),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: (landingPageController.tabIndex.value == 9)
                            //           ? Colors.amber
                            //           : Colors.transparent,
                            //     ),
                            //     height: 40,
                            //     child: Row(
                            //       children: [
                            //         SvgPicture.asset(
                            //           color:
                            //           (landingPageController.tabIndex.value ==
                            //               9)
                            //               ? Colors.white
                            //               : Color(0xfff5a607f),
                            //           'assets/icons/svg/freeform.svg',
                            //         ),
                            //         const SizedBox(
                            //           width: 20,
                            //         ),
                            //         Text(
                            //           'รายงานอื่นๆ',
                            //           style: textStyle(context,
                            //               fontSize: 30,
                            //               fontWeight: FontWeight.w200,
                            //               color:
                            //               (landingPageController.tabIndex.value ==
                            //                   9)
                            //                   ? Colors.white
                            //                   : Color(0xfff5a607f)),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // ExpansionTileItem(
                            //   border: Border.all(color:Colors.transparent),
                            //   title: InkWell(
                            //     child: Container(
                            //       padding: const EdgeInsets.only(left: 20,right: 10),
                            //       height: 30,
                            //       child: const Row(
                            //         children: [
                            //           Icon(CupertinoIcons.chart_bar_fill,color: Colors.grey,size: 20,),
                            //           SizedBox(width: 20,),
                            //           Text('ดูรายงาน'),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            //   children: [
                            //     InkWell(
                            //       onTap: (){
                            //         landingPageController.tabIndex(1);
                            //       },
                            //       child: Container(
                            //         padding: const EdgeInsets.only(left: 60,right: 10),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController.tabIndex.value==1)?Colors.amber:Colors.transparent,
                            //         ),
                            //         height: 30,
                            //         child: const Row(
                            //           children: [
                            //             Icon(CupertinoIcons.chart_bar_fill,color: Colors.grey,size: 20,),
                            //             SizedBox(width: 20,),
                            //             Text('ดูรายงาน'),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(height: 10,),
                            //     InkWell(
                            //       onTap: (){
                            //         landingPageController.tabIndex(2);
                            //       },
                            //       child: Container(
                            //         padding: const EdgeInsets.only(left: 60,right: 10),
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(10),
                            //             color: (landingPageController.tabIndex.value==2)?Colors.amber:Colors.transparent,
                            //         ),
                            //         height: 30,
                            //         child: const Row(
                            //           children: [
                            //             Icon(CupertinoIcons.chart_bar_fill,color: Colors.grey,size: 20,),
                            //             SizedBox(width: 20,),
                            //             Text('ดูรายงาน'),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(height: 10,),
                            //     InkWell(
                            //       onTap: (){
                            //         landingPageController.tabIndex(3);
                            //       },
                            //       child: Container(
                            //         padding: const EdgeInsets.only(left: 60,right: 10),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController.tabIndex.value==3)?Colors.amber:Colors.transparent,
                            //         ),
                            //         height: 30,
                            //         child: const Row(
                            //           children: [
                            //             Icon(CupertinoIcons.chart_bar_fill,color: Colors.grey,size: 20,),
                            //             SizedBox(width: 20,),
                            //             Text('ดูรายงาน'),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(height: 10,),
                            //     InkWell(
                            //       onTap: (){
                            //         landingPageController.tabIndex(4);
                            //       },
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: (landingPageController.tabIndex.value==4)?Colors.amber:Colors.transparent,
                            //         ),
                            //         padding: const EdgeInsets.only(left: 60,right: 10),
                            //         height: 30,
                            //         child: const Row(
                            //           children: [
                            //             Icon(CupertinoIcons.chart_bar_fill,color: Colors.grey,size: 20,),
                            //             SizedBox(width: 20,),
                            //             Text('ดูรายงาน'),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            if (isAdmin)
                              InkWell(
                                onTap: () {
                                  landingPageController.tabIndex(2);
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                2)
                                            ? Colors.amber
                                            : Colors.transparent,
                                  ),
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.list_bullet,
                                        color: (landingPageController
                                                    .tabIndex.value ==
                                                2)
                                            ? Colors.white
                                            : Color(0xfff5a607f),
                                        size: 22,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'สร้างรายการ',
                                        style: textStyle(context,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w200,
                                            color: (landingPageController
                                                        .tabIndex.value ==
                                                    2)
                                                ? Colors.white
                                                : Color(0xfff5a607f)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (landingPageController.dataUser!.value.profile!=null) if (landingPageController.dataUser!.value.profile!.role==1)
                              InkWell(
                                onTap: () {
                                  landingPageController.tabIndex(4);
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                4)
                                            ? Colors.amber
                                            : Colors.transparent,
                                  ),
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.supervised_user_circle,
                                        color: (landingPageController
                                                    .tabIndex.value ==
                                                4)
                                            ? Colors.white
                                            : Color(0xfff5a607f),
                                        size: 22,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'จัดการผู้ใช้งาน',
                                        style: textStyle(context,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w200,
                                            color: (landingPageController
                                                        .tabIndex.value ==
                                                    4)
                                                ? Colors.white
                                                : Color(0xfff5a607f)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            // if(isAdmin) InkWell(
                            //   onTap: () {
                            //     landingPageController.tabIndex(8);
                            //   },
                            //   child: Container(
                            //     padding: const EdgeInsets.only(left: 35, right: 10),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: (landingPageController.tabIndex.value == 8)
                            //           ? Colors.amber
                            //           : Colors.transparent,
                            //     ),
                            //     height: 40,
                            //     child: Row(
                            //       children: [
                            //         Icon(
                            //           CupertinoIcons.list_bullet,
                            //           color:
                            //               (landingPageController.tabIndex.value == 8)
                            //                   ? Colors.white
                            //                   : Color(0xfff5a607f),
                            //           size: 22,
                            //         ),
                            //         const SizedBox(
                            //           width: 20,
                            //         ),
                            //         Text(
                            //           'สร้างรายการอื่นๆ',
                            //           style: textStyle(context,
                            //               fontSize: 30,
                            //               fontWeight: FontWeight.w200,
                            //               color:
                            //                   (landingPageController.tabIndex.value ==
                            //                           8)
                            //                       ? Colors.white
                            //                       : Color(0xfff5a607f)),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              screenWidth >= 1130
                  ? Container(
                      width: 2,
                      color: Colors.black12,
                    )
                  : Container(),
              Expanded(
                child:
                // (landingPageController.dataUser!.value.profile==null)?Center(
                //     child:
                //     LoadingAnimationWidget
                //         .inkDrop(
                //       color: Colors.white,
                //       size: 20,
                //     )):
                Container(
                  color: colorBackground,
                  height: MediaQuery.of(context).size.height,
                  width: 200,
                  child: IndexedStack(
                    index: landingPageController.tabIndex.value,
                    children: [
                      DashBoardPage(),
                      MainReport(),
                      // FireReport(),
                      // FloodReport(),
                      // WineStormReport(),
                      // ForestFireReport(),
                      CreateList(),
                      Detail(),
                      SystemAdminPage(),
                      // CreateListOthers(),
                      // FreeFormReport(),
                      // DetailFreeForm(),
                      // EditListFreeFormOthers(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
