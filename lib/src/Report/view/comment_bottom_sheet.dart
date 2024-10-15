import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unified_alerts/src/Report/controller/report_controller.dart';
import 'package:unified_alerts/src/Report/model/comment_model.dart';
import 'package:unified_alerts/src/Report/view/comment_view.dart';

class CommentBottomSheet extends GetView<ReportController> {
  final int? bugID;
  final int? numberOfHearts;
  final RxList<CommentModel>? comments;

  const CommentBottomSheet(
      {super.key,
      required this.bugID,
      this.numberOfHearts,
      required this.comments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.solidHeart,
                color: numberOfHearts == 0 ? Colors.black12 : Colors.red,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(numberOfHearts.toString(),
                  style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              child: Obx(
                () => ListView.builder(
                  itemCount: comments!.length,
                  itemBuilder: (context, index) {
                    // Access the current comment using the index
                    return CommentView(
                        bugID: bugID,
                        commentModel: comments![index]); // Change here
                  },
                ),
              ),
            ),
          ),
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
                    onTap: () {
                      if (comments != null) {
                        // Add new comment to the list
                        CommentModel newComment = controller.addComment(bugID!);
                        comments!
                            .add(newComment); // Add the new comment to the list
                        comments!.refresh(); // Refresh the observable list
                      }
                    },
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
