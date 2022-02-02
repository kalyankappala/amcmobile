import 'dart:ffi';

import 'package:amcmobile/pages/screens/config.dart';
import 'package:amcmobile/pages/screens/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class LayerThree extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Container(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 129,
              child: Container(
                width: 310,
                child: TextField(
                  controller: controller.userName,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter User ID or Email',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 229,
              child: Container(
                width: 310,
                child: TextField(
                  controller: controller.password,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),

          Positioned(
              top: 305,
             right: 160,
              child: Container(
                width: 99,
                height: 35,
                decoration: BoxDecoration(
                  color: signInButton,
                  borderRadius: BorderRadius.circular(20),
                  /*BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),*/
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  /*child: Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w400),
                  ),*/
                  child: MaterialButton(
                    child: Text("Login",style: TextStyle(fontSize: 28),),
                    onPressed: (){
                      int j=controller.users.length;
                      for(int i=0;i<=j;i++){
                        if(controller.userName.text== controller.users[i]["username"]&& controller.password.text==controller.users[i]["password"])
                        {
                          Get.toNamed("/navpage");
                          controller.userName.clear();
                          controller.password.clear();
                          break;
                        }
                        else{
                          Get.toNamed("/loginpage");
                        }
                      }
                    },
                  ),
                ),
              )),
          Positioned(
              top: 432,
              left: 59,
              child: Container(
                height: 0.5,
                width: 310,
                color: inputBorder,
              )),
          Positioned(
              top: 482,
              left: 120,
              right: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: signInBox),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    /*child: Image.asset(
                      'images/icon_google.png',
                      width: 20,
                      height: 21,
                    ),*/
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        color: hintText),
                  ),
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: signInBox),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                   /* child: Image.asset(
                      'images/icon_apple.png',
                      width: 20,
                      height: 21,
                    ),*/
                  ),
                ],
              ))
        ],
      ),
    );
  }
}