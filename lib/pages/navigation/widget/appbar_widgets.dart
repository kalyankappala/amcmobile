import 'package:amcmobile/pages/navigation/network/network_controller.dart';
import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

void showSnackBar(String title,String message){
  Get.snackbar(
    title, // title
    message,
    backgroundColor: Colors.black87,
    colorText: Colors.white,
    icon: Icon(Icons.alarm),
    shouldIconPulse: true,
    //barBlur: 20,
    isDismissible: true,
    duration: Duration(seconds: 4),
    snackPosition: SnackPosition.BOTTOM,
  );
}
Widget loading() {
  return Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: AppColors.getThemeColor(),
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          SizedBox(height: 10,),
          Text("Loading, please wait..."),
        ],
      )

  );

}
/*Widget loading() {
  return Center(
      child: Obx(()=>Get.find<ApiService>().networkStatus.value ?  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.blue,),
          SizedBox(height: 10,),
          Text("Loading, please wait..."),
        ],
      ) : Center(child:Text("Check Internet connection"))
      )
  );
}*/

AppBar navAppbar(){
  return AppBar(
    leadingWidth: 60,
   // backgroundColor: Colors.transparent,
    //centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
           // child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),
    actions: [
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

AppBar eventsAppbar(String title, String timestamp2,ApiService apiService){
  return AppBar(
    leadingWidth: 40,
    //backgroundColor: Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),
    actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(timestamp2.substring(11,19)+""+"\n"+timestamp2.substring(0,10)),
         // Text(timestamp);
         //Text(timestamp2.substring(11,19)+""+"\n"+timestamp2.substring(0,10)),
        ],
      ),
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

AppBar networkAppbar(String title, String timestamp2,ApiService apiService){
  var timestamp;
  return AppBar(
    leadingWidth: 40,
   /* shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),*/
   // backgroundColor: Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),
    actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    /*      Text(
            DateFormat.Hms().format(DateTime.now()),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(  DateFormat('EEEE dd/MM').format(DateTime.now()),
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
  ),*/
         // Text(timestamp2.substring(11,16))
          Text(timestamp2.substring(11,19)+""+"\n"+timestamp2.substring(0,10),)
        //  Text(timestamp2>0?DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(controller.timestamp.value)) :'' , style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.orange),),

          //Text(timestamp> 0 ? DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(timestamp)) : '' , style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.orange),),
         // Text(timestamp> 0 ? DateFormat('EEEE dd/MM').format(DateTime.fromMillisecondsSinceEpoch(timestamp)) : '', style: TextStyle(fontSize: 11.0,fontWeight: FontWeight.bold),)
        ],
      ),
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

AppBar createAppbar(String title,String timestamp2,ApiService apiService,){


  return AppBar(
    leadingWidth: 40,
   // backgroundColor:Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),

    actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


         // Text(timestamp2.substring(11,19)+""+"\n"+timestamp2.substring(0,10)),

          /*   Text(timestamp> 0 ? DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(timestamp)) : '' , style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
          Text(timestamp> 0 ? DateFormat('EEEE dd/MM').format(DateTime.fromMillisecondsSinceEpoch(timestamp)) : '', style: TextStyle(fontSize: 11.0,fontWeight: FontWeight.bold),)
*/
   ]),
      /* IconButton(icon: Icon(Icons.notifications),
        onPressed: ()=> Get.isDarkMode? Get.changeTheme(ThemeData.light()):Get.changeTheme(ThemeData.dark()),),*/
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => apiService.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem<MapEntry>(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}
AppBar trendsAppbar(String title,){
  return AppBar(
    leadingWidth: 40,
   // backgroundColor: Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),
    actions: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  Text(timestamp2.substring(11,19)+""+"\n"+timestamp2.substring(0,10)),
          ]
      ),
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

AppBar reportsAppbar(String title,){
  return AppBar(
    leadingWidth: 40,
   // backgroundColor: Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),

        ]),

    actions: [
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

AppBar sldcAppbar(String title,){
  return AppBar(
    leadingWidth: 40,
   // backgroundColor: Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),
    actions: [
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.black,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

AppBar adminAppbar(String title,){
  return AppBar(
    leadingWidth: 40,
   // backgroundColor: Colors.transparent,
    centerTitle: false,
    titleSpacing: 0,
    title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.asset("assets/gridx.png",width: 100,height: 50,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,0),
            child: Text(title,style: TextStyle(fontSize: 15)),
          ),
        ]
    ),
    actions: [
      PopupMenuButton<MapEntry>(
          icon: Icon(Icons.more_vert,color: Colors.white,),
          tooltip: 'Actions',
          elevation: 20,
          onSelected:(entry)=>entry.value.call(),
          itemBuilder: (context) => ApiService.to.authenticatedMenuItems.entries.map((entry) =>
              PopupMenuItem(
                value: entry,
                child: Text(entry.key.toString()),
              )).toList()
      ),
    ],
  );
}

