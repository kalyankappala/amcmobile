
import 'package:amcmobile/pages/navigation/trends/Dummytab/Graph.dart';
import 'package:amcmobile/pages/navigation/trends/trends_controller.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class tabTrend extends GetView<TrendsController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Graph());



        //color:Colors.blue,// AppColors.getThemeColor(),
       /* child: ContainedTabBarView(
          tabs: [
            Text('Graph'),

          ],
          views: [Graph()
          ],
          initialIndex:0,
         // onChange:(index)=>controller.onTabSelect(index),
        ));*/
  }}







