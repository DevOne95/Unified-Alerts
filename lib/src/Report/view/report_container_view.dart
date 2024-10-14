import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unified_alerts/src/Report/model/report_model.dart';
import 'package:unified_alerts/src/Report/view/comment_bottom_sheet.dart';

class ReportContainerView extends StatelessWidget {
  ReportContainerView({super.key, this.report});

  late ReportModel? report;

  String formatDate(DateTime dateReported) {
    return DateFormat('MMM dd yyyy').format(dateReported);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(report!.bugTitle,
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Text(formatDate(report!.dateReported),
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12))
                ],
              ),
              const SizedBox(height: 10),
              Text(report!.description,
                  style: const TextStyle(color: Colors.black87, fontSize: 12)),
              const SizedBox(height: 10),
              if (report!.attachments.isNotEmpty)
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: report!.attachments.map((attachment) {
                    final imageUrl = attachment['url'];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          imageUrl!,
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return const Center(
                                child: Icon(Icons.error, color: Colors.red));
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const FaIcon(FontAwesomeIcons.heart,
                                  color: Colors.black54)),
                          Text(report!.numberOfHearts.toString(),
                              style: const TextStyle(color: Colors.black54))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                showDragHandle: true,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: CommentBottomSheet(
                                      comments: RxList<Map<Object, dynamic>>(
                                              report!.comments)
                                          .obs(),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const FaIcon(FontAwesomeIcons.comment,
                                color: Colors.black54),
                          ),
                          Text(report!.comments.length.toString(),
                              style: const TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.expand,
                                color: Colors.black54,
                                size: 20,
                              )),
                          const Text("Full View",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
