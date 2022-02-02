import 'package:amcmobile/pages/navigation/realtime/analog/analopage1_widget.dart';
import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Analogpage1 extends GetView<RealTimeController>{
  @override
  Widget build(BuildContext context) {
    context.theme;
    return  Column(
      children: [
        Table(
          columnWidths: {0:FlexColumnWidth(.90),1:FlexColumnWidth(1.2),2:FlexColumnWidth(1),},
          border: TableBorder.all(color: AppColors.getDynamicTextColor(),width: 1,),
          children: [
            TableRow(

              decoration: BoxDecoration(color: Colors.white,),
              children: [
                Text('Ioa',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,height:1.5,fontSize: 16,fontWeight: FontWeight.bold) ),
                Text('Point Name',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,height:1.5,fontSize: 16,fontWeight: FontWeight.bold) ),
                Text('Timestamp',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,height:1.5,fontSize: 16,fontWeight: FontWeight.bold),),
                Text('value',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,height:1.5,fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
        SizedBox(height: 1,),
        Expanded(
          child: AnalogListview(),
        ),
      ],

    );
  }

}