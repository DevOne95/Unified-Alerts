import 'package:unified_alerts/src/Leave/model/timeline_event_model.dart';

class LeaveModel {
  final int id;
  final String employeeId;
  final String name;
  final String leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final String reason;
  final List<TimelineEventModel> timeline;

  LeaveModel({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.reason,
    required this.timeline,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    var timelineJson = json['timeline'] as List<dynamic>? ?? [];
    List<TimelineEventModel> timelineList = timelineJson
        .map((event) => TimelineEventModel.fromJson(event))
        .toList();

    return LeaveModel(
      id: json['id'],
      employeeId: json['employeeId'],
      name: json['name'],
      leaveType: "${json['leaveType']} Leave",
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      status: json['status'],
      reason: json['reason'],
      timeline: timelineList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employeeId': employeeId,
      'name': name,
      'leaveType': leaveType,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'reason': reason,
      'timeline': timeline.map((event) => event.toJson()).toList(),
    };
  }
}
