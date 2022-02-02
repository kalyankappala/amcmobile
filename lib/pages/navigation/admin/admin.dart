import 'package:amcmobile/pages/navigation/admin/admin_controller.dart';
import 'package:amcmobile/pages/navigation/admin/login_history/user.dart';
import 'package:amcmobile/pages/navigation/admin/manage_users/manage_users.dart';
import 'package:amcmobile/pages/navigation/admin/overview/overview_page.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'application_logs/logs.dart';

class Admin extends GetView<AdminController>{
  @override
  Widget build(BuildContext context){
    context.theme;
    return Scaffold(
      appBar: adminAppbar(controller.title,),
      body: Container(
        child: ContainedTabBarView(
          tabBarProperties: TabBarProperties(
            background: Container(
              color: AppColors.getContainerColor(),
            ),
            labelColor: AppColors.getDynamicTextColor(),
          ),

          tabs: [
            Text('LoginHistory',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('ApplLogs',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Text('OverView',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          //  Text('Users',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

          ],

          views: [
            Users(),
            Logs(),
            OverviewPage(),
          //  ManageUsers(),
          ],
          initialIndex: 0,
         // onChange: (index)=>controller.onTabSelect(index),
        ),
      ),
      /*  body:    Container(
      child: ListView(
            children:<Widget> [
              Column(
                children: [
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.account_box_rounded)),
                          Text("ManageUsers",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.redAccent   ,onPressed: (){}, icon: Icon(Icons.access_time)),
                          Text("Login History",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.account_tree)),
                          Text("Manage Network",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.ad_units_outlined)),
                          Text("Application Logs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.apps)),
                          Text("Display Builder",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.account_box_rounded)),
                          Text("Config Builder",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.book)),
                          Text("Analog Calculation",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                  Card(
                    elevation: 20.0,
                    shadowColor: Colors.black,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.settings)),
                          Text("Manage Databse",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.getDynamicTextColor()),),
                        ],),
                    ),
                  ),
                ],
              )

            ],
          ),
        )*/

    );



  }
 /* Widget buildMenuItem(
      BuildContext context,{
        required String text,
        required IconData icon,
}){
    final color =Colors.white;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        selectedTileColor: Colors.red,

        leading: Icon(icon,color: color,),
        title: Text(text,style: TextStyle(color: color)),
        onTap: (){},
      ),
    );
  }
*/
}