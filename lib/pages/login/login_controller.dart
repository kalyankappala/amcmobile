/*
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final ApiService apiService=Get.find<ApiService>();
  var username=''.obs;
  var password=''.obs;
  var usernameErrorText=''.obs;
  var passwordErrorText=''.obs;
  var errorText=''.obs;

  onChangeUsername(String val){
    username.value=val;
  }
  onChangePassword(String val){
    password.value=val;
  }
  @override
  void onInit(){
    username.value='srikanth';
    password.value='srikanth123';
    super.onInit();
  }
  @override
  void onReady(){
    print("opened"+this.runtimeType.toString());
  }
  @override
  void onClose() {
    // usernameController.dispose();
    // passwordController.dispose();
    super.onClose();
  }

  bool validateUsername(String value) {
    if (value.isEmpty) {
      usernameErrorText.value='Username required';
      return false;
    }
    return true;
  }

  bool validatePassword(String value) {
    if (value.isEmpty) {
      passwordErrorText.value= 'Password required';
      return false;
    }
    return true;
  }
  void processLogin(){
    usernameErrorText.value='';
    passwordErrorText.value='';
    if(validateUsername(username.value) && validatePassword(password.value)){


    }
  }
}
*/
