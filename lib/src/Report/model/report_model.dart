import 'package:get/get.dart';
import 'package:unified_alerts/src/Profile/controller/profile_controller.dart';
import 'package:unified_alerts/src/Profile/model/profile_model.dart';
import 'package:unified_alerts/src/Report/model/comment_model.dart';
import 'package:unified_alerts/src/Report/model/heart.dart';

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
  final RxList<CommentModel> comments; // Updated to use CommentModel
  final RxList<Heart> hearts; // Updated to use Heart model

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
    required this.hearts, // Updated to include hearts
  });

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
      // Updated to map JSON comments to CommentModel instances
      comments: RxList<CommentModel>((json['comments'] as List<dynamic>)
              .map((commentJson) => CommentModel.fromJson(commentJson))
              .toList())
          .obs(),
      // Updated to map JSON hearts to Heart instances
      hearts: RxList<Heart>((json['hearts'] as List<dynamic>)
              .map((heartJson) => Heart.fromJson(heartJson))
              .toList())
          .obs(),
    );
  }

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
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'hearts': hearts.map((heart) => heart.toJson()).toList(),
    };
  }

  void addComment(CommentModel comment) => comments.add(comment);

  void addHeart() {
    ProfileController profileController = Get.find<ProfileController>();
    ProfileModel profile = profileController.user;

    hearts.add(
      Heart(
        userID: profile.userID,
        userName: profile.name,
        userURL: profile.url ?? "",
      ),
    );
  }

  void removeHeart() {
    ProfileController profileController = Get.find<ProfileController>();
    ProfileModel profile = profileController.user;

    // Remove hearts where the userID matches the current user's ID
    hearts.removeWhere((heart) => heart.userID == profile.userID);
  }

  int myID() {
    ProfileController profileController = Get.find<ProfileController>();
    ProfileModel profile = profileController.user;

    return profile.userID;
  }

  int get numberOfHearts => hearts.length;
}
