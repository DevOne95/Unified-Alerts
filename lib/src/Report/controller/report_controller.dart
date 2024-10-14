import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Report/model/report_model.dart';

const data = [
  {
    "bugID": 1,
    "dateReported": "2024-10-14 10:15:00",
    "userID": 101,
    "username": "johndoe",
    "bugTitle": "Unable to login with correct credentials",
    "description":
        "The user enters correct credentials but is redirected back to the login page with no error message.",
    "severity": "High",
    "attachments": [
      {
        "fileName": "OnePiece.png",
        "url":
            "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ1zvYZXUaAA5SbdNvFg4mwtiPTQvclOvGTV8TF7SlWab85uITqtRi3L2UdVxwLLrxSFLMZPj_E9edG-Vo5JtUCoWRSYagW6h7Hv9pLSA0",
        "type": "image/png"
      },
      {
        "fileName": "gearfift.png",
        "url":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3-8p-q2fLgLP97W4F59n151cjwobz7w56bg&s",
        "type": "text/plain"
      }
    ],
    "status": "Reported",
    "assignedDeveloper": null,
    "resolutionDate": null,
    "comments": [
      {
        "senderID": 201,
        "senderName": "alice_b",
        "senderURL": "https://example.com/alice",
        "comment": "I encountered the same issue yesterday.",
        "numberOfHearts": 5,
        "dateCommented": "2024-10-14 11:00:00"
      },
      {
        "senderID": 202,
        "senderName": "bob_c",
        "senderURL": "https://example.com/bob",
        "comment": "Thanks for reporting this!",
        "numberOfHearts": 3,
        "dateCommented": "2024-10-14 12:30:00"
      }
    ],
    "numberOfHearts": 10
  },
  {
    "bugID": 2,
    "dateReported": "2024-10-14 11:00:00",
    "userID": 102,
    "username": "janedoe",
    "bugTitle": "Profile picture upload fails",
    "description":
        "The upload button for the profile picture does not work. No file is uploaded.",
    "severity": "Medium",
    "attachments": [],
    "status": "In Progress",
    "assignedDeveloper": "dev_james",
    "resolutionDate": null,
    "comments": [
      {
        "senderID": 203,
        "senderName": "charlie_d",
        "senderURL": "https://example.com/charlie",
        "comment": "Investigating the issue with file uploads.",
        "numberOfHearts": 2,
        "dateCommented": "2024-10-14 11:15:00"
      }
    ],
    "numberOfHearts": 8
  },
  {
    "bugID": 3,
    "dateReported": "2024-10-13 09:45:00",
    "userID": 103,
    "username": "sam_smith",
    "bugTitle": "404 error on clicking 'Help' link",
    "description":
        "The 'Help' link in the footer navigates to a 404 error page.",
    "severity": "Low",
    "attachments": [],
    "status": "Resolved",
    "assignedDeveloper": "dev_lucy",
    "resolutionDate": "2024-10-13 14:20:00",
    "comments": [
      {
        "senderID": 204,
        "senderName": "diana_e",
        "senderURL": "https://example.com/diana",
        "comment": "Fixed by correcting the link in the footer.",
        "numberOfHearts": 1,
        "dateCommented": "2024-10-13 15:00:00"
      }
    ],
    "numberOfHearts": 5
  },
  {
    "bugID": 4,
    "dateReported": "2024-10-12 14:30:00",
    "userID": 104,
    "username": "mike99",
    "bugTitle": "Slow page load on dashboard",
    "description":
        "The dashboard takes more than 10 seconds to load after login.",
    "severity": "High",
    "attachments": [],
    "status": "In Progress",
    "assignedDeveloper": "dev_alex",
    "resolutionDate": null,
    "comments": [
      {
        "senderID": 205,
        "senderName": "eve_f",
        "senderURL": "https://example.com/eve",
        "comment": "Working on optimizing queries for faster load times.",
        "numberOfHearts": 4,
        "dateCommented": "2024-10-12 15:45:00"
      }
    ],
    "numberOfHearts": 12
  },
  {
    "bugID": 5,
    "dateReported": "2024-10-12 16:50:00",
    "userID": 105,
    "username": "sarah_jane",
    "bugTitle": "Form validation error not visible",
    "description":
        "When submitting the form without a required field, no validation error appears on the screen.",
    "severity": "Medium",
    "attachments": [],
    "status": "Reported",
    "assignedDeveloper": null,
    "resolutionDate": null,
    "comments": [],
    "numberOfHearts": 7
  },
  {
    "bugID": 6,
    "dateReported": "2024-10-11 10:10:00",
    "userID": 106,
    "username": "tom_hardy",
    "bugTitle": "Search functionality not returning results",
    "description":
        "Entering a search term does not return any results, even when valid data is present.",
    "severity": "High",
    "attachments": [],
    "status": "In Progress",
    "assignedDeveloper": "dev_maria",
    "resolutionDate": null,
    "comments": [
      {
        "senderID": 206,
        "senderName": "frank_g",
        "senderURL": "https://example.com/frank",
        "comment": "Debugging search query issues.",
        "numberOfHearts": 3,
        "dateCommented": "2024-10-11 11:30:00"
      }
    ],
    "numberOfHearts": 11
  },
  {
    "bugID": 7,
    "dateReported": "2024-10-10 12:25:00",
    "userID": 107,
    "username": "nina_p",
    "bugTitle": "Logout button unresponsive",
    "description":
        "Clicking the logout button does not log the user out of the application.",
    "severity": "Medium",
    "attachments": [],
    "status": "Resolved",
    "assignedDeveloper": "dev_ryan",
    "resolutionDate": "2024-10-11 09:00:00",
    "comments": [
      {
        "senderID": 207,
        "senderName": "george_h",
        "senderURL": "https://example.com/george",
        "comment": "Issue resolved by fixing the onClick handler for logout.",
        "numberOfHearts": 6,
        "dateCommented": "2024-10-10 13:00:00"
      }
    ],
    "numberOfHearts": 9
  },
  {
    "bugID": 8,
    "dateReported": "2024-10-10 15:00:00",
    "userID": 108,
    "username": "lucy_w",
    "bugTitle": "Button misaligned on mobile view",
    "description":
        "The 'Submit' button on the contact form is misaligned on smaller mobile screens.",
    "severity": "Low",
    "attachments": [],
    "status": "Reported",
    "assignedDeveloper": null,
    "resolutionDate": null,
    "comments": [],
    "numberOfHearts": 4
  },
  {
    "bugID": 9,
    "dateReported": "2024-10-09 18:40:00",
    "userID": 109,
    "username": "mark_r",
    "bugTitle": "Notification sound not playing",
    "description":
        "When a new message is received, the notification sound does not play.",
    "severity": "Medium",
    "attachments": [],
    "status": "In Progress",
    "assignedDeveloper": "dev_claire",
    "resolutionDate": null,
    "comments": [
      {
        "senderID": 208,
        "senderName": "hannah_i",
        "senderURL": "https://example.com/hannah",
        "comment": "Looking into audio playback settings.",
        "numberOfHearts": 1,
        "dateCommented": "2024-10-09 19:00:00"
      }
    ],
    "numberOfHearts": 3
  },
  {
    "bugID": 10,
    "dateReported": "2024-10-09 10:00:00",
    "userID": 110,
    "username": "olivia_j",
    "bugTitle": "Password reset link not sent",
    "description":
        "Users do not receive a password reset email after requesting one.",
    "severity": "High",
    "attachments": [],
    "status": "Reported",
    "assignedDeveloper": null,
    "resolutionDate": null,
    "comments": [
      {
        "senderID": 209,
        "senderName": "ivan_j",
        "senderURL": "https://example.com/ivan",
        "comment": "This is a critical issue! We need to prioritize it.",
        "numberOfHearts": 4,
        "dateCommented": "2024-10-09 10:30:00"
      }
    ],
    "numberOfHearts": 6
  }
];

class ReportController extends GetxController {
  String? filePath;
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final TextEditingController comment = TextEditingController();

  final List<String> reportTitles = [
    'Incident Report',
    'Safety Report',
    'Maintenance Report',
    'Other',
  ];

  final List<String> reportPurposes = [
    "Documentation: Users can provide detailed accounts of events or issues, ensuring that critical information is captured for future reference.",
    "Communication: Reports facilitate effective communication between team members, departments, or stakeholders, allowing for timely sharing of insights and updates.",
    "Actionable Insights: By submitting a report, users contribute valuable data that can lead to informed decision-making, helping to address problems or improve processes.",
    "Accountability: The report serves as a record of actions taken or issues identified, fostering accountability within the organization.",
    "Improvement: Analyzing submitted reports can help identify trends and areas for improvement, ultimately enhancing overall operational efficiency."
  ];

  String? selectedTitle;

  RxList<ReportModel> reports = RxList<ReportModel>(
          data.map((item) => ReportModel.fromJson(item)).toList())
      .obs();

  void addComment(String value) {}

  void submitReport() {}
}
