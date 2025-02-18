import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindow/viewmodels/calender/calender_day_provider.dart';
import 'package:mindow/viewmodels/diary/diary_notifier.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryCalender extends ConsumerWidget {
  const DiaryCalender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calenderFocusedDay = ref.watch(focusedDayProvider);
    final calenderSelectedDay = ref.watch(selectedDayProvider);
    final diaryAsync = ref.watch(diaryNotifierProvider);
    return diaryAsync.when(
      data: (diaries) {
        return TableCalendar(
          focusedDay: calenderFocusedDay,
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2099, 12, 31),

          // 日記がある日を取得
          eventLoader: (day) {
            return diaries.where((diary) => diary.date == day).toList();
          },

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

          // 表示月が変更した場合
          onPageChanged: (focusedDay) {
            // StateNotifierのメソッドを使用して更新
            ref.read(focusedDayProvider.notifier).updateDay(focusedDay);
          },

          // 各日付のスタイルをカスタマイズ
          calendarBuilders: CalendarBuilders(
            // 通常の日付のデザインを設定
            defaultBuilder: (context, day, focusedDay) {
              // 日記がある日付かチェック
              final hasDiary =
                  diaries.any((diary) => isSameDay(diary.date, day));

              if (hasDiary) {
                // 日記がある日付のスタイル
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }
              return null; // デフォルトのスタイルを使用
            },
            // todayBuilder（今日の日付のスタイル）も今後付与
          ),

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
      },
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
