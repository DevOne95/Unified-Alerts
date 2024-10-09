import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Notification/view/notification_view.dart';
import 'package:unified_alerts/src/Profile/view/profile_view.dart';
import 'package:unified_alerts/src/Report/view/report_view.dart';

class LayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  // List of pages for each tab
  List<Widget> widgetOptions = const <Widget>[
    NotificationView(),
    ReportView(),
    ProfileView(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
