import 'package:get/get.dart';
import 'package:unified_alerts/src/Report/model/heart.dart';

class CommentModel {
  final int senderID;
  final String senderName;
  final String senderURL;
  final String comment;
  final RxList<Heart> hearts; // Updated to use Heart model
  final DateTime dateCommented;

  CommentModel({
    required this.senderID,
    required this.senderName,
    required this.senderURL,
    required this.comment,
    required this.hearts,
    required this.dateCommented,
  });

  // Factory method to create a CommentModel from JSON
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      senderID: json['senderID'],
      senderName: json['senderName'],
      senderURL: json['senderURL'],
      comment: json['comment'],
      hearts: RxList<Heart>((json['hearts'] as List<dynamic>)
          .map((heartJson) => Heart.fromJson(heartJson))
          .toList()),
      dateCommented: DateTime.parse(json['dateCommented']),
    );
  }

  // Method to convert CommentModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'senderName': senderName,
      'senderURL': senderURL,
      'comment': comment,
      'hearts': hearts,
      'dateCommented': dateCommented.toIso8601String(),
    };
  }
}
