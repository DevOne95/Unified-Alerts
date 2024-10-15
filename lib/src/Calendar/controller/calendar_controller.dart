import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unified_alerts/main.dart';

DateTime get _now => DateTime.now();

List<CalendarEventData> events = [
  CalendarEventData(
    date: DateTime(_now.year, _now.month, 1, 18, 30),
    endDate: DateTime(_now.year, _now.month, 5, 18, 30),
    title: "8am-5pm",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, 1, 5, 30),
    endTime: DateTime(_now.year, _now.month, 1, 26),
    titleStyle: const TextStyle(fontSize: 11, color: Colors.white),
    color: primaryColor,
  )
];

class CalendarController extends GetxController {
  RxList<CalendarEventData> mySchedule = RxList<CalendarEventData>(events);
  final EventController eventController = EventController()..addAll(events);

  Rxn<CalendarEventData> selectedEvent = Rxn<CalendarEventData>(null).obs();

  var selectedEvents = <String>[].obs;
}
