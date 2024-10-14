import 'package:unified_alerts/src/Log%20History/model/log_history_model.dart';

class AccountModel {
  final String systemName;
  final String systemUrl;
  final String systemLogo;
  final String username;
  final String email;
  final List<LoginHistoryModel> loginHistory;

  AccountModel({
    required this.systemName,
    required this.systemUrl,
    required this.systemLogo,
    required this.username,
    required this.email,
    required this.loginHistory,
  });

  // Factory constructor to create an AccountModel from JSON
  factory AccountModel.fromJson(Map<String, dynamic> json) {
    var historyList = (json['loginHistory'] as List)
        .map((item) => LoginHistoryModel.fromJson(item))
        .toList();

    return AccountModel(
      systemName: json['systemName'],
      systemUrl: json['systemUrl'],
      systemLogo: json['systemLogo'],
      username: json['username'],
      email: json['email'],
      loginHistory: historyList,
    );
  }

  // Method to convert Account to JSON
  Map<String, dynamic> toJson() {
    return {
      'systemName': systemName,
      'systemUrl': systemUrl,
      'systemLogo': systemLogo,
      'username': username,
      'email': email,
      'loginHistory': loginHistory.map((history) => history.toJson()).toList(),
    };
  }
}
