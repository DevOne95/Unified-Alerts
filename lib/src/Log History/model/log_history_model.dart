class LoginHistoryModel {
  final DateTime loginDate;
  final String ipAddress;
  final String device;
  final String location;

  LoginHistoryModel({
    required this.loginDate,
    required this.ipAddress,
    required this.device,
    required this.location,
  });

  // Factory constructor to create a LoginHistoryModel from JSON
  factory LoginHistoryModel.fromJson(Map<String, dynamic> json) {
    return LoginHistoryModel(
      loginDate: DateTime.parse(json['loginDate']),
      ipAddress: json['ipAddress'],
      device: json['device'],
      location: json['location'],
    );
  }

  // Method to convert LoginHistory to JSON
  Map<String, dynamic> toJson() {
    return {
      'loginDate': loginDate.toIso8601String(),
      'ipAddress': ipAddress,
      'device': device,
      'location': location,
    };
  }
}
