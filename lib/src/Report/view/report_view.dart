import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Report/controller/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text("Notification View"),
      ),
    );
  }
}
