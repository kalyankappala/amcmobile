import 'dart:math';

import 'package:amcmobile/pages/navigation/admin/admin_controller.dart';
import 'package:amcmobile/pages/navigation/admin/login_history/user_controller.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

class Users extends GetView<UsersController>{
  @override
  Widget build(BuildContext context){
    return Obx(()=>Scaffold(
        body:  ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: controller.loginhistory.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => createUser(controller, index),
        )
    )
    );

  }
}

Widget createUser(UsersController controller, int index) {
  /*return Container(
    child: Text("dummy"),
  );*/
  return Card(
    elevation: 5,
    child: ExpansionTile(
      title: Row(
        children: [
          CircleAvatar(
              radius: 20,
              child: Text(controller.loginhistory[index]['username'].toString().toUpperCase().substring(0,1),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)][Random().nextInt(9) * 100]
          ),
          SizedBox(width: 10,),
          Expanded(child:
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.loginhistory[index]['username'] , style: TextStyle(fontWeight: FontWeight.bold),),
             //  Text(DateFormat('dd,MMM,yy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(controller.timestamp.value)),style: TextStyle(fontSize: 11),),
              //Text(controller.loginhistory[index]['ipAddress'], style: TextStyle(fontSize: 11),),
            ],
          )),
          IconButton(
              onPressed: (){
                Get.defaultDialog(
                    barrierDismissible: false,
                    title: 'Alert',
                    content: Text('Are you sure want to Logout '+controller.loginhistory[index]['username']),
                    textCancel: 'Cancel',
                    textConfirm: 'Logout',
                    onConfirm: ()=>controller.forceLogout(controller.loginhistory[index]['username'])
                );
              }, icon: Icon(Icons.power_settings_new)
          )
        ],
      ),
    /*  children: (controller.loginhistory[index] as Map).entries.map((entry) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.3,color: Colors.black,))),
              child:Row(
                children: [
                  Expanded(child:Text(entry.key),),
                  Expanded(child:Text(entry.value.toString()))
                ],
              )
          );
        }).toList()*/

      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.3,color: Colors.black,))),
          child: Row(
            children: [
              Text("UserName  :   " ,
                style: TextStyle(color: AppColors.getDynamicTextColor(),
                    fontSize: 14,fontWeight: FontWeight.bold
                ),),
              Text(controller.loginhistory[index]['username'] ,style: TextStyle(fontSize: 14),),
            ],
          ),

        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.3,color: Colors.black,))),
          child: Row(
            children: [
              Text("LastLogin :   " ,
                style: TextStyle(color: AppColors.getDynamicTextColor(),
                    fontSize: 14,fontWeight: FontWeight.bold
                ),),
              Text(DateFormat('dd,MMM,yy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(controller.loginhistory[index]['lastLogin'])),style: TextStyle(fontSize: 11),),
            ],
          ),

        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.3,color: Colors.black,))),
          child: Row(
            children: [
              Text("LastLogOut :   " ,
                style: TextStyle(color: AppColors.getDynamicTextColor(),
                    fontSize: 14,fontWeight: FontWeight.bold
                ),),
              Text(DateFormat('dd,MMM,yy HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(controller.loginhistory[index]['lastLogout'])),style: TextStyle(fontSize: 11),),

            ],
          ),

        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.3,color: Colors.black,))),
          child: Row(
            children: [
              Text("IpAddress :   " ,
                style: TextStyle(color: AppColors.getDynamicTextColor(),
                    fontSize: 14,fontWeight: FontWeight.bold
                ),),
              Text(controller.loginhistory[index]['ipAddress'], style: TextStyle(fontSize: 11),),


            ],
          ),

        ),

      ],
    ),
  );
}
