import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Report/controller/report_controller.dart';
import 'package:unified_alerts/src/Report/view/report_container_view.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.toNamed('compose-report'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          label: const Text("Compose"),
          icon: const Icon(Icons.edit, size: 20)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black12,
        child: ListView.builder(
          itemCount: controller.reports.length,
          itemBuilder: (context, index) {
            return ReportContainerView(report: controller.reports[index]);
          },
        ),
      ),
    );
  }
}
