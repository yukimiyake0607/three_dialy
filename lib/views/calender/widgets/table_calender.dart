import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindow/viewmodels/calender/calender_day_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryCalender extends ConsumerWidget {
  const DiaryCalender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calenderFocusedDay = ref.watch(focusedDayProvider);
    final calenderSelectedDay = ref.watch(selectedDayProvider);
    return TableCalendar(
      focusedDay: calenderFocusedDay,
      firstDay: DateTime.utc(2025, 1, 1),
      lastDay: DateTime.utc(2099, 12, 31),

      // 日付が選択された時の処理
      onDaySelected: (selectedDay, focusedDay) {
        ref.read(selectedDayProvider.notifier).updateDay(selectedDay);
        ref.read(focusedDayProvider.notifier).updateDay(focusedDay);
      },

      // 選択された日付に色を塗るか判定
      selectedDayPredicate: (day) {
        return calenderSelectedDay != null &&
            isSameDay(calenderSelectedDay, day);
      },

      onPageChanged: (focusedDay) {
        // StateNotifierのメソッドを使用して更新
        ref.read(focusedDayProvider.notifier).updateDay(focusedDay);
      },

      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        weekendTextStyle: TextStyle(color: Colors.red),
      ),

      // 曜日を日本語表記
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),

      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true, // タイトルを中央寄せ
      ),

      locale: 'ja_JP',
    );
  }
}
