import 'package:amcmobile/pages/navigation/trends/trends_controller.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Graph extends GetView<TrendsController>{
  @override
  Widget build(BuildContext context){
    return  Obx(()=>Container(
      color: Colors.transparent,
      child:Data(controller,context),
        )
    );
   }
  }

  Widget Data(TrendsController controller,context){
 // double i=controller.selectedPoint.value["firstUpdated"]["value"].length;
    List<_PointData>  data = [
     // _PointData( controller.selectedPoint.value["lastUpdated"]["value"] ,'yesterday'),
      _PointData( controller.selectedPoint.value["firstUpdated"]["value"],'today'),
    ];
    return  Column(

    children: [
      Divider(height: 5,color: AppColors.getBorderColor()),

      Container(
      height:550,
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
     /* ColumnSeries<_PointData, String>(
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
    ],
    );
  }

class _PointData {
  //_PointData(this.value, this.day);

  final String day;
  final double value;
  _PointData(this.value, this.day);

}
