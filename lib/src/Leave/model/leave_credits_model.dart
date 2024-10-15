import 'package:unified_alerts/src/Leave/model/leave_type_model.dart';
import 'package:unified_alerts/src/Leave/model/remaining_leave_model.dart';
import 'package:unified_alerts/src/Leave/model/use_leave_model.dart';

class LeaveCreditsModel {
  int totalLeave;
  UsedLeave usedLeave;
  RemainingLeave remainingLeave;
  List<LeaveType> leaveTypes;

  LeaveCreditsModel({
    required this.totalLeave,
    required this.usedLeave,
    required this.remainingLeave,
    required this.leaveTypes,
  });

  factory LeaveCreditsModel.fromJson(Map<String, dynamic> json) {
    return LeaveCreditsModel(
      totalLeave: json['totalLeave'],
      usedLeave: UsedLeave.fromJson(json['usedLeave']),
      remainingLeave: RemainingLeave.fromJson(json['remainingLeave']),
      leaveTypes: (json['leaveTypes'] as List)
          .map((e) => LeaveType.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalLeave': totalLeave,
      'usedLeave': usedLeave.toJson(),
      'remainingLeave': remainingLeave.toJson(),
      'leaveTypes': leaveTypes.map((e) => e.toJson()).toList(),
    };
  }
}
