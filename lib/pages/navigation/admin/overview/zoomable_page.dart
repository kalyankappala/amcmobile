/*
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '/themes/app_colors.dart';

class ZoomablePage extends GetView{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: logoAppbar('Overview', 0),
      body: PhotoView(
        imageProvider: AssetImage(Get.rootDelegate.arguments()),//'assets/images/Network_Architecture.jpg'),
        initialScale: PhotoViewComputedScale.covered,
        enablePanAlways: true,
        enableRotation: false,
        minScale: PhotoViewComputedScale.contained ,
        maxScale: PhotoViewComputedScale.covered * 3 ,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close_sharp,color: Colors.red,),
        backgroundColor: AppColors.getContainerColor(),
        onPressed: ()=>Get.rootDelegate.backUntil("/navigation/admin"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

}*/
