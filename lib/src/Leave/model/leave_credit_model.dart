import 'package:unified_alerts/src/Leave/model/leave_credits_model.dart';

class LeaveCreditModel {
  String employeeId;
  String employeeName;
  LeaveCreditsModel leaveCredits;
  DateTime lastUpdated;

  LeaveCreditModel({
    required this.employeeId,
    required this.employeeName,
    required this.leaveCredits,
    required this.lastUpdated,
  });

  factory LeaveCreditModel.fromJson(Map<String, dynamic> json) {
    return LeaveCreditModel(
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      leaveCredits: LeaveCreditsModel.fromJson(json['leaveCredits']),
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'employeeName': employeeName,
      'leaveCredits': leaveCredits.toJson(),
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}
