
import 'package:amcmobile/pages/navigation/realtime/analog/analog_page.dart';
import 'package:amcmobile/pages/navigation/realtime/analog/analog_page1.dart';
import 'package:amcmobile/pages/navigation/realtime/digital/digital_page.dart';
import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/pages/navigation/widget/stationDropdown/station.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';


class Realtime extends GetView<RealTimeController > {
  @override
  Widget build(BuildContext context) {
    context.theme;
    return  Obx(()=>Scaffold(
      appBar: createAppbar(controller.title,controller.timestamp2.value,Get.find(),),
        body:Builder(
            builder: (BuildContext context) {
              return OfflineBuilder(
                  connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
                    final bool connected = connectivity != ConnectivityResult.none;
                    AlertDialog alert = AlertDialog(
                      title: Text("Internet"),
                      backgroundColor: AppColors.getThemeColor(),
                      content: Text("please check internet connection"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0))),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                    if(!connected){
                      return alert;
                    }
                   return Column(
                     children: [
                       SizedBox(height: 1,),
                       station(),
                       SizedBox(height: 1,),
                       Expanded(
                         child: Container(
                           child: ContainedTabBarView(
                             tabBarProperties: TabBarProperties(
                               background: Container(
                                 color: AppColors.getContainerColor(),
                               ),
                               labelColor: AppColors.getDynamicTextColor(),
                             ),
                             tabs:[
                               Text('AnalogPoint',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                               Text('DigitalPoint',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                             ],
                             views:[
                               AnalogPage(),
                               DigitalPage(),
                             ],
                             initialIndex:0,
                             onChange:(index)=>controller.onTabSelect(index),
                           ),
                         ),
                       )
                     ],
                   );

                  },
                  child: Center(


                    child: Text("ONLINE Or OFFLINE",),
                  )
              );


            }
        )
    ));






  }
}


