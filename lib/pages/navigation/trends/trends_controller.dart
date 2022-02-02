
import 'package:amcmobile/domain/time_value_object.dart';
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/service/timer_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrendsController extends GetxController {
  final String title = 'Trends';
  final TimerService timerService = Get.find<TimerService>();
  final RefreshController refreshController=RefreshController(initialRefresh:false);



  ApiService apiservice = Get.find();
  var selectedStation = {}.obs;
  var selectedPoint = {}.obs;
  var stations = [].obs; //
  var spoints = [].obs; //
  var sp = "sri";
  var lastindex;
  var today=<TimeValueObject>[].obs;
  var yesterday=<TimeValueObject>[].obs;
//  var timestamp=0.obs;
 // var timestamp2='25-12-2021 11:15:31'.obs;

  @override
  void onReady() {
    getAllStations();
   //  timerService.setMethod(()=>getAllStations());
     super.onReady();

  }

  onSelectMenuItem(Map map) {
    selectedStation.value = map;
  }

  getAllStations() {
    apiservice.getAllStations().then((response) {
      if(response.statusCode==200){
      print(response);
      stations.value = response.data['stations'];
      selectedStation.value = response.data['stations'][0];
    //  timestamp2.value=response.data['timestamp'];

      apiservice.getTrends(selectedStation.value["id"], "aDaily").then((
          response) {
        // print(response);
        spoints.value = response.data['aDpoints'];
        selectedPoint.value = response.data['aDpoints'][0];
        //lastindex=0;
        // onTabSelect(lastindex);

      });

    }});
  }


  onSelectStation(Map value) {
    //station
    selectedStation.value = value;
    print(selectedStation.value);
    /*lastindex=0;
    onTabSelect(lastindex);*/
    apiservice.getTrends(selectedStation.value["id"], "aDaily").then((
        response) {
      print(response);
     spoints.value = response.data['aDpoints'];
      selectedPoint.value = response.data['aDpoints'][0];
     // print(selectedPoint.value);
     // print("kalyan");
     // lastindex=0;
     // onTabSelect(lastindex);

    });
  }


  onSelectPoint(Map value1) {
    //Point
    selectedPoint.value = value1;
    print(selectedPoint.value);
   // lastindex=0;
   // onTabSelect(lastindex);
  //  print("kkk");

  }


  /*void onTabSelect(int index) {
    if (index == 0) {

      print("Dummy");
      print(selectedPoint.value);

      }
        print("kalyan");
      }*/


    }




