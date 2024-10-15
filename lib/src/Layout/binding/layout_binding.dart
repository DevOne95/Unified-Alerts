import 'package:get/get.dart';
import 'package:unified_alerts/src/Account/controller/account_controller.dart';
import 'package:unified_alerts/src/Calendar/controller/calendar_controller.dart';
import 'package:unified_alerts/src/Layout/controller/layout_controller.dart';
import 'package:unified_alerts/src/Leave/controller/leave_controller.dart';
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
    Get.lazyPut<AccountController>(() => AccountController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<CalendarController>(() => CalendarController(), fenix: true);
    Get.lazyPut<LeaveController>(() => LeaveController(), fenix: true);
  }
}
