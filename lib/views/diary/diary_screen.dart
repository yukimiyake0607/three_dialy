import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindow/viewmodels/diary/diary_notifier.dart';
import 'package:mindow/views/diary/widgets/diary_date.dart';
import 'package:mindow/views/diary/widgets/emotion_grid.dart';

class DiaryScreen extends ConsumerStatefulWidget {
  const DiaryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends ConsumerState<DiaryScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncDiaryList = ref.watch(diaryNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text('実装可能か調査中'),
          const Text('昨日の出来事表示'),
          const DiaryDate(),
          TextField(controller: _controller1),
          TextField(controller: _controller2),
          TextField(controller: _controller3),
          const SizedBox(height: 20),
          const EmotionGrid(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final asyncDiaryListNotifier =
                  ref.read(diaryNotifierProvider.notifier);
              final emotion = ref.watch(selectedEmotionProvider);
              final selectedDate = ref.watch(diaryDayProvider);
              asyncDiaryListNotifier.addDiary(
                _controller1.text,
                _controller2.text,
                _controller3.text,
                emotion!,
                selectedDate,
              );
              _controller1.clear();
              _controller2.clear();
              _controller3.clear();
            },
            child: const Text('追加'),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: asyncDiaryList.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final diaryItem = data[index];
                    return ListTile(
                      subtitle: Column(
                        children: [
                          Text(diaryItem.textList[0]),
                          Text(diaryItem.textList[1]),
                          Text(diaryItem.textList[2]),
                          Text(diaryItem.emotion.label),
                        ],
                      ),
                    );
                  },
                );
              },
              error: (error, _) => const CircularProgressIndicator(),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
