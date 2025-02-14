import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindow/domain/models/emotion.dart';

part 'diary_entry.freezed.dart';

@freezed
class DiaryEntry with _$DiaryEntry {
  const factory DiaryEntry({
    required String id,
    required DateTime date,
    required List<String> textList,
    required Emotion emotion,
    required DateTime createdAt,
  }) = _DiaryEntry;
}