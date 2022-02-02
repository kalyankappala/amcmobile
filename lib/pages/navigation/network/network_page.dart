import 'package:amcmobile/pages/navigation/network/network_controller.dart';
import 'package:amcmobile/pages/navigation/network/network_widget.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class Network extends GetView<NetworkController> {
  @override
  Widget build(BuildContext context){
    context.theme;
    return Obx(()=>Scaffold(
      appBar: networkAppbar(controller.title,controller.timestamp2.value,Get.find()),

        body:
        Builder(
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

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Obx(()=>Container(
        color: Colors.transparent,
        child: controller.device.isEmpty ?  loading():
        SmartRefresher(enablePullDown: true,
          onRefresh: controller.getdata(),
          controller: controller.refreshController,
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
              itemCount: controller.device.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i,) => Devices(i,controller,)

          ),
        ),
      ),
      ),
    );

    },
    child: Center(


    child: Text("ONLINE Or OFFLINE",),
    )
    );


    }
    )));

  }

}
