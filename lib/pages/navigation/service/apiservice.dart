import 'dart:developer';
import 'dart:io';


import 'package:amcmobile/pages/navigation/menubar/change_theme/change_theme_page.dart';
import 'package:amcmobile/pages/navigation/service/oauth2_dio.dart';
import 'package:amcmobile/themes/app_colors.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:network_info_plus/network_info_plus.dart';


class ApiService extends GetxService {
  static ApiService get to => Get.find();



  final GetStorage storage=GetStorage();
  final String baseUrl = "http://192.168.100.18:8082";
  var networkStatus=false.obs;
  late OAuth oauthclient;
  var clientId= "gridx";
  var clientSecret= "gridx-secret";

  getOauthToken(){
    Dio dio=Dio();

    String authorizationHeader= stringToBase64.encode('$clientId:$clientSecret');
    dio.post("http://192.168.98.252:8082/oauth/token", data: {'grant_type':'password','username':'kalyan','password':'kalyan1'},
        options: Options( headers: {'Content-Type': 'application/x-www-form-urlencoded','Authorization':"Basic $authorizationHeader"}))
        .then((response) => {
      print(response)
    });
    /*Dio dio =Dio();
    String authoriziation='Basic '+base64Encode(utf8.encode('$clientId:$clientSecret'));
    dio.post("http://192.168.100.18:8082/oauth/token",data:{'grant_type':'password','username':'kalyan','password':'kalyan1'},
        options:Options(headers:{'Authorization':'authoriziation'})).then((response))=>{
      print(response)
    });*/
  }

  late Dio dio;
  ApiService() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 2000,
        contentType: "application/json",
        responseType: ResponseType.json
    )
    );
  }


  @override
  void onInit() {
    getAllStations();

  }
  getUsername(){
    return storage.read("username") ?? "";
  }
  Future getAllDevices() {
    return dio.get(baseUrl + "/device");
  }
  Future getAllUsers() {
    return dio.get(baseUrl + "/users");
  }
  Future getAlllogins() {
    return dio.get(baseUrl + "/loginhistory");
  }
  Future getAllStations() {
    return dio.get(baseUrl + "/stations");
  }
  Future servertime() {
    return dio.get(baseUrl + "/servertime");
  }
 /* Future  {
    return dio.get(baseUrl + "/events");
  }*/
  Future getAllEvents(String stationId , String type){
    return dio.get(baseUrl + "/events",queryParameters: {'stationId':stationId,'type': "Events"});
  }

   Future getPoints(String stationId , String type){
    return dio.get(baseUrl + "/station",queryParameters: {'stationId':stationId,'type': type});
  }
  Future getSld(String stationId , String type){
    return dio.get(baseUrl + "/drawings",queryParameters: {'stationId':stationId,'type': type});
  }
  Future getTrends(String stationId,String type) {
    return dio.get(baseUrl + "/adDaily",
        queryParameters: {'stationId': stationId, 'type': "aDaily"});
  }

  Future getDataFromAmcServer(){
    return dio.get(baseUrl +"");
   }

  late Map<String,dynamic> authenticatedMenuItems={
    'App Theme':()=> _changeTheme(),


        //_changeTheme(),

    'Profile':()=>_showProfileInfo(),
    'Logout':()=>logout(),


  };




  _changeTheme(){
    Get.defaultDialog(
      title:  "AppTheme",
      //"AppTheme",
      backgroundColor: Colors.black54,
      content:  Container(
       // color: AppColors.getThemeColor(),
        height: 140,
        width: 500,
        child: ChangeThemePage()));


}



    /*Get.bottomSheet(
      ChangeThemePage(),
      barrierColor: Colors.transparent,
      useRootNavigator: true,
    );*/







  _showProfileInfo(){
    Get.defaultDialog(
      title: "Profile",
      barrierDismissible: true,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(child: Icon(Icons.person,size: 40,),),
          Text('Logged in as '),
          Text("srikanth",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),)
        ],
      ),
    );
  }

  logout()  {
    log("logging out..... ");
    Get.toNamed("/loginpage");
  }
  _createDio(String deviceInfo) {
    Dio dio=Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {Headers.acceptHeader: ContentType.json, 'deviceInfo' :deviceInfo },
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          receiveDataWhenStatusError: true,
          connectTimeout: 5*1000, // 5 seconds
          receiveTimeout: 3*1000, // 3 seconds
        ));
    // dio.interceptors.add(SldcApiErrorHandler(this));
    return dio;
  }
  /*goToLoginPage() async {
    //Get.rootDelegate.popRoute();
    // storage.erase();
    Get.rootDelegate.offNamed("/Loginpage");
  }*/

}

getDeviceInfo() async{
  final networkInfo = NetworkInfo();
  // String wifiName = await networkInfo.getWifiName() ?? 'Not found';
  String wifiIp = await networkInfo.getWifiIP() ?? 'Not found';
  String wifiGateway = await networkInfo.getWifiGatewayIP() ?? 'Nofound';

  if (Platform.isIOS) {
    return _readIosDeviceInfo(await DeviceInfoPlugin().iosInfo,wifiIp,wifiGateway);
  } else if (Platform.isAndroid) {
    return _readAndroidBuildData(await DeviceInfoPlugin().androidInfo,wifiIp,wifiGateway);
  }
}
Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo info,String wifiIp,String wifiGateway) {
  return <String, dynamic>{
    'Wifi.Ip': wifiIp,
    'Wifi.Gateway': wifiGateway,
    'Brand': info.brand,
    'Manufacturer': info.manufacturer,
    'Model': info.model,
    'Device': info.device,
    'Display': info.display,
    'Hardware': info.hardware,
    'Fingerprint': info.fingerprint,
    'Host': info.host,
    'Id': info.id,
    'Product': info.product,
    'AndroidId': info.androidId,
    'Version.securityPatch': info.version.securityPatch,
    'Version.sdk': info.version.sdkInt.toString()+'.'+info.version.release.toString()+'.'+info.version.previewSdkInt.toString(),
    'Version.incremental': info.version.incremental,
    'Version.codename': info.version.codename,

    // 'version.previewSdkInt': build.version.previewSdkInt,
    // 'version.release': build.version.release,
    // 'supportedAbis': build.supportedAbis,
    // 'Tags': build.tags,
    // 'Board': build.board,
    // 'version.baseOS': build.version.baseOS,
    // 'supported32BitAbis': build.supported32BitAbis,
    // 'supported64BitAbis': build.supported64BitAbis,
    // 'Bootloader': build.bootloader,
    // 'type': build.type,
    // 'isPhysicalDevice': build.isPhysicalDevice,
    // 'systemFeatures': build.systemFeatures,
  };
}
Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo info,String wifiIp,String wifiGateway) {
  return <String, dynamic>{
    'Wifi.Ip': wifiIp,
    'Wifi.Gateway': wifiGateway,
    'Name': info.name,
    'Model': info.model,
    'SystemName': info.systemName,
    'systemVersion': info.systemVersion,
    'localizedModel': info.localizedModel,
    'identifierForVendor': info.identifierForVendor,
    'utsname.sysname:': info.utsname.sysname,
    'utsname.nodename:': info.utsname.nodename,
    'utsname.release:': info.utsname.release,
    'utsname.version:': info.utsname.version,
    'utsname.machine:': info.utsname.machine,
    // 'isPhysicalDevice': data.isPhysicalDevice,
  };
}




