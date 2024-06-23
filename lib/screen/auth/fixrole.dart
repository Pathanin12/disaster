import 'package:disaster/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../model/profileusermodel.dart';
import '../../service/config.dart';

class FixRole extends StatefulWidget {
  const FixRole({super.key});

  @override
  State<FixRole> createState() => _FixRoleState();
}

class _FixRoleState extends State<FixRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            child:SvgPicture.asset(
              'assets/icons/iconlocation.svg',
              fit: BoxFit.cover,
            ) ,
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  isAdmin=true;
                  isVillager = false;
                  dataUser= ProfileModel(
                      profile: Profile(name:'Admin',
                          username: 'Admin@test.com',
                          refId: '67890'
                      )
                  );
                  Get.offAndToNamed(RouterName.adminPage);
                  // Get.re(RouterName.adminPage);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Text('ADMIN',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18
                  ),),
                ),
              ),
              InkWell(
                onTap: (){
                  isAdmin=false;
                  isVillager = false;
                  dataUser= ProfileModel(
                      profile: Profile(name:'เจ้าหน้าที่',
                          username: 'test@test.com',
                          refId: '12345'
                      )
                  );

                  Get.offAndToNamed(RouterName.adminPage);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Text('เจ้าหน้าที่',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18
                  ),),
                ),
              ),
              InkWell(
                onTap: (){
                  isVillager = true;
                  Get.offAndToNamed(RouterName.userPage);
                  // Get.toNamed(RouterName.userPage);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  child: Text('ชาวบ้าน',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18
                  ),),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
