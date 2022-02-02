import 'package:amcmobile/pages/navigation/admin/admin_controller.dart';
import 'package:get/get.dart';

import 'login_history/user_controller.dart';

class AdminBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => AdminController());
  Get.lazyPut(() => UsersController());
  }
}