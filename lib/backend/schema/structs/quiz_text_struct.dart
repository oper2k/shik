// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizTextStruct extends BaseStruct {
  QuizTextStruct({
    String? question,
    String? answer1,
    String? answer2,
    String? answer3,
    String? answer4,
    String? answer1ImageUrl,
    String? answer2ImageUrl,
    String? answer3ImageUrl,
    String? answer4ImageUrl,
    String? correctDefinition,
    int? correctAnswer,
    String? difficulty,
  })  : _question = question,
        _answer1 = answer1,
        _answer2 = answer2,
        _answer3 = answer3,
        _answer4 = answer4,
        _answer1ImageUrl = answer1ImageUrl,
        _answer2ImageUrl = answer2ImageUrl,
        _answer3ImageUrl = answer3ImageUrl,
        _answer4ImageUrl = answer4ImageUrl,
        _correctDefinition = correctDefinition,
        _correctAnswer = correctAnswer,
        _difficulty = difficulty;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "answer_1" field.
  String? _answer1;
  String get answer1 => _answer1 ?? '';
  set answer1(String? val) => _answer1 = val;
  bool hasAnswer1() => _answer1 != null;

  // "answer_2" field.
  String? _answer2;
  String get answer2 => _answer2 ?? '';
  set answer2(String? val) => _answer2 = val;
  bool hasAnswer2() => _answer2 != null;

  // "answer_3" field.
  String? _answer3;
  String get answer3 => _answer3 ?? '';
  set answer3(String? val) => _answer3 = val;
  bool hasAnswer3() => _answer3 != null;

  // "answer_4" field.
  String? _answer4;
  String get answer4 => _answer4 ?? '';
  set answer4(String? val) => _answer4 = val;
  bool hasAnswer4() => _answer4 != null;

  // "answer_1_image_url" field.
  String? _answer1ImageUrl;
  String get answer1ImageUrl => _answer1ImageUrl ?? '';
  set answer1ImageUrl(String? val) => _answer1ImageUrl = val;
  bool hasAnswer1ImageUrl() => _answer1ImageUrl != null;

  // "answer_2_image_url" field.
  String? _answer2ImageUrl;
  String get answer2ImageUrl => _answer2ImageUrl ?? '';
  set answer2ImageUrl(String? val) => _answer2ImageUrl = val;
  bool hasAnswer2ImageUrl() => _answer2ImageUrl != null;

  // "answer_3_image_url" field.
  String? _answer3ImageUrl;
  String get answer3ImageUrl => _answer3ImageUrl ?? '';
  set answer3ImageUrl(String? val) => _answer3ImageUrl = val;
  bool hasAnswer3ImageUrl() => _answer3ImageUrl != null;

  // "answer_4_image_url" field.
  String? _answer4ImageUrl;
  String get answer4ImageUrl => _answer4ImageUrl ?? '';
  set answer4ImageUrl(String? val) => _answer4ImageUrl = val;
  bool hasAnswer4ImageUrl() => _answer4ImageUrl != null;

  // "correct_definition" field.
  String? _correctDefinition;
  String get correctDefinition => _correctDefinition ?? '';
  set correctDefinition(String? val) => _correctDefinition = val;
  bool hasCorrectDefinition() => _correctDefinition != null;

  // "correct_answer" field.
  int? _correctAnswer;
  int get correctAnswer => _correctAnswer ?? 0;
  set correctAnswer(int? val) => _correctAnswer = val;
  void incrementCorrectAnswer(int amount) =>
      _correctAnswer = correctAnswer + amount;
  bool hasCorrectAnswer() => _correctAnswer != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  set difficulty(String? val) => _difficulty = val;
  bool hasDifficulty() => _difficulty != null;

  static QuizTextStruct fromMap(Map<String, dynamic> data) => QuizTextStruct(
        question: data['question'] as String?,
        answer1: data['answer_1'] as String?,
        answer2: data['answer_2'] as String?,
        answer3: data['answer_3'] as String?,
        answer4: data['answer_4'] as String?,
        answer1ImageUrl: data['answer_1_image_url'] as String?,
        answer2ImageUrl: data['answer_2_image_url'] as String?,
        answer3ImageUrl: data['answer_3_image_url'] as String?,
        answer4ImageUrl: data['answer_4_image_url'] as String?,
        correctDefinition: data['correct_definition'] as String?,
        correctAnswer: data['correct_answer'] as int?,
        difficulty: data['difficulty'] as String?,
      );

  static QuizTextStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QuizTextStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer_1': _answer1,
        'answer_2': _answer2,
        'answer_3': _answer3,
        'answer_4': _answer4,
        'answer_1_image_url': _answer1ImageUrl,
        'answer_2_image_url': _answer2ImageUrl,
        'answer_3_image_url': _answer3ImageUrl,
        'answer_4_image_url': _answer4ImageUrl,
        'correct_definition': _correctDefinition,
        'correct_answer': _correctAnswer,
        'difficulty': _difficulty,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer_1': serializeParam(
          _answer1,
          ParamType.String,
        ),
        'answer_2': serializeParam(
          _answer2,
          ParamType.String,
        ),
        'answer_3': serializeParam(
          _answer3,
          ParamType.String,
        ),
        'answer_4': serializeParam(
          _answer4,
          ParamType.String,
        ),
        'answer_1_image_url': serializeParam(
          _answer1ImageUrl,
          ParamType.String,
        ),
        'answer_2_image_url': serializeParam(
          _answer2ImageUrl,
          ParamType.String,
        ),
        'answer_3_image_url': serializeParam(
          _answer3ImageUrl,
          ParamType.String,
        ),
        'answer_4_image_url': serializeParam(
          _answer4ImageUrl,
          ParamType.String,
        ),
        'correct_definition': serializeParam(
          _correctDefinition,
          ParamType.String,
        ),
        'correct_answer': serializeParam(
          _correctAnswer,
          ParamType.int,
        ),
        'difficulty': serializeParam(
          _difficulty,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuizTextStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizTextStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer1: deserializeParam(
          data['answer_1'],
          ParamType.String,
          false,
        ),
        answer2: deserializeParam(
          data['answer_2'],
          ParamType.String,
          false,
        ),
        answer3: deserializeParam(
          data['answer_3'],
          ParamType.String,
          false,
        ),
        answer4: deserializeParam(
          data['answer_4'],
          ParamType.String,
          false,
        ),
        answer1ImageUrl: deserializeParam(
          data['answer_1_image_url'],
          ParamType.String,
          false,
        ),
        answer2ImageUrl: deserializeParam(
          data['answer_2_image_url'],
          ParamType.String,
          false,
        ),
        answer3ImageUrl: deserializeParam(
          data['answer_3_image_url'],
          ParamType.String,
          false,
        ),
        answer4ImageUrl: deserializeParam(
          data['answer_4_image_url'],
          ParamType.String,
          false,
        ),
        correctDefinition: deserializeParam(
          data['correct_definition'],
          ParamType.String,
          false,
        ),
        correctAnswer: deserializeParam(
          data['correct_answer'],
          ParamType.int,
          false,
        ),
        difficulty: deserializeParam(
          data['difficulty'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuizTextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizTextStruct &&
        question == other.question &&
        answer1 == other.answer1 &&
        answer2 == other.answer2 &&
        answer3 == other.answer3 &&
        answer4 == other.answer4 &&
        answer1ImageUrl == other.answer1ImageUrl &&
        answer2ImageUrl == other.answer2ImageUrl &&
        answer3ImageUrl == other.answer3ImageUrl &&
        answer4ImageUrl == other.answer4ImageUrl &&
        correctDefinition == other.correctDefinition &&
        correctAnswer == other.correctAnswer &&
        difficulty == other.difficulty;
  }

  @override
  int get hashCode => const ListEquality().hash([
        question,
        answer1,
        answer2,
        answer3,
        answer4,
        answer1ImageUrl,
        answer2ImageUrl,
        answer3ImageUrl,
        answer4ImageUrl,
        correctDefinition,
        correctAnswer,
        difficulty
      ]);
}

QuizTextStruct createQuizTextStruct({
  String? question,
  String? answer1,
  String? answer2,
  String? answer3,
  String? answer4,
  String? answer1ImageUrl,
  String? answer2ImageUrl,
  String? answer3ImageUrl,
  String? answer4ImageUrl,
  String? correctDefinition,
  int? correctAnswer,
  String? difficulty,
}) =>
    QuizTextStruct(
      question: question,
      answer1: answer1,
      answer2: answer2,
      answer3: answer3,
      answer4: answer4,
      answer1ImageUrl: answer1ImageUrl,
      answer2ImageUrl: answer2ImageUrl,
      answer3ImageUrl: answer3ImageUrl,
      answer4ImageUrl: answer4ImageUrl,
      correctDefinition: correctDefinition,
      correctAnswer: correctAnswer,
      difficulty: difficulty,
    );
