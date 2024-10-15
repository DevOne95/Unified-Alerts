class LeaveType {
  String leaveType;
  int totalCredits;
  int usedCredits;
  int remainingCredits;

  LeaveType({
    required this.leaveType,
    required this.totalCredits,
    required this.usedCredits,
    required this.remainingCredits,
  });

  factory LeaveType.fromJson(Map<String, dynamic> json) {
    return LeaveType(
      leaveType: json['leaveType'],
      totalCredits: json['totalCredits'],
      usedCredits: json['usedCredits'],
      remainingCredits: json['remainingCredits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leaveType': leaveType,
      'totalCredits': totalCredits,
      'usedCredits': usedCredits,
      'remainingCredits': remainingCredits,
    };
  }
}
