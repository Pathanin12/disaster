import 'package:disaster/screen/handler/creatotherslist/creatotherlist.dart';
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
import 'contollerdraweradmin.dart';

class LandingPageAdmin extends StatefulWidget {
  @override
  State<LandingPageAdmin> createState() => _LandingPageAdminState();
}

class _LandingPageAdminState extends State<LandingPageAdmin> {
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
    final LandingPageControllerAdmin landingPageController =
        Get.put(LandingPageControllerAdmin(), permanent: false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: Row(
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
      body: Obx(() => Row(
            children: [
              Container(
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
                            color: (landingPageController.tabIndex.value == 0)
                                ? Colors.amber
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.only(left: 35, right: 10),
                          height: 40,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.home,
                                color:
                                    (landingPageController.tabIndex.value == 0)
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color:
                                        (landingPageController.tabIndex.value ==
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
                            color: (landingPageController.tabIndex.value == 1)
                                ? Colors.amber
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.only(left: 35, right: 10),
                          height: 40,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                color:
                                    (landingPageController.tabIndex.value == 1)
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                1)
                                            ? Colors.white
                                            : Color(0xfff5a607f)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (landingPageController.tabIndex.value > 0 &&
                          landingPageController.tabIndex.value < 6)
                        Column(children: [
                          InkWell(
                            onTap: () {
                              landingPageController.tabIndex(2);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    (landingPageController.tabIndex.value == 2)
                                        ? Colors.amber
                                        : Colors.transparent,
                              ),
                              height: 30,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                2)
                                            ? Colors.white
                                            : Color(0xfff5a607f),
                                    'assets/icons/svg/report1.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'รายงานอัคคีภัย',
                                    style: textStyle(context,
                                        fontSize: 16,
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
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              landingPageController.tabIndex(3);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    (landingPageController.tabIndex.value == 3)
                                        ? Colors.amber
                                        : Colors.transparent,
                              ),
                              height: 30,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                3)
                                            ? Colors.white
                                            : Color(0xfff5a607f),
                                    'assets/icons/svg/report2.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'รายงานอุทกภัย',
                                    style: textStyle(context,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: (landingPageController
                                                    .tabIndex.value ==
                                                3)
                                            ? Colors.white
                                            : Color(0xfff5a607f)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              landingPageController.tabIndex(4);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    (landingPageController.tabIndex.value == 4)
                                        ? Colors.amber
                                        : Colors.transparent,
                              ),
                              height: 30,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                4)
                                            ? Colors.white
                                            : Color(0xfff5a607f),
                                    'assets/icons/svg/report3.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'รายงานวาตภัย',
                                    style: textStyle(context,
                                        fontSize: 16,
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
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              landingPageController.tabIndex(5);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    (landingPageController.tabIndex.value == 5)
                                        ? Colors.amber
                                        : Colors.transparent,
                              ),
                              padding:
                                  const EdgeInsets.only(left: 60, right: 10),
                              height: 30,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                5)
                                            ? Colors.white
                                            : Color(0xfff5a607f),
                                    'assets/icons/svg/report4.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'รายงานไฟป่า',
                                    style: textStyle(context,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w200,
                                        color: (landingPageController
                                                    .tabIndex.value ==
                                                5)
                                            ? Colors.white
                                            : Color(0xfff5a607f)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
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
                      InkWell(
                        onTap: () {
                          landingPageController.tabIndex(6);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 35, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (landingPageController.tabIndex.value == 6)
                                ? Colors.amber
                                : Colors.transparent,
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.list_bullet,
                                color:
                                    (landingPageController.tabIndex.value == 6)
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                6)
                                            ? Colors.white
                                            : Color(0xfff5a607f)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          landingPageController.tabIndex(8);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 35, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (landingPageController.tabIndex.value == 8)
                                ? Colors.amber
                                : Colors.transparent,
                          ),
                          height: 40,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.list_bullet,
                                color:
                                    (landingPageController.tabIndex.value == 8)
                                        ? Colors.white
                                        : Color(0xfff5a607f),
                                size: 22,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'สร้างรายการอื่นๆ',
                                style: textStyle(context,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    color:
                                        (landingPageController.tabIndex.value ==
                                                8)
                                            ? Colors.white
                                            : Color(0xfff5a607f)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 2,
                color: Colors.black12,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: 200,
                  child: IndexedStack(
                    index: landingPageController.tabIndex.value,
                    children: [
                      DashBoardPage(),
                      MainReport(),
                      MainReport(),
                      MainReport(),
                      MainReport(),
                      MainReport(),
                      // FireReport(),
                      // FloodReport(),
                      // WineStormReport(),
                      // ForestFireReport(),
                      CreateList(),
                      Detail(),
                      CreateListOthers(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
