import 'dart:async';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:get/get.dart';

 class TimerService extends GetxService{

   StreamSubscription? subscription;
   Function? executingMethod;

  Timer? timer;

  setMethod(Function f){
   executingMethod=f();
   timer??startTimer();  //if timer==null then start timer
   // executingMethod!();// for executing immediately after calling this method
  }

  startTimer(){
     print("staring timer....");
     timer = Timer.periodic(Duration(seconds: 1), (timer) {
     //  print("Executing timer method.....");
       executingMethod?.call();
     });
  }

  stopTimer(){
   if(timer!=null) {
     print("stopping timer...");
     timer?.cancel();
     timer=null;
   }
  }

  @override
  void onInit() {
    startTimer();
    subscription=FGBGEvents.stream.listen((event) {
       if(event == FGBGType.background){
         print("App went to background");
         stopTimer();
       }else if(event == FGBGType.foreground){
         print("App Came to foreground");
         startTimer();
       }
    });
  }

  @override
  void onClose() {
    stopTimer();
    subscription?.cancel();
  }
}


/*void _connectivityListener(){
  Connectivity().onConnectivityChanged.listen((event) async {

    // var result=event;
    String? message;
    if(event == ConnectivityResult.none) {
      message='Device not connected to any network';
    }else if(event == ConnectivityResult.wifi){
      message='Device not connected to Wifi network';
    }else if(event == ConnectivityResult.mobile){
      message='Device not connected to Mobile network';
    }
    showSnackBar("Network", message!);
  });
}

AppLifecycleState _lastLifecyleState;
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      print('SystemChannels---> $msg');
      switch (msg) {
        case "AppLifecycleState.paused":
          _lastLifecyleState = AppLifecycleState.paused;
          break;
        case "AppLifecycleState.inactive":
          _lastLifecyleState = AppLifecycleState.inactive;
          break;
        case "AppLifecycleState.resumed":
          _lastLifecyleState = AppLifecycleState.resumed;
          break;

        default:
      }
    });


*/