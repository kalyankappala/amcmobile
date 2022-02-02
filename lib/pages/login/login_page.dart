/*
import 'package:amcmobile/pages/login/login_controller.dart';
import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/photo.jpg"),fit:BoxFit.cover ),
          ),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 400 ,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //color: Colors.transparent,
                    border: Border.all(color: Colors.white,width: 3)) ,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:<Widget> [
                    Image.asset('assets/gridx.png'),
                    */
/*TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "UserName",
                        fillColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),*//*

                    TextFormField(
                      // controller: controller.usernameController,
                      style: AppTheme.dynamicTextStyle(),
                      initialValue: controller.username.value,
                      keyboardType: TextInputType.text,
                      onChanged: (text)=>controller.onChangeUsername(text),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14.0)),
                            borderSide: BorderSide(color: const Color(0xffea5d49), width: 2),
                          ),
                          labelText: 'Username',
                          errorText: controller.usernameErrorText.value
                      ),
                      // validator: (value) => value!.trim().isEmpty ? 'Username required' : null,
                    ),
                  */
/*  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "password",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon:Icon(Icons.security),
                            onPressed: (){
                              },
                          )
                      ),
                    ),*//*

                    TextFormField(
                      // controller: controller.passwordController,
                      style: AppTheme.dynamicTextStyle(),
                      initialValue: controller.password.value,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (text)=>controller.onChangePassword(text),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14.0)),
                            borderSide: BorderSide(color:const Color(0xffea5d49), width: 2),
                          ),
                          labelText: 'Password',

                          errorText: controller.passwordErrorText.value
                      ),
                      // validator: (value) => value!.trim().isEmpty ? 'Password required' : null,

                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(

                            child:
                            TextButton("Login",Colors.yellow,"/navpage",),
                            onPressed: (){
                              // controller.getData();
                            },),
                        ],
                      ),
                    ),
                    Container(
                      child: Text("Logged out successfully",style: TextStyle(color: Colors.red,fontSize: 20),),
                    ), Container(
                      child: Text("Powerd by Joohitha Power Systems",style: TextStyle(color: Colors.white,fontSize: 20),),
                    )
                  ],
                ),
              ),
            ),
          ),),
    );
  }
  Widget TextButton(String name, Color color,String page,) {
    return MaterialButton(
      onPressed: () {
        Get.toNamed(page);
      },
      child: Text(name,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
      color: color,
        height: 50,
    );
  }
}
*/
