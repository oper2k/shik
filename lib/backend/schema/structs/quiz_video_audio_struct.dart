// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizVideoAudioStruct extends BaseStruct {
  QuizVideoAudioStruct({
    String? question,
    String? questionVideoUrl,
    String? answer1AudioUrl,
    String? answer2AudioUrl,
    String? answer3AudioUrl,
    String? correctDefinition,
    int? correctAnswer,
    String? difficulty,
  })  : _question = question,
        _questionVideoUrl = questionVideoUrl,
        _answer1AudioUrl = answer1AudioUrl,
        _answer2AudioUrl = answer2AudioUrl,
        _answer3AudioUrl = answer3AudioUrl,
        _correctDefinition = correctDefinition,
        _correctAnswer = correctAnswer,
        _difficulty = difficulty;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "question_video_url" field.
  String? _questionVideoUrl;
  String get questionVideoUrl => _questionVideoUrl ?? '';
  set questionVideoUrl(String? val) => _questionVideoUrl = val;
  bool hasQuestionVideoUrl() => _questionVideoUrl != null;

  // "answer_1_audio_url" field.
  String? _answer1AudioUrl;
  String get answer1AudioUrl => _answer1AudioUrl ?? '';
  set answer1AudioUrl(String? val) => _answer1AudioUrl = val;
  bool hasAnswer1AudioUrl() => _answer1AudioUrl != null;

  // "answer_2_audio_url" field.
  String? _answer2AudioUrl;
  String get answer2AudioUrl => _answer2AudioUrl ?? '';
  set answer2AudioUrl(String? val) => _answer2AudioUrl = val;
  bool hasAnswer2AudioUrl() => _answer2AudioUrl != null;

  // "answer_3_audio_url" field.
  String? _answer3AudioUrl;
  String get answer3AudioUrl => _answer3AudioUrl ?? '';
  set answer3AudioUrl(String? val) => _answer3AudioUrl = val;
  bool hasAnswer3AudioUrl() => _answer3AudioUrl != null;

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

  static QuizVideoAudioStruct fromMap(Map<String, dynamic> data) =>
      QuizVideoAudioStruct(
        question: data['question'] as String?,
        questionVideoUrl: data['question_video_url'] as String?,
        answer1AudioUrl: data['answer_1_audio_url'] as String?,
        answer2AudioUrl: data['answer_2_audio_url'] as String?,
        answer3AudioUrl: data['answer_3_audio_url'] as String?,
        correctDefinition: data['correct_definition'] as String?,
        correctAnswer: data['correct_answer'] as int?,
        difficulty: data['difficulty'] as String?,
      );

  static QuizVideoAudioStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QuizVideoAudioStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'question_video_url': _questionVideoUrl,
        'answer_1_audio_url': _answer1AudioUrl,
        'answer_2_audio_url': _answer2AudioUrl,
        'answer_3_audio_url': _answer3AudioUrl,
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
        'question_video_url': serializeParam(
          _questionVideoUrl,
          ParamType.String,
        ),
        'answer_1_audio_url': serializeParam(
          _answer1AudioUrl,
          ParamType.String,
        ),
        'answer_2_audio_url': serializeParam(
          _answer2AudioUrl,
          ParamType.String,
        ),
        'answer_3_audio_url': serializeParam(
          _answer3AudioUrl,
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

  static QuizVideoAudioStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizVideoAudioStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        questionVideoUrl: deserializeParam(
          data['question_video_url'],
          ParamType.String,
          false,
        ),
        answer1AudioUrl: deserializeParam(
          data['answer_1_audio_url'],
          ParamType.String,
          false,
        ),
        answer2AudioUrl: deserializeParam(
          data['answer_2_audio_url'],
          ParamType.String,
          false,
        ),
        answer3AudioUrl: deserializeParam(
          data['answer_3_audio_url'],
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
  String toString() => 'QuizVideoAudioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizVideoAudioStruct &&
        question == other.question &&
        questionVideoUrl == other.questionVideoUrl &&
        answer1AudioUrl == other.answer1AudioUrl &&
        answer2AudioUrl == other.answer2AudioUrl &&
        answer3AudioUrl == other.answer3AudioUrl &&
        correctDefinition == other.correctDefinition &&
        correctAnswer == other.correctAnswer &&
        difficulty == other.difficulty;
  }

  @override
  int get hashCode => const ListEquality().hash([
        question,
        questionVideoUrl,
        answer1AudioUrl,
        answer2AudioUrl,
        answer3AudioUrl,
        correctDefinition,
        correctAnswer,
        difficulty
      ]);
}

QuizVideoAudioStruct createQuizVideoAudioStruct({
  String? question,
  String? questionVideoUrl,
  String? answer1AudioUrl,
  String? answer2AudioUrl,
  String? answer3AudioUrl,
  String? correctDefinition,
  int? correctAnswer,
  String? difficulty,
}) =>
    QuizVideoAudioStruct(
      question: question,
      questionVideoUrl: questionVideoUrl,
      answer1AudioUrl: answer1AudioUrl,
      answer2AudioUrl: answer2AudioUrl,
      answer3AudioUrl: answer3AudioUrl,
      correctDefinition: correctDefinition,
      correctAnswer: correctAnswer,
      difficulty: difficulty,
    );
