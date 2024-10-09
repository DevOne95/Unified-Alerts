import 'package:get/get.dart';
import 'package:unified_alerts/src/Layout/controller/layout_controller.dart';
import 'package:unified_alerts/src/Notification/controller/notification_controller.dart';
import 'package:unified_alerts/src/Profile/controller/profile_controller.dart';
import 'package:unified_alerts/src/Report/controller/report_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());
    Get.lazyPut<NotificationController>(() => NotificationController(),
        fenix: true);
    Get.lazyPut<ReportController>(() => ReportController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
