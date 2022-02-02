import 'dart:io';

import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'apiservice.dart';

class ApiErrorHandler extends InterceptorsWrapper{

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) {
    print(e.error);
    if(e.type == DioErrorType.receiveTimeout){
      showSnackBar("Error", "Receive timeout");
    }else if(e.type == DioErrorType.connectTimeout){
      showSnackBar("Error", "Connection timeout");
    }else if(e.type ==DioErrorType.response){
      var error=e.response!.data['error'];
      print(e.response!.data);
      if(error=='invalid_token' || error=='invalid_grant'){
        Get.find<ApiService>().logout();
        showSnackBar("Error","Invalid Token");
      }else{
        showSnackBar("Error", error);
      }
    }else if(e.type==DioErrorType.other){
      var error=e.error.runtimeType;
      if(error == SocketException){
        showSnackBar("Error", "No Connection to Server is available");
      }
    }
    return;
  }
}
