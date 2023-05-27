// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedQuizzesStruct extends BaseStruct {
  FeedQuizzesStruct({
    int? index,
    int? myAnswer,
  })  : _index = index,
        _myAnswer = myAnswer;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  // "my_answer" field.
  int? _myAnswer;
  int get myAnswer => _myAnswer ?? 0;
  set myAnswer(int? val) => _myAnswer = val;
  void incrementMyAnswer(int amount) => _myAnswer = myAnswer + amount;
  bool hasMyAnswer() => _myAnswer != null;

  static FeedQuizzesStruct fromMap(Map<String, dynamic> data) =>
      FeedQuizzesStruct(
        index: data['index'] as int?,
        myAnswer: data['my_answer'] as int?,
      );

  static FeedQuizzesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FeedQuizzesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'index': _index,
        'my_answer': _myAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'my_answer': serializeParam(
          _myAnswer,
          ParamType.int,
        ),
      }.withoutNulls;

  static FeedQuizzesStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeedQuizzesStruct(
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        myAnswer: deserializeParam(
          data['my_answer'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FeedQuizzesStruct(${toMap()})';
}

FeedQuizzesStruct createFeedQuizzesStruct({
  int? index,
  int? myAnswer,
}) =>
    FeedQuizzesStruct(
      index: index,
      myAnswer: myAnswer,
    );
