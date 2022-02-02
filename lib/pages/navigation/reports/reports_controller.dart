import 'dart:ffi';

import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ReportsController extends GetxController {

  final String title = 'Reports';
  ApiService apiservice = Get.find();
  late String selectedValue;
  var seletedItem = ''.obs;
  onSelectMenuItem(index) {
    seletedItem.value = index;
  }

  @override
  void onInit() {
    // getData();
    super.onInit();
  }

  var stations = <String>[].obs;

  void onSelected(String value) {
    selectedValue = value;
  }

  //var mylist = [].obs;
//var list=[].obs;

  var name = "name".obs;
  var Age = "".obs;
  var sno = "".obs;
  var array = [].obs;
  var array1 = [].obs;
  var array2 = [].obs;


//RxList list=[].obs;
//var count=0.obs;
/* String getMyname(){
   return"rasa";
 }*/
/*incrementCount(){
   count++;
   print(count);

 }*/


/*

  getData() {
   // apiservice.getDataFromAmcServer().then((response) {
      print(response);
      var name1="dummydata";
      */
/* var name2=response.data['name'];
    var name3=response.data['Age'];
    var name4=response.data['s.no'];*/ /*

      var list1=response.data['login'];
      var list2=response.data['analogpoints'];
      var list3=response.data['stations'];
      // final List<Array> name5 =<Array>[].obs;
      //  var name5=response.data['arrayData'];
      */
/* name.value=name2;
    Age.value=name3;
    sno.value=name4;*/ /*

      array.value=list1;
      array1.value=list2;
      array2.value=list3;
      //  print(array.length);

      // print(array.value);

      // name1=name.value;
      print(array);

      //  list.value=["name"];
    }).onError((error, stackTrace) {
    });
    */
/*getHomeData() {
    list.value = ["sri"];
  }*/ /*

  }}*/
}