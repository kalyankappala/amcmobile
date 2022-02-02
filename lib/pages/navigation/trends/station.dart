import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/trends/trends_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class station extends GetView<TrendsController>{
  @override
  Widget build(BuildContext context) {

    return Obx(()=> Container(
      margin: EdgeInsets.all(0),
     color: Colors.transparent,
     // color:Colors.blue,// AppColors.getThemeColor(),
      child:Container(
        height: 40,
        child:Padding(
          padding: EdgeInsets.fromLTRB(15, 2, 8,2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              DropdownButton<Map>(
                  hint:Text("Select item",style: TextStyle(color: Colors.green),),
                  value: controller.selectedStation.value,
                  items: createDropdownMenuItems(controller),
                  // onChanged:(item){controller.onSelectMenuItem(item!);}

                  onChanged:(value)=> controller.onSelectStation(value!)
              ),
              DropdownButton<Map>(
                  hint:Text("Select item",style: TextStyle(color: Colors.green),),
                  value: controller.selectedPoint.value,
                  items: createDropdownMenuItems2(controller),
                  // onChanged:(item){controller.onSelectMenuItem(item!);}

                  onChanged:(value)=> controller.onSelectPoint(value!)

              ),
            ],
          ),
        ),
      ),
    ));
  }

}

List<DropdownMenuItem<Map>> createDropdownMenuItems(TrendsController controller){
  List<DropdownMenuItem<Map>> list=[];
  controller.stations.value.forEach((station) {
    DropdownMenuItem<Map> widget=DropdownMenuItem<Map>(
      value: station,
      child: Text(station['name'],),
    );
    list.add(widget);
  });
  return list;
}


List<DropdownMenuItem<Map>> createDropdownMenuItems2(TrendsController controller){
  List<DropdownMenuItem<Map>> list=[];
  controller.spoints.value.forEach((spoint) {
    DropdownMenuItem<Map> widget=DropdownMenuItem<Map>(
      value: spoint,
      child: Text(spoint['pointId'],),
    );
    list.add(widget);
  });
  return list;
}