/*


import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/service/timer_service.dart';
import 'package:amcmobile/pages/navigation/widget/stationDropdown/stationcontroller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



class AnalogController extends GetxController {
  ApiService apiservice = Get.find();
  final TimerService timerService = Get.find<TimerService>();

  final RefreshController refreshController=RefreshController(initialRefresh:false);
  var analogPoints=[].obs;
  var selectedStation = {}.obs;
  var station = Get.find<StationDropdown>().selectedStation;

  @override
  void onReady() {
    print("Analog controller is opening....");
    getData();
    super.onReady();
  }

 getData() {
    var type = "Analog";
    print(station);
      apiservice.getPoints(station["id"], type).then((response) {
      analogPoints.value = response.data['points'];
      refreshController.refreshCompleted();
    }
    );
  }
  }
*/
