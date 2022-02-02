/*

import 'package:amcmobile/pages/navigation/realtime/realtime_controller.dart';
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/service/timer_service.dart';
import 'package:amcmobile/pages/navigation/widget/stationDropdown/stationcontroller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class DigitalController extends GetxController {
  ApiService apiservice = Get.find();
  final TimerService timerService = Get.find<TimerService>();
  final RefreshController refreshController=RefreshController(initialRefresh:false);
  var digitalPoints=[].obs;
  var selectedStation = {}.obs;
  var station = Get.find<StationDropdown>().selectedStation;

  getdata(){
    var type = "Digital";
    print(station["id"].toString());
    apiservice.getPoints(station["id"], type).then((response) {
      digitalPoints.value = response.data['Digital'];
      refreshController.refreshCompleted();
    }
    );
  }
}*/
