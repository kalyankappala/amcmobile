import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:amcmobile/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget Devices(i,controller){
  var Date =new DateTime.fromMicrosecondsSinceEpoch(controller.device[i]["currentStatus"]["timestamp"]* 1000);
  var DateFor=DateFormat('dd,MMM').format(Date);
  var Time=DateFormat('HH:mm:ss').format(Date);
  var grade = controller.device[i]["currentStatus"]["state"].toString();
  var IP= controller.device[i]["connectionParameters"]["host"];
  var DeviceName = controller.device[i]["name"].toString();
  if(grade == "CONNECTED"){
    return DeviceData(grade,DateFor.toString(),Time.toString(),DeviceName,Color(0xffaaf200),IP);
  }else if(grade == "DISCONNECTED"){
    return DeviceData(grade,DateFor.toString(),Time.toString(),DeviceName,Color(0xffff1744),IP);
  }else if(grade == "RECEIVING_DATA"){
    return DeviceData(grade,DateFor.toString(),Time.toString(),DeviceName,Color(0xff00b0ff),IP);
  }else{
    return DeviceData(grade,DateFor.toString(),Time.toString(),DeviceName,Colors.orange,IP);
  }
}
/*Widget CreateItem( i, controller,) {
  var Date =new DateTime.fromMicrosecondsSinceEpoch(controller.device[i]["currentStatus"]["timestamp"]* 1000);
  var DateFor=DateFormat('dd,MMM').format(Date);
  var Time=DateFormat('HH:mm:ss').format(Date);
  var colorcom;
  var grade = controller.device[i]["currentStatus"]["state"].toString();
  switch(grade) {
    case "CONNECTED": { print(grade);
    colorcom= Color(0xffaaf200);
    return Container(
        decoration: AppTheme.boxDecorationStyle(),
        child: Card(
            shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              leading: ClipRRect(
                // borderRadius: BorderRadius.circular(20.0),//or 15.0
                child: Container(
                  height: 100.0,
                  width: 130.0,
                  padding: const EdgeInsets.fromLTRB(0,8,0,5),
                  color: colorcom,
                  child: Text(controller.device[i]["currentStatus"]["state"].toString()+""+"\n"+DateFor.toString()+" "+Time.toString(),style: TextStyle(color: Colors.white,
                    fontSize: 15,fontWeight: FontWeight.bold,
                  ),textAlign: TextAlign.center,),
                ),

              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( controller.device[i]["name"],
                    style: TextStyle(color: AppColors.getDynamicTextColor(),
                      fontSize: 14,fontWeight: FontWeight.bold,
                    ),),
                  Text(  controller.device[i]["connectionParameters"]["host"],
                    style: TextStyle(color: AppColors.getDynamicTextColor(),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 1,),
                ],
              ),
            )
        )
    );
    }
    break;

    case "DISCONNECTED": { print(grade);
    colorcom= Color(0xffff1744);
    return Container(
        decoration: AppTheme.boxDecorationStyle(),
        child: Card(
            shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),
            elevation: 5,
           shadowColor: Colors.black,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              leading: ClipRRect(
                // borderRadius: BorderRadius.circular(20.0),//or 15.0
                child: Container(
                  height: 100.0,
                  width: 130.0,
                  padding: const EdgeInsets.fromLTRB(0,8,0,5),
                  color: colorcom,
                  child: Text(controller.device[i]["currentStatus"]["state"].toString()+""+"\n"+DateFor.toString()+" "+Time.toString(),style: TextStyle(color: Colors.white,
                    fontSize: 15,fontWeight: FontWeight.bold
                  ),textAlign: TextAlign.center,),
                ),

              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( controller.device[i]["name"],
                    style: TextStyle(color: AppColors.getDynamicTextColor(),
                      fontSize: 15,fontWeight: FontWeight.bold,
                    ),),
                  Text(  controller.device[i]["connectionParameters"]["host"],
                    style: TextStyle(color: AppColors.getDynamicTextColor(),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 1,),
                ],
              ),
            )
        )
    );
    }
    break;

    case "RECEIVING_DATA":
      {
        colorcom = Color(0xff00b0ff);
        return Container(
            decoration: AppTheme.boxDecorationStyle(),
            child: Card(
                shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),
                elevation: 5,
               shadowColor: Colors.black,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                  leading: ClipRRect(
                    // borderRadius: BorderRadius.circular(20.0),//or 15.0
                    child: Container(
                      height: 100.0,
                      width: 130.0,
                      padding: const EdgeInsets.fromLTRB(0,8,0,5),
                      color: colorcom,
                      child: Text(controller.device[i]["currentStatus"]["state"].toString()+""+"\n"+DateFor.toString()+" "+Time.toString(),style: TextStyle(color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.bold
                      ),textAlign: TextAlign.center,),
                    ),

                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( controller.device[i]["name"],
                        style: TextStyle(color: AppColors.getDynamicTextColor(),
                          fontSize: 15,fontWeight: FontWeight.bold,
                        ),),
                      Text(  controller.device[i]["connectionParameters"]["host"],
                        style: TextStyle(color: AppColors.getDynamicTextColor(),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 1,),
                    ],
                  ),
                )
            )
        );
      }
      break;

    case "RECONNECTING": { colorcom= Colors.orange;
    return Container(
        decoration: AppTheme.boxDecorationStyle(),
        child: Card(
            shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),
            elevation: 5,
           shadowColor: Colors.black,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              leading: ClipRRect(
                // borderRadius: BorderRadius.circular(20.0),//or 15.0
                child: Container(
                  height: 100.0,
                  width: 130.0,
                  padding: const EdgeInsets.fromLTRB(0,8,0,5),
                  color: colorcom,
                  child: Text(controller.device[i]["currentStatus"]["state"].toString()+""+"\n"+DateFor.toString()+" "+Time.toString(),style: TextStyle(color: Colors.white,
                    fontSize: 15,
                  ),textAlign: TextAlign.center,),
                ),

              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( controller.device[i]["name"],
                    style: TextStyle(color: AppColors.getDynamicTextColor(),
                      fontSize: 15,fontWeight: FontWeight.bold,
                    ),),
                  Text(  controller.device[i]["connectionParameters"]["host"],
                    style: TextStyle(color: AppColors.getDynamicTextColor(),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 8,),
                ],
              ),
            )
        )
    );

    }
    break;

    default: { print("Invalid choice"); }
    break;
  }

  return Container(
      child: Card(
          elevation: 10,
           shadowColor: Colors.black,
          child: ExpansionTile(
            title: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
              leading: ClipRRect(
                child: Container(
                  height: 100.0,
                  width: 110.0,
                  padding: const EdgeInsets.fromLTRB(0,20,0,5),
                  color: Colors.red,
                  child: Text(controller.device[i]["currentStatus"]["state"].toString(),textAlign: TextAlign.center,),
                ),
              ),

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name :" + controller.device[i]["name"],
                    style: TextStyle(color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 8,),
                ],
              ),
            ),

          )
      )
  );
}*/
Widget DeviceData(String grade,String DateFor,String Time, DeviceName,colorcom,IP){
  return Container(
     // decoration: AppTheme.boxDecorationStyle(),
      child: Card(
        elevation: 2,
          //shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),

          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            leading: ClipRRect(
              child: Container(
                height: 100.0,
                width: 140.0,
                padding: const EdgeInsets.fromLTRB(0,8,0,5),
                color: colorcom,
                child: Text(grade.toString()+""+"\n"+DateFor.toString()+" "+Time.toString(),style: TextStyle(color: Colors.white,
                  fontSize: 15,
                ),textAlign: TextAlign.center,),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DeviceName ,//controller.device[i]["name"],
                  style: TextStyle(
                    fontSize: 15,
                  ),),
                Text(IP, // controller.device[i]["connectionParameters"]["host"],
                  style: TextStyle(color: AppColors.getDynamicTextColor(),
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 5,),
              ],
            ),
          )));
}

