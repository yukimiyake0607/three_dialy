import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindow/viewmodels/calender/calender_day_provider.dart';
import 'package:mindow/viewmodels/diary/diary_notifier.dart';
import 'package:table_calendar/table_calendar.dart';

class DiaryContent extends ConsumerWidget {
  const DiaryContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final asyncDiaryList = ref.watch(diaryNotifierProvider);

    if (selectedDay == null) {
      return const Center(child: Text('日付を選択してください'));
    }

    return asyncDiaryList.when(
      data: (diaries) {
        final todayDiary =
            diaries.where((d) => isSameDay(d.date, selectedDay)).toList();

        if (todayDiary.isEmpty) {
          return const Center(child: Text('日記がありません'));
        }

        return Column(
          children: [
            const Text('日記'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${todayDiary[0].date}'),
                Text('${todayDiary[0].emotion}'),
              ],
            ),
            Text(todayDiary[0].textList[0]),
            Text(todayDiary[0].textList[1]),
            Text(todayDiary[0].textList[2]),
          ],
        );
      },
      error: (_, __) => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
