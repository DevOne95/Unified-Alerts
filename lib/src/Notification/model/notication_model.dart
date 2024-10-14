class NotificationModel {
  final int systemID;
  final String? systemLogo;
  final String? senderURL;
  final String senderInformation;
  final String subject;
  final String message;
  final DateTime date;
  final bool seen;
  final String urgencyLevel;

  NotificationModel({
    required this.systemID,
    required this.systemLogo,
    required this.senderURL,
    required this.senderInformation,
    required this.subject,
    required this.message,
    required this.date,
    required this.seen,
    required this.urgencyLevel,
  });

  // Factory constructor to create a NotificationModel from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      systemID: json['systemID'],
      systemLogo: json['systemLogo'],
      senderURL: json['senderURL'],
      senderInformation: json['senderInformation'],
      subject: json['subject'],
      message: json['message'],
      date: DateTime.parse(json['date']), // Ensure the date is parsed correctly
      seen: json['seen'],
      urgencyLevel: json['urgencyLevel'],
    );
  }

  // Method to convert NotificationModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'systemID': systemID,
      'systemLogo': systemLogo,
      'senderURL': senderURL,
      'senderInformation': senderInformation,
      'subject': subject,
      'message': message,
      'date': date.toIso8601String(), // Convert DateTime to String
      'seen': seen,
      'urgencyLevel': urgencyLevel,
    };
  }
}
