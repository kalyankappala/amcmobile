import 'package:amcmobile/pages/screens/layer/layerone.dart';
import 'package:amcmobile/pages/screens/layer/layerthree.dart';
import 'package:amcmobile/pages/screens/layer/layertwo.dart';
import 'package:amcmobile/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.getThemeColor(),
        /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/primaryBg.png'),
              fit: BoxFit.cover,
            )),*/
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 200,
                left: 59,
                child: Container(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
            Positioned(top: 290, right: 0, bottom:10, child: LayerOne()),
           // Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
            Positioned(top: 320,left:10, right: 0, bottom: 48, child: LayerThree()),
          ],
        ),
      ),
    );
  }
}