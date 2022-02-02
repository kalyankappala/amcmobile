import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StationDropdown extends GetxController {
  ApiService apiservice = Get.find();

   final RefreshController refreshController=RefreshController(initialRefresh: false,);

  var selectedStation = {}.obs;
  var stations = [].obs; //
  @override
  void onReady(){
    getAllStations();
    super.onReady();
  }
  onSelectMenuItem(Map map) {
    selectedStation.value = map;
    refreshController.refreshCompleted();
  }

  getAllStations() {
    apiservice.getAllStations().then((response) {
      print(response);
      stations.value = response.data['stations'];
      selectedStation.value = response.data['stations'][0];
      onSelectMenuItem(selectedStation.value);
      print(selectedStation.value);
      refreshController.refreshCompleted();
    }).onError((error, stackTrace) {
    }
    );
  }
}