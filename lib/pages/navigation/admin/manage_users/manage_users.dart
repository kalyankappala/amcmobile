/*
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:amcmobile/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../admin_controller.dart';
import 'manage_user_controller.dart';

class ManageUsers extends GetView<ManageUsersController>{
  @override
  Widget build(BuildContext context){

    return Obx(()=>Scaffold(
        body: SmartRefresher(
            enablePullDown: true,
            controller: controller.refreshController,
            onRefresh: () => controller.getData(),
            child: controller.users.isEmpty ? Center(child:Text("Loading, please wait....",style: TextStyle(fontSize: 18),)) : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  SizedBox(height: 5,),
                  Container(
                    decoration: AppTheme.boxDecorationStyle(),
                    padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                    // color: AppColors.getContainerColor(),
                    child:Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(controller.timestamp.value))  , style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color:AppColors.getDynamicTextColor()),),
                        Text(DateFormat('EEEE dd/MM').format(DateTime.fromMillisecondsSinceEpoch(controller.timestamp.value)), style: TextStyle(fontSize: 11.0,fontWeight: FontWeight.bold,color:AppColors.getDynamicTextColor()),)
                      ],
                    ),
                  ),

                  Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: controller.users.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => createUser(controller, index),
                      )
                  )
                ]
            )
        )
    )
    );
  }

  Widget createUser(ManageUsersController controller, int index) {
    return Card(
      elevation: 5,
      child: ExpansionTile(
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Text(controller.users[index]['name'].toString().toUpperCase().substring(0,1),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                backgroundColor: controller.users[index]['status'] == 'ONLINE' ? Colors.green : Colors.grey,
                // backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)][Random().nextInt(9) * 100]),
              ),
              SizedBox(width: 10,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.users[index]['name'], style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(controller.users[index]['position'],style: TextStyle(fontSize: 11),),
                  Text(controller.users[index]['user'], style: TextStyle(fontSize: 10),),
                  Text(controller.users[index]['ipAddress'], style: TextStyle(fontSize: 10),),
                ],
              )
              ),
              */
/*IconButton(
                  onPressed: (){
                    Get.defaultDialog(
                        barrierDismissible: false,
                        title: 'Alert',
                        content: Text('Are you sure want to Logout '+controller.users[index]['name']),
                        textCancel: 'Cancel',
                        textConfirm: 'Logout',
                        onConfirm: ()=>controller.forceLogout(controller.users[index]['user'],controller.users[index]['status'])
                    );
                  }, icon: Icon(Icons.power_settings_new)
              )*//*

            ],
          ),
          children: (controller.users[index]['details'] as Map).entries.map((entry) {
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
          }).toList()
      ),
    );
  }

}*/
