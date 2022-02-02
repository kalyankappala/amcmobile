import 'package:amcmobile/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (_){
          return Scaffold(
              body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
                  colors: [Color(0xFF0093F9),Color(0xFFFFFFFF),]
          ),
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Column(
          children: [
          Image.asset(
          "assets/gridx.png",
          height: 300.0,
          width: 300.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Powered by ",textAlign:TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              ),
              ),
              Text("Joohitha Power Systems Pvt Ltd",textAlign:TextAlign.center,
                style: TextStyle(
                  color: Color(0xff0303f7),
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              )
            ],
          ),
          ],)]
          ),),);


    });


  }

}