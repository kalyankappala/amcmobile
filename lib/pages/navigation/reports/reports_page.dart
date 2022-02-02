import 'package:amcmobile/pages/navigation/reports/reports_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Reports extends GetView<ReportsController>{
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
      return Scaffold(

        appBar: reportsAppbar(controller.title,),
        backgroundColor: AppColors.getThemeColor(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child:Column(
            children: [
              Card(
                elevation: 20.0,
               // shadowColor: Colors.black,
                child: Container(
                //  color: AppColors.getChipColor(),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/excel.png"),
                      Text("Analog",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),

/*
                      DropdownButton(value: controller.seletedItem.value,
                          onChanged: (value){controller.onSelectMenuItem(value);},
                          items: createDropdownMenuItems(controller),
                          //items: controller.array2.value.map((element)=>createDropdownMenuItem(element)).toList(),
                          hint:Text("Select item")),*/

                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          showDatePicker(

                            builder: (BuildContext context, Widget ?child) {

                              return Theme(
                                data: ThemeData(
                                  primarySwatch: Colors.grey,
                                  splashColor: Colors.black,
                                  textTheme: TextTheme(
                                    subtitle1: TextStyle(color: Colors.black),
                                    button: TextStyle(color: Colors.black),
                                  ),
                                  accentColor: Colors.black,
                                  colorScheme: ColorScheme.light(
                                      primary: AppColors.getDynamicTextColor(),
                                      primaryVariant: Colors.black,
                                      secondaryVariant: Colors.black,
                                      onSecondary: Colors.black,
                                      onPrimary: Colors.white,
                                      surface: Colors.black,
                                      onSurface: Colors.black,
                                      secondary: Colors.black),
                                  dialogBackgroundColor: Colors.white,
                                ),
                                child: child ??Text(""),
                              );
                            },

                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101),
                          ).then((value) => {
                            if(value != null){
                              selectedDate = value,
                              print(value)
                            }
                          }
                          );
                        },
                      ),
                    ],
                  ),
                ),

              ),

              Expanded(
                child: Table(
                  columnWidths: {0:FlexColumnWidth(.30),1:FlexColumnWidth(1.5)},
                  border: TableBorder.all(color: Colors.white),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: AppColors.getThemeColor()),
                      children: [
                        //Text('SI.No',style: TextStyle(color: Colors.white,height: 3,fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Text('Sno',style: TextStyle(color: Colors.white,height: 3,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Text('Date&Time',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,height: 3,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Inverter-1',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,height: 3,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Inverter-2',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,height: 3,fontSize: 16,fontWeight: FontWeight.bold),),
                       // Text('Quality',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,height: 3,fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }}
