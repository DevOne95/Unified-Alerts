import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<String> tabs = ["All", "UMIS", "Telemedicine", "Referral", "Payroll"];
  List<Map<Object, dynamic>> systems = [
    {
      "systemID": 1,
      "senderURL":
          "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
      "senderInformation": "Manuel Enriques",
      "subject": "Sick Leave",
      "message":
          "Good morning, I want to file a sick leave for today, October 10, 2024, because I am sick.",
      "date": DateTime.now(),
      "seen": false,
      "urgencyLevel": "High"
    },
    {
      "systemID": 1,
      "senderURL":
          "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
      "senderInformation": "John Doe",
      "subject": "Project Report",
      "message": "Please submit the UMIS project report by tomorrow.",
      "date": DateTime.now(),
      "seen": true,
      "urgencyLevel": "Medium"
    },
    {
      "systemID": 2,
      "senderURL":
          "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
      "senderInformation": "Dr. Alice Reyes",
      "subject": "Appointment Request",
      "message":
          "A patient has requested a video consultation for October 12, 2024.",
      "date": DateTime.now(),
      "seen": false,
      "urgencyLevel": "High"
    },
    {
      "systemID": 2,
      "senderURL":
          "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
      "senderInformation": "Dr. Carlos Villanueva",
      "subject": "Patient Follow-up",
      "message":
          "Please follow up with the patient for their recent telemedicine consultation.",
      "date": DateTime.now(),
      "seen": true,
      "urgencyLevel": "Low"
    },
    {
      "systemID": 3,
      "senderURL":
          "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
      "senderInformation": "Nurse Linda Perez",
      "subject": "Referral Case",
      "message":
          "A new referral case has been submitted for patient transfer to ZCMC.",
      "date": DateTime.now(),
      "seen": false,
      "urgencyLevel": "High"
    },
    {
      "systemID": 3,
      "senderURL":
          "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
      "senderInformation": "Dr. Michael Santos",
      "subject": "Referral Update",
      "message":
          "Referral case #12345 has been updated. Please review the new details.",
      "date": DateTime.now(),
      "seen": true,
      "urgencyLevel": "Medium"
    },
    {
      "systemID": 4,
      "systemLogo":
          "https://telemedicine.zcmc.online/assets/zcmc_logo-9ea97785.png",
      "senderURL": null,
      "senderInformation": "HR Department",
      "subject": "Payroll Processed",
      "message": "Your payroll for October has been processed successfully.",
      "date": DateTime.now(),
      "seen": false,
      "urgencyLevel": "Low"
    },
    {
      "systemID": 4,
      "systemLogo":
          "https://telemedicine.zcmc.online/assets/zcmc_logo-9ea97785.png",
      "senderURL": null,
      "senderInformation": "Finance Team",
      "subject": "Tax Deduction Update",
      "message":
          "An update regarding your tax deductions has been applied for the month of October.",
      "date": DateTime.now(),
      "seen": true,
      "urgencyLevel": "Medium"
    },
  ];

  RxInt selectedTab = 0.obs;

  void handleButtonPress(int index) {
    selectedTab.value = index;
  }

  List<Map<Object, dynamic>> getFilteredNotifications() {
    if (selectedTab.value > 0) {
      int systemID = selectedTab.value;
      return systems
          .where((notification) => notification['systemID'] == systemID)
          .toList();
    }

    return systems;
  }

// Function to determine the color of the badge based on urgency level
  Color getUrgencyColor(String urgencyLevel) {
    switch (urgencyLevel) {
      case 'High':
        return Colors.red; // Red for high urgency
      case 'Medium':
        return Colors.orange; // Orange for medium urgency
      case 'Low':
        return Colors.green; // Green for low urgency
      default:
        return Colors.grey; // Default color if none match
    }
  }
}
