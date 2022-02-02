
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/service/timer_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RealTimeController extends GetxController {
  ApiService apiservice = Get.find();
  final TimerService timerService = Get.find<TimerService>();
  final RefreshController refreshController=RefreshController(initialRefresh:false);
  final String title = 'RealTime';


  var selectedStation = {}.obs;
  var stations = [].obs; //
  var timestamp=0.obs;
  var analogPoints = [].obs; //Analog
  var digitalPoints = [].obs;
  var lastindex;
  var timestamp2='25-12-2021 11:15:31'.obs;
  var time='25-12-2021 11:15:31'.obs;

  @override
  void onReady(){
    apiservice.getOauthToken();
   /* getAllStations();

    timerService.setMethod(()=>getData());

    print("Realtime Controller is Opening...");
    super.onReady();*/
  }

  @override
  void onClose(){

    print("Realtime Controller is Closing...");
    super.onClose();
  }


  getAllStations() {
    apiservice.getAllStations().then((response) {
      print(response);
      //getservertime();
      stations.value = response.data['stations'];
      selectedStation.value = response.data['stations'][0];
      apiservice.getPoints(selectedStation.value["id"], "Analog").then((response){
        analogPoints.value=response.data['points'];
        lastindex=0;
      }
      );
    }).onError((error, stackTrace) {
      refreshController.refreshFailed();
    }
    );
  }

  getData(){
    apiservice.getPoints(selectedStation.value["id"], "Analog").then((
        response) {
      analogPoints.value = response.data['points'];

     timestamp2.value=response.data['timestamp'];
      lastindex=0;
      refreshController.refreshCompleted();
      onSelectMenuItem(selectedStation.value);

    }).onError((error, stackTrace) {
      refreshController.refreshFailed();
    });

  }

  onSelectMenuItem(Map map) {
    selectedStation.value = map;
  }
  onSelectStation(Map value){
    selectedStation.value=value;
    if(lastindex==0){
    onTabSelect(0);
    }else{
    onTabSelect(1);
    }
  }
  getservertime(){
    apiservice.servertime().then((response){
      time.value=response.data['ctimestamp'];
      refreshController.refreshCompleted();
      print(time.value);
    } );
  }

  void onTabSelect(int index) {
    if (index == 0) {
      apiservice.getPoints(selectedStation.value["id"], "Analog").then((
          response) {
        print(index);
        print(response);
        analogPoints.value = response.data['points'];
        lastindex=0;
        // analogController.getData();
      });
    } else if (index == 1) {
      // digitalController.getdata();
      apiservice.getPoints(selectedStation.value["id"], "Digital").then((
          response) {
        print(index);
        print(response);
        digitalPoints.value = response.data['Digital'];
        lastindex=1;
      });
    }

   /* List getTabs() {
      return ['AnalogPoint', 'DigitalPoint',];
    }
*/




  }}


