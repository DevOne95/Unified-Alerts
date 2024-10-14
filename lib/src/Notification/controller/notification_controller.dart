import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Notification/model/notication_model.dart';

const data = [
  {
    "systemID": 1,
    "systemLogo": null,
    "senderURL":
        "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
    "senderInformation": "Manuel Enriques",
    "subject": "Sick Leave",
    "message":
        "Good morning, I want to file a sick leave for today, October 10, 2024, because I am sick.",
    "date": "2024-10-10T08:00:00Z", // Example string date
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
    "date": "2024-10-11T09:00:00Z", // Example string date
    "seen": true,
    "urgencyLevel": "Medium"
  },
  {
    "systemID": 2,
    "systemLogo": null,
    "senderURL":
        "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
    "senderInformation": "Dr. Alice Reyes",
    "subject": "Appointment Request",
    "message":
        "A patient has requested a video consultation for October 12, 2024.",
    "date": "2024-10-12T10:30:00Z", // Example string date
    "seen": false,
    "urgencyLevel": "High"
  },
  {
    "systemID": 2,
    "systemLogo": null,
    "senderURL":
        "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
    "senderInformation": "Dr. Carlos Villanueva",
    "subject": "Patient Follow-up",
    "message":
        "Please follow up with the patient for their recent telemedicine consultation.",
    "date": "2024-10-09T11:00:00Z", // Example string date
    "seen": true,
    "urgencyLevel": "Low"
  },
  {
    "systemID": 3,
    "systemLogo": null,
    "senderURL":
        "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
    "senderInformation": "Nurse Linda Perez",
    "subject": "Referral Case",
    "message":
        "A new referral case has been submitted for patient transfer to ZCMC.",
    "date": "2024-10-08T08:15:00Z", // Example string date
    "seen": false,
    "urgencyLevel": "High"
  },
  {
    "systemID": 3,
    "systemLogo": null,
    "senderURL":
        "https://qph.cf2.quoracdn.net/main-qimg-e43af1ea0978af7da031068531f8967b-lq",
    "senderInformation": "Dr. Michael Santos",
    "subject": "Referral Update",
    "message":
        "Referral case #12345 has been updated. Please review the new details.",
    "date": "2024-10-07T14:20:00Z", // Example string date
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
    "date": "2024-10-10T09:30:00Z", // Example string date
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
    "date": "2024-10-09T10:00:00Z", // Example string date
    "seen": true,
    "urgencyLevel": "Medium"
  },
];

class NotificationController extends GetxController {
  List<String> tabs = ["All", "UMIS", "Telemedicine", "Referral", "Payroll"];
  RxList<NotificationModel> systems = RxList<NotificationModel>(
          data.map((notif) => NotificationModel.fromJson(notif)).toList())
      .obs();

  RxInt selectedTab = 0.obs;

  void handleButtonPress(int index) {
    selectedTab.value = index;
  }

  List<NotificationModel> getFilteredNotifications() {
    if (selectedTab.value > 0) {
      int systemID = selectedTab.value;
      // Use `where` to filter the notifications based on `systemID`
      return systems.where((notif) => notif.systemID == systemID).toList();
    }

    // Return all notifications if no specific systemID is selected
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
