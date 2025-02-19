import 'package:mindow/domain/models/diary_entry.dart';
import 'package:mindow/domain/models/emotion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'diary_notifier.g.dart';

@riverpod
class DiaryNotifier extends _$DiaryNotifier {
  @override
  FutureOr<List<DiaryEntry>> build() {
    return [];
  }

  void addDiary(
    String diary1,
    String diary2,
    String diary3,
    Emotion emotion,
    DateTime date,
  ) {
    final diaryEntry = DiaryEntry(
      id: const Uuid().v4(),
      date: date,
      textList: [
        diary1,
        diary2,
        diary3,
      ],
      emotion: emotion,
      createdAt: DateTime.now(),
    );

    state = AsyncValue.data([...state.value ?? [], diaryEntry]);
  }
}
