
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewPage extends GetView{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
             /* Expanded(
                   child: InkWell(
                      child:Image.asset('assets/marikal.jpg',fit: BoxFit.fill,),
                      onTap: ()=>Get.rootDelegate.toNamed("/navigation/admin/zoomable",arguments: 'assets/marikal.jpg'),
                    )
                ),*/
              SizedBox(height: 7,),
              Expanded(
                    child:InkWell(
                    child: Image.asset('assets/architecture.JPG',fit: BoxFit.fill,),
                    onTap: ()=>Get.rootDelegate.toNamed("/navigation/admin/zoomable",arguments: 'assets/architecture.JPG'),
                )
              )
            ],
          )
      ),
    );
  }
}