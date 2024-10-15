class UsedLeave {
  int sickLeave;
  int vacationLeave;
  int personalLeave;

  UsedLeave({
    required this.sickLeave,
    required this.vacationLeave,
    required this.personalLeave,
  });

  factory UsedLeave.fromJson(Map<String, dynamic> json) {
    return UsedLeave(
      sickLeave: json['sickLeave'],
      vacationLeave: json['vacationLeave'],
      personalLeave: json['personalLeave'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sickLeave': sickLeave,
      'vacationLeave': vacationLeave,
      'personalLeave': personalLeave,
    };
  }
}
