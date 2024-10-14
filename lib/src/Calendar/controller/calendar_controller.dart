import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  late DateTime selectedDay;
  late DateTime focusedDay;
  late CalendarFormat calendarFormat;

  final Map<DateTime, List<String>> events = {
    DateTime(2024, 5, 1): ['Work: 9 AM - 5 PM'],
    DateTime(2024, 5, 3): ['Work: 10 AM - 4 PM'],
    DateTime(2024, 5, 5): ['Work: 8 AM - 4 PM'],
    DateTime(2024, 5, 10): ['Work: 9 AM - 5 PM'],
    DateTime(2024, 5, 15): ['Work: 10 AM - 4 PM'],
    DateTime(2024, 5, 20): ['Work: 8 AM - 4 PM'],
  };

  var selectedEvents = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectedDay = DateTime(2024, 5, 1);
    focusedDay = DateTime(2024, 5, 1);
    calendarFormat = CalendarFormat.month;
    selectedEvents.value = events[selectedDay] ?? [];
  }

  void onDaySelected(DateTime day) {
    if (!isSameDay(selectedDay, day)) {
      selectedDay = day;
      focusedDay = day;
      selectedEvents.value = events[day] ?? [];
      update();
    }
  }
}
