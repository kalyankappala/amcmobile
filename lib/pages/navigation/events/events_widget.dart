import 'package:amcmobile/pages/navigation/events/events_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:amcmobile/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EventsListView extends GetView<EventsController>{
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
        child: controller.events.isEmpty ?  loading():
             SmartRefresher(enablePullDown: true,
                 onRefresh: controller.getdata(),
                 controller: controller.refreshController,

      child:    ListView.builder(
            itemCount: controller.events.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i,) => CreateItem(i,controller,)

       ),
            )
    ));

  }
}
Widget CreateItem(int i,EventsController controller,){
  var Date =new DateTime.fromMicrosecondsSinceEpoch(controller.events[i]["to"]["timestamp"]* 1000);
  var DateFor=DateFormat('dd/MM/yyyy').format(Date);
  var Time=DateFormat('HH:mm:ss ').format(Date);
  var status=controller.events[i]["to"]["quality"].toString();
  return Container(
      height: 70,
     // padding: const EdgeInsets.all(),
      child: Card(
          elevation: 5,
          shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Table(
                  children: [
                    TableRow(
                        children:[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(controller.events[i]["pointName"].toString(),style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
                            ],
                          ),
                          Column(
                            children: [
                              Text(Time.toString()+""+"\n"+DateFor.toString(), style: TextStyle( fontSize: 13, ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text(status.toString(),style: TextStyle(color:status =="ON" ? Colors.red : Colors.green,fontSize: 14,height:2,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                            ],
                          )
                        ]
                    ),
                  ],
                ),
              ]
          )
      )
  );
}