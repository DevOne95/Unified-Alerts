class TimelineEventModel {
  final DateTime date;
  final String status;
  final String description;

  TimelineEventModel({
    required this.date,
    required this.status,
    required this.description,
  });

  // Factory constructor to create a TimelineEventModel from JSON data
  factory TimelineEventModel.fromJson(Map<String, dynamic> json) {
    return TimelineEventModel(
      date: DateTime.parse(json['date']),
      status: json['status'],
      description: json['description'],
    );
  }

  // Method to convert TimelineEvent to JSON
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'status': status,
      'description': description,
    };
  }
}
