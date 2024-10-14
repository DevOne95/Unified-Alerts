class ReportModel {
  final int bugID;
  final DateTime dateReported;
  final int userID;
  final String username;
  final String bugTitle;
  final String description;
  final String severity;
  final List<Map<Object, String>> attachments;
  final String status;
  final String? assignedDeveloper;
  final DateTime? resolutionDate;
  final List<Map<Object, dynamic>> comments;
  final int numberOfHearts;

  ReportModel({
    required this.bugID,
    required this.dateReported,
    required this.userID,
    required this.username,
    required this.bugTitle,
    required this.description,
    required this.severity,
    required this.attachments,
    required this.status,
    required this.assignedDeveloper,
    this.resolutionDate,
    required this.comments,
    required this.numberOfHearts,
  });

  // Factory constructor to create a ReportModel from JSON
  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      bugID: json['bugID'],
      dateReported: DateTime.parse(json['dateReported']),
      userID: json['userID'],
      username: json['username'],
      bugTitle: json['bugTitle'],
      description: json['description'],
      severity: json['severity'],
      attachments: List<Map<Object, String>>.from(json['attachments'] ?? []),
      status: json['status'],
      assignedDeveloper: json['assignedDeveloper'],
      resolutionDate: json['resolutionDate'] != null
          ? DateTime.parse(json['resolutionDate'])
          : null,
      comments: List<Map<Object, dynamic>>.from(json['comments'] ?? []),
      numberOfHearts: json['numberOfHearts'],
    );
  }

  // Method to convert ReportModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'bugID': bugID,
      'dateReported': dateReported.toIso8601String(),
      'userID': userID,
      'username': username,
      'bugTitle': bugTitle,
      'description': description,
      'severity': severity,
      'attachments': attachments,
      'status': status,
      'assignedDeveloper': assignedDeveloper,
      'resolutionDate': resolutionDate?.toIso8601String(),
      'comments': comments,
      'numberOfHearts': numberOfHearts,
    };
  }
}
