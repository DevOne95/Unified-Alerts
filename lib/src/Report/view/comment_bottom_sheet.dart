import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/src/Report/controller/report_controller.dart';
import 'package:unified_alerts/src/Report/view/comment_view.dart';

class CommentBottomSheet extends GetView<ReportController> {
  const CommentBottomSheet({super.key, this.comments});

  final RxList<Map<Object, dynamic>>? comments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Use Expanded to allow ListView to take available space
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: comments!.length,
                itemBuilder: (context, index) {
                  return CommentView(
                    senderURL: comments![index]['senderURL']!,
                    senderName: comments![index]['senderName']!,
                    comment: comments![index]['comment']!,
                    date: comments![index]['dateCommented']!,
                  );
                },
              ),
            ),
          ),
          // Input component
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.comment,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Type your comment...',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        focusColor: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
