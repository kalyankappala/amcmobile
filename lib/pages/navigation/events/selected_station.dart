import 'package:amcmobile/pages/navigation/events/events_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';



class SelectedStation extends GetView<EventsController>{
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Obx(()=> Column(
      children: [
        Container(
          margin: EdgeInsets.all(0),
          color: Colors.transparent,
          child:Container(
            decoration: BoxDecoration(
              border: Border(bottom:BorderSide(color: Colors.white70,width: 0)),),
            height: 40,
            child:Padding(
              padding: EdgeInsets.fromLTRB(15, 2, 8,2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<Map>(
                    hint:Text("Select item",style: TextStyle(color: Colors.white),),
                    value: controller.selectedStation.value,
                    items: createDropdownMenuItems(controller),
                    onChanged: (value)=> controller.onSelectStation(value!),
                  ),
                ],
              ),
            ),
          ),
        ),
       // SizedBox(height: 1,),

      ],
    ),
    );
  }

}
List<DropdownMenuItem<Map>> createDropdownMenuItems(EventsController controller){
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


