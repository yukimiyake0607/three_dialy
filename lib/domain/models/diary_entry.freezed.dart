// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiaryEntry {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<String> get textList => throw _privateConstructorUsedError;
  Emotion get emotion => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiaryEntryCopyWith<DiaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryEntryCopyWith<$Res> {
  factory $DiaryEntryCopyWith(
          DiaryEntry value, $Res Function(DiaryEntry) then) =
      _$DiaryEntryCopyWithImpl<$Res, DiaryEntry>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      List<String> textList,
      Emotion emotion,
      DateTime createdAt});
}

/// @nodoc
class _$DiaryEntryCopyWithImpl<$Res, $Val extends DiaryEntry>
    implements $DiaryEntryCopyWith<$Res> {
  _$DiaryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? textList = null,
    Object? emotion = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      textList: null == textList
          ? _value.textList
          : textList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaryEntryImplCopyWith<$Res>
    implements $DiaryEntryCopyWith<$Res> {
  factory _$$DiaryEntryImplCopyWith(
          _$DiaryEntryImpl value, $Res Function(_$DiaryEntryImpl) then) =
      __$$DiaryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      List<String> textList,
      Emotion emotion,
      DateTime createdAt});
}

/// @nodoc
class __$$DiaryEntryImplCopyWithImpl<$Res>
    extends _$DiaryEntryCopyWithImpl<$Res, _$DiaryEntryImpl>
    implements _$$DiaryEntryImplCopyWith<$Res> {
  __$$DiaryEntryImplCopyWithImpl(
      _$DiaryEntryImpl _value, $Res Function(_$DiaryEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? textList = null,
    Object? emotion = null,
    Object? createdAt = null,
  }) {
    return _then(_$DiaryEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      textList: null == textList
          ? _value._textList
          : textList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emotion: null == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as Emotion,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DiaryEntryImpl implements _DiaryEntry {
  const _$DiaryEntryImpl(
      {required this.id,
      required this.date,
      required final List<String> textList,
      required this.emotion,
      required this.createdAt})
      : _textList = textList;

  @override
  final String id;
  @override
  final DateTime date;
  final List<String> _textList;
  @override
  List<String> get textList {
    if (_textList is EqualUnmodifiableListView) return _textList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textList);
  }

  @override
  final Emotion emotion;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DiaryEntry(id: $id, date: $date, textList: $textList, emotion: $emotion, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._textList, _textList) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date,
      const DeepCollectionEquality().hash(_textList), emotion, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaryEntryImplCopyWith<_$DiaryEntryImpl> get copyWith =>
      __$$DiaryEntryImplCopyWithImpl<_$DiaryEntryImpl>(this, _$identity);
}

abstract class _DiaryEntry implements DiaryEntry {
  const factory _DiaryEntry(
      {required final String id,
      required final DateTime date,
      required final List<String> textList,
      required final Emotion emotion,
      required final DateTime createdAt}) = _$DiaryEntryImpl;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  List<String> get textList;
  @override
  Emotion get emotion;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DiaryEntryImplCopyWith<_$DiaryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
