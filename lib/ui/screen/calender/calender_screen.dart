import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2025, 1, 1),
      lastDay: DateTime.utc(2099, 12, 31),

      // 日付が選択された時の処理
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },

      // 選択された日付に色を塗るか判定
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },

      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },

      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),

      // 曜日を日本語表記
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),

      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true, // タイトルを中央寄せ
      ),
    );
  }
}
