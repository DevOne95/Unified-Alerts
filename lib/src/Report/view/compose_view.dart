import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:unified_alerts/src/Report/controller/report_controller.dart';

class ComposeView extends GetView<ReportController> {
  const ComposeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: Text("Compose Report",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Purpose of the Report",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ...controller.reportPurposes
                  .map((purpose) => _buildListItem(purpose)),
              const SizedBox(height: 10.0),
              Expanded(
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.titleController,
                          style: const TextStyle(color: Colors.black87),
                          decoration: const InputDecoration(
                              labelText: "Report Title",
                              border: OutlineInputBorder(),
                              hintText: "Enter the title of the report",
                              hintStyle: TextStyle(fontSize: 12)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: controller.descriptionController,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black87),
                          decoration: const InputDecoration(
                              labelText: "Description",
                              border: OutlineInputBorder(),
                              hintText:
                                  "Enter a detailed description of the report",
                              hintStyle: TextStyle(fontSize: 12)),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                try {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    // File was selected
                                    controller.filePath =
                                        result.files.first.path;
                                    // Update the UI to show the attached file
                                  } else {
                                    // User canceled the picker
                                  }
                                } catch (e) {
                                  // Handle any exceptions, such as permission issues
                                  print('Error picking file: $e');
                                }
                              },
                              child: const Text("Attach File"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        if (controller.filePath != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                "Attached File: ${controller.filePath!.split('/').last}"),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: MaterialButton(
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.grey,
                        child: const Text("Cancel"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: MaterialButton(
                        onPressed: () {
                          controller.submitReport();
                        },
                        color: Theme.of(context).colorScheme.primary,
                        child: const Text("Submit Report"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        "• $text", // Prefixing with a bullet point
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }
}
