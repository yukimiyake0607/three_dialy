import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// 外部に日記の日付を提供するため
final diaryDayProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

class DiaryDate extends ConsumerWidget {
  const DiaryDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(diaryDayProvider);
    final dateFormat = DateFormat('yyyy年MM月dd日', 'ja_JP');

    void changeDate(int days) {
      ref.read(diaryDayProvider.notifier).state =
          selectedDate.add(Duration(days: days));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => changeDate(-1),
            icon: const Icon(Icons.arrow_left),
          ),
          Text(
            dateFormat.format(selectedDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () => changeDate(1),
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
