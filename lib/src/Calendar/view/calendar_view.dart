import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unified_alerts/src/Calendar/controller/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<CalendarController>(
        builder: (controller) {
          return Column(
            children: [
              TableCalendar<String>(
                firstDay: DateTime(2024, 10, 10),
                lastDay: DateTime(2024, 10, 20),
                focusedDay: controller.focusedDay,
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDay, day),
                calendarFormat: controller.calendarFormat,
                onFormatChanged: (format) {
                  controller.calendarFormat = format;
                  controller.update(); // Notify listeners
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.onDaySelected(selectedDay);
                },
                eventLoader: (day) => controller.events[day] ?? [],
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  markersMaxCount: 1,
                ),
              ),
              const SizedBox(height: 8.0),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.selectedEvents.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.selectedEvents[index]),
                      );
                    },
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
