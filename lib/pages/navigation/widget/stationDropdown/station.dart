



import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/widget/stationDropdown/stationcontroller.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class station extends GetView<RealTimeController>{
  @override
  Widget build(BuildContext context) {

    return Obx(()=> Container(
      margin: EdgeInsets.all(0),
      color: Colors.transparent,
      child:Container(
        height: 40,
        child:Padding(
          padding: EdgeInsets.fromLTRB(15, 2, 8,2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton<Map>(
                hint:Text("Select item",style: TextStyle(color: AppColors.getDynamicTextColor()),),
                value: controller.selectedStation.value,
                items: createDropdownMenuItems(controller),
               // onChanged:(item){controller.onSelectMenuItem(item!);},
                onChanged: (value)=> controller.onSelectStation(value!),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
List<DropdownMenuItem<Map>> createDropdownMenuItems(RealTimeController controller){
  List<DropdownMenuItem<Map>> list=[];
  controller.stations.value.forEach((station) {
    DropdownMenuItem<Map> widget=DropdownMenuItem<Map>(
      value: station,
      child: Text(station['name']),
    );
    list.add(widget);
  });
  return list;
}


