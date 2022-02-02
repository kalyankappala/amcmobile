import 'package:amcmobile/pages/navigation/menubar/change_theme/change_theme_page.dart';
import 'package:amcmobile/pages/navigation/service/apiservice.dart';
import 'package:amcmobile/pages/navigation/sldc/sldc_controller.dart';
import 'package:amcmobile/pages/navigation/widget/appbar_widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:side_sheet/side_sheet.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class Sldc extends GetView<SldcController> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            SideSheet.right(
                body: ChangeThemePage(),
                context: context
            ),
        child: //ChangeThemePage());
        Text('OPEN RIGHT SIDE SHEET'));

  }
}