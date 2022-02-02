
import 'package:amcmobile/domain/time_value_object.dart';
import 'package:amcmobile/pages/navigation/realtime/digital/digital_controller.dart';
import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:amcmobile/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DigitalPage extends GetView<RealTimeController>{
  @override
  Widget build(BuildContext context){
    return Obx(()=>Scaffold(
      body: Container(
         child: controller.digitalPoints.isEmpty ? loading():
         ListView.builder(
          itemCount: controller.digitalPoints.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, i,) => CreateItem2(i,controller,),
        ),
      ),
    )
    );

  }
  Widget CreateItem2 (int i,RealTimeController controller,) {
    var lastUpdatedValue=controller.digitalPoints[i]["lastUpdated"]["value"].toString();
    var colorState=controller.digitalPoints[i]["states"][lastUpdatedValue]['color'].toString();
    var statusText=controller.digitalPoints[i]["states"][lastUpdatedValue]["text"].toString();
    var colorCode=colorState.replaceAll('#', '0xff');
    var Date=new DateTime.fromMicrosecondsSinceEpoch(controller.digitalPoints[i]["lastUpdatedTimestamp"]*1000);
    var num = controller.digitalPoints[i]["lastUpdated"]['value'];
    var DateFor=DateFormat('dd/MM/yyyy').format(Date);
    var Time=DateFormat('HH:mm:ss ').format(Date);


  return Container(
    decoration: AppTheme.boxDecorationStyle(),

    child: Card(
      //elevation: 5,
      shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getThemeColor(), width: 1),),
      child: ExpansionTile(
          title: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              leading: CircleAvatar(
                radius: 25,
                child: Text(statusText,
                  style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              backgroundColor: Color(int.parse(colorCode)),
            ),
              title: Row(
                children: [

                 Expanded(child: Text( controller.digitalPoints[i]["name"],style: TextStyle(fontSize: 13), )),
                 SizedBox(height: 5,),
               ],
              )
        ),
        children: [
          Padding(padding: const EdgeInsets.all(0.0),
            child: Table(
              children: [
                TableRow(
                  decoration: BoxDecoration(color: AppColors.getDynamicTextColor()),
                  children: [
                    Text("  Name : " + controller.digitalPoints[i]["name"],
                      style: TextStyle(color: Colors.white,height: 2, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),


                TableRow(
                    children: [
                      Container(
                        height: 45,
                        padding: EdgeInsets.all(0),
                        child: Card(
                          elevation: 5,
                          shape: Border(left: BorderSide(color: AppColors.getDynamicTextColor(), width: 5,),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("DataType",),
                                  Text(":"),
                                  Text(controller.digitalPoints[i]["dataType"])
                                ],
                              )
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        height: 45,
                        padding: EdgeInsets.all(0),
                        child: Card(
                          elevation: 5,
                          shape: Border(left: BorderSide(color: AppColors.getDynamicTextColor(), width: 5)),

                          // shadowColor: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("IOA ",),
                                  Text(":"),
                                  Text(controller.digitalPoints[i]["ioa"].toString(),)
                                ],
                              )
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(0),
                        child: Card(
                          elevation: 5,
                          shape: Border(left: BorderSide(color: AppColors.getThemeColor(), width: 5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("L Updated"),
                                  Text(":"),
                                  Text(Time.toString()+""+"\n"+DateFor.toString(),)

                                ],
                              )
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                ),
              ],
            ),

          )
        ],
      ),
    ),
  );
}}