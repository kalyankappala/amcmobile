import 'package:amcmobile/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Testing extends GetView{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/gridx.png",height: 100.0,width: 110,),backgroundColor: Color(0xFF808080),
      ),
      backgroundColor: Color(0xFF808080),
      body: Container(
        child: Column(
          children: [
            Card(
               color: Color(0xff808080),
              elevation: 20.0,
              shadowColor: Colors.black,
            /*  child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Logged In User: Srikanth",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    IconButton(color:Colors.orange   ,onPressed: (){}, icon: Icon(Icons.power_settings_new))

                  ],),
              ),*/
            ),
            Expanded(
              child: Container(
                child: GridView.count(crossAxisCount: 2,childAspectRatio: 1.4,
                    children: <Widget>[
                      NavCard( "RealTime",'realtime',Colors.orange),
                      NavCard( "Network",'network',Colors.lightGreen),
                      NavCard( "Trends",'trends',Colors.yellow),
                      NavCard( "Events",'events',Colors.cyanAccent),
                      NavCard( "Sldc",'sldc',Colors.red),
                      NavCard( "Reports",'reports',Colors.greenAccent),
                      NavCard( "Admin",'admin',Colors.greenAccent),

                 ]
                ),
              ),
            ) ,
          ],
        ),

      ),

    );
  }

}
Widget NavCard (String textvalue,String page,Color color,) {
  return Container(
      child: InkWell(
      onTap: (){
    Get.toNamed(page);
  },
        child: Center(
        child: Container(
          height: 120,
          width: 160,
          child:Center(
            child: Text(
              textvalue,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  shadows: [
                    Shadow(
                        offset: Offset(3, 3),
                        color: Colors.black,
                        blurRadius: 10),],
                  color: color),
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1.0, -4.0),
                  end: Alignment(1.0, 4.0),
                  colors: [
                    Color(0xFF808080),
                    Color(0xFF808080),
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFffffff),
                    offset: Offset(-5.0, -2.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0),
              ]
          ),
        ),
      ),
      )
  );
}

