import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:amcmobile/themes/app_theme.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class AnalogPage extends GetView<RealTimeController>{
  @override
  Widget build(BuildContext context){
    context.theme;
    return Obx(()=> Scaffold(
        body:  Container(
          // child: controller.analogPoints.isEmpty ?  loading():
          child: controller.analogPoints.isEmpty ? loading():
          SmartRefresher(enablePullDown: true,
              onRefresh: controller.getData(),
              controller: controller.refreshController,
              child:    ListView.builder(
                itemCount: controller.analogPoints.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) => CreateItem(i,controller,),
              )
          ),
        )
    ) );
  }

  Widget CreateItem(int i,RealTimeController controller,) {
    var Date =new DateTime.fromMicrosecondsSinceEpoch(controller.analogPoints[i]["lastUpdated"]["timestamp"]* 1000);
    var num =controller.analogPoints[i]['lastUpdated']['value'];
    var num2 = double.parse(num.toStringAsFixed(2));
    var DateFor=DateFormat('dd/MM/yyyy').format(Date);
    var Time=DateFormat('HH:mm:ss a').format(Date);

    return Container(
        decoration: AppTheme.boxDecorationStyle(),
        child: Card(
            elevation: 5,
            shape: OutlineInputBorder( borderSide: BorderSide(color: AppColors.getDynamicTextColor(), width: 1),),
            child: ExpansionTile(
                title: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.circular_colors[i],
                    child: CircleAvatar(radius:22,backgroundColor: AppColors.circular_colors[i],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedFlipCounter(fractionDigits: 2, value: double.parse(num2.toString()),textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),

                          /*Text(num2.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                        ),*/
                        ],
                      ),
                    ),
                  ),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          // Text("Name :  " ,),
                          Text( controller.analogPoints[i]["name"],style: TextStyle(fontSize: 13),),
                        ],
                      ),
                      /*SizedBox(height: 5,),
                    Row(
                      children: [
                       // Text("Value  :   " ),
                        Text( num2.toString(),
                          style: TextStyle(color: AppColors.getDynamicTextColor(),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(width: 10,),*/
                    ],
                  ),
                ),
                children: [
                  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Table(
                          children: [
                            TableRow(
                              decoration: BoxDecoration(color: AppColors.getDynamicTextColor()),
                              children: [
                                Text("   Name : " + controller.analogPoints[i]["name"],
                                  style: TextStyle(color: Colors.white,height: 2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child:  Data(i, controller),
                                  )
                                ]
                            ),
                            TableRow(
                                children: [
                                  Container(
                                    height: 45,
                                    padding: EdgeInsets.all(0),
                                    child: Card(elevation: 5,
                                      shape: Border(left: BorderSide(color: AppColors.getDynamicTextColor(), width: 5)),
                                      child: Column (
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text("IOA"),
                                                    Text(":"),
                                                    Text(controller.analogPoints[i]["ioa"].toString(),)
                                                  ],
                                                )
                                            ),
                                          ]
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
                                    child: Card(elevation: 5,
                                      shape: Border(left: BorderSide(color:AppColors.getDynamicTextColor(), width: 5)),
                                      child: Column (
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text("PointType"),
                                                    Text(":"),
                                                    Text(controller.analogPoints[i]["pointType"].toString(),),
                                                  ],
                                                )
                                            ),
                                          ]
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
                                    child: Card(elevation: 5,
                                      shape: Border(left: BorderSide(color: AppColors.getDynamicTextColor(), width: 5)),
                                      child: Column (
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text("TimeStamp"),
                                                    Text(":"),
                                                    Text(DateFor.toString()+""+"\n"+Time.toString(),)
                                                  ],
                                                )
                                            ),
                                          ]
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
                                    child: Card(elevation: 5,
                                      shape: Border(left: BorderSide(color: AppColors.getDynamicTextColor(), width: 5)),

                                      child: Column (
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text("DataType" ),
                                                    Text(":"),
                                                    Text(controller.analogPoints[i]["dataType"].toString(),)
                                                  ],
                                                )
                                            ),
                                          ]
                                      ),
                                    ),
                                  )
                                ]
                            ),
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}
Widget Data(int i,RealTimeController controller){

  List<_PointData>  data = [
    // _PointData( controller.analogPoints[i]["firstUpdated"]["value"] ,'yesterday'),
    //  _PointData( controller.analogPoints[i]["hourly"]["min"],'Hourly'),
    _PointData( controller.analogPoints[i]["lastUpdated"]["value"],'today'),
  ];
  return  Column(
    children: [
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.fromLTRB(10,5,15,5),
        child: Container(
          height:200,
          // height: MediaQuery.of(context).size.height,
          child:  SfCartesianChart(
              primaryXAxis: CategoryAxis(majorGridLines: const MajorGridLines(width: 1),),
              primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.round, interactiveTooltip: InteractiveTooltip(enable: true),),

              // primaryYAxis: NumericAxis(isVisible: false,),
              plotAreaBorderWidth: 0,
              trackballBehavior: TrackballBehavior(
                  enable: true,
                  activationMode: ActivationMode.singleTap,
                  // tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
                  tooltipSettings: InteractiveTooltip(
                    // Formatting trackball tooltip text
                      format: 'point.x Hrs \n      point.y MW',
                      decimalPlaces:0
                  )
              ),
              legend: Legend(isVisible: true,position: LegendPosition.bottom,toggleSeriesVisibility: true ),


              /* primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.round, interactiveTooltip: InteractiveTooltip(enable: true),),
          primaryXAxis: CategoryAxis(majorGridLines: const MajorGridLines(width: 0)*/
              series: <ChartSeries>[
                ColumnSeries<_PointData, String>(
                    name: "Today",
                    dataSource: data,
                    xValueMapper: (_PointData Data, _) => Data.day,
                    yValueMapper: (_PointData Data, _) => Data.value,
                    color: Colors.green
                  // pointColorMapper: (data,index)=>AppColors.circular_colors[index],
                  // dataLabelSettings: DataLabelSettings(isVisible: true,)
                ),
                /*LineSeries<_PointData, String>(
            name: "yesterday",
            dataSource: data,
            xValueMapper: (_PointData Data, _) => Data.day,
            yValueMapper: (_PointData Data, _) => Data.value,
            color: Colors.red
          // pointColorMapper: (data,index)=>AppColors.circular_colors[index],
          // dataLabelSettings: DataLabelSettings(isVisible: true,)
        ),*/

              ]

          ),
        ),
      ),
    ],
  );
}

class _PointData {
  //_PointData(this.value, this.day);

  final String day;
  final double value;
  _PointData(this.value, this.day);

}