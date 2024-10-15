class RemainingLeave {
  int sickLeave;
  int vacationLeave;
  int personalLeave;

  RemainingLeave({
    required this.sickLeave,
    required this.vacationLeave,
    required this.personalLeave,
  });

  factory RemainingLeave.fromJson(Map<String, dynamic> json) {
    return RemainingLeave(
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
