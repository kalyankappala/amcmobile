

import 'package:amcmobile/pages/navigation/trends/station.dart';
import 'package:amcmobile/pages/navigation/trends/trendTab/tabTrend.dart';
import 'package:amcmobile/pages/navigation/trends/trends_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class Trends2 extends GetView<TrendsController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:trendsAppbar(controller.title,),
      //backgroundColor: Colors.white,
      body:
       Column(
         children: [
         SizedBox(height: 1,),
           station(),
           SizedBox(height: 1,),
           Expanded(child: tabTrend(),)
    ],
    ),

    );
  }}



