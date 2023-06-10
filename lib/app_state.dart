import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_loginJSON')) {
        try {
          _loginJSON = jsonDecode(prefs.getString('ff_loginJSON') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _listVKfriends = prefs.getStringList('ff_listVKfriends')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _listVKfriends;
    });
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      _currentLessonIndex =
          prefs.getInt('ff_currentLessonIndex') ?? _currentLessonIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _artDirection = [
    'Музыкальное',
    'Цирковое',
    'Хореографическое',
    'Театральное'
  ];
  List<String> get artDirection => _artDirection;
  set artDirection(List<String> _value) {
    _artDirection = _value;
  }

  void addToArtDirection(String _value) {
    _artDirection.add(_value);
  }

  void removeFromArtDirection(String _value) {
    _artDirection.remove(_value);
  }

  void removeAtIndexFromArtDirection(int _index) {
    _artDirection.removeAt(_index);
  }

  void updateArtDirectionAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _artDirection[_index] = updateFn(_artDirection[_index]);
  }

  dynamic _loginJSON;
  dynamic get loginJSON => _loginJSON;
  set loginJSON(dynamic _value) {
    _loginJSON = _value;
    prefs.setString('ff_loginJSON', jsonEncode(_value));
  }

  List<dynamic> _listVKfriends = [];
  List<dynamic> get listVKfriends => _listVKfriends;
  set listVKfriends(List<dynamic> _value) {
    _listVKfriends = _value;
    prefs.setStringList(
        'ff_listVKfriends', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToListVKfriends(dynamic _value) {
    _listVKfriends.add(_value);
    prefs.setStringList(
        'ff_listVKfriends', _listVKfriends.map((x) => jsonEncode(x)).toList());
  }

  void removeFromListVKfriends(dynamic _value) {
    _listVKfriends.remove(_value);
    prefs.setStringList(
        'ff_listVKfriends', _listVKfriends.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromListVKfriends(int _index) {
    _listVKfriends.removeAt(_index);
    prefs.setStringList(
        'ff_listVKfriends', _listVKfriends.map((x) => jsonEncode(x)).toList());
  }

  void updateListVKfriendsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listVKfriends[_index] = updateFn(_listVKfriends[_index]);
    prefs.setStringList(
        'ff_listVKfriends', _listVKfriends.map((x) => jsonEncode(x)).toList());
  }

  bool _conditionWidget = false;
  bool get conditionWidget => _conditionWidget;
  set conditionWidget(bool _value) {
    _conditionWidget = _value;
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }

  String _photoUrl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/ozl3rs92wddb/ph_user.png';
  String get photoUrl => _photoUrl;
  set photoUrl(String _value) {
    _photoUrl = _value;
  }

  LatLng? _mapInitialLatLng = LatLng(55.7522, 37.6156);
  LatLng? get mapInitialLatLng => _mapInitialLatLng;
  set mapInitialLatLng(LatLng? _value) {
    _mapInitialLatLng = _value;
  }

  LatLng? _userLocation = LatLng(55.7522, 37.6156);
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? _value) {
    _userLocation = _value;
  }

  List<QuizTextStruct> _quizText = [
    QuizTextStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Кто является автором картины Мона Лиза?\",\"answer_1\":\"Пабло Пикассо\",\"answer_2\":\"Леонардо да Винчи\",\"answer_3\":\"Винсент Ван Гог\",\"answer_4\":\"Микеланджело\",\"answer_1_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/1.webp\",\"answer_2_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/2.webp\",\"answer_3_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/3.webp\",\"answer_4_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/4.webp\",\"correct_definition\":\"Леонардо да Винчи\",\"correct_answer\":\"2\",\"difficulty\":\"Легкий\"}')),
    QuizTextStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Кто сочиняет музыку?\",\"answer_1\":\"Дирижер\",\"answer_2\":\"Композитор\",\"answer_3\":\"Концертмейстер\",\"answer_4\":\"Вокалист\",\"answer_1_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/2_1.png\",\"answer_2_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/2_2.png\",\"answer_3_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/2_3.png\",\"answer_4_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/2_4.png\",\"correct_definition\":\"Композитор\",\"correct_answer\":\"2\",\"difficulty\":\"Легкий\"}')),
    QuizTextStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Какое направление искусства характеризуется использованием случайных форм и материалов?\",\"answer_1\":\"Кубизм\",\"answer_2\":\"Абстракционизм\",\"answer_3\":\"Дадаизм\",\"answer_4\":\"Минимализм\",\"answer_1_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/1_3.jpg\",\"answer_2_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/2_3.webp\",\"answer_3_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/3_3.jpeg\",\"answer_4_image_url\":\"https://vtehavdcekltusurbwti.supabase.co/storage/v1/object/public/media/quiz/4_3.webp\",\"correct_definition\":\"Дадаизм\",\"correct_answer\":\"3\",\"difficulty\":\"Нормальная\"}'))
  ];
  List<QuizTextStruct> get quizText => _quizText;
  set quizText(List<QuizTextStruct> _value) {
    _quizText = _value;
  }

  void addToQuizText(QuizTextStruct _value) {
    _quizText.add(_value);
  }

  void removeFromQuizText(QuizTextStruct _value) {
    _quizText.remove(_value);
  }

  void removeAtIndexFromQuizText(int _index) {
    _quizText.removeAt(_index);
  }

  void updateQuizTextAtIndex(
    int _index,
    QuizTextStruct Function(QuizTextStruct) updateFn,
  ) {
    _quizText[_index] = updateFn(_quizText[_index]);
  }

  List<QuizVideoAudioStruct> _quizVideoAudio = [
    QuizVideoAudioStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Выберете музыкальный отрывок, подходящий к данному фрагменту видео\",\"question_video_url\":\"https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4\",\"answer_1_audio_url\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"answer_2_audio_url\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"answer_3_audio_url\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"correct_definition\":\"3\",\"correct_answer\":\"3\",\"difficulty\":\"Легкий\"}')),
    QuizVideoAudioStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"Посмотрите видео и подберите подходящую мелодию\",\"question_video_url\":\"https://www.elecard.com/storage/video/TSU_640x360.mp4\",\"answer_1_audio_url\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"answer_2_audio_url\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"answer_3_audio_url\":\"https://filesamples.com/samples/audio/mp3/sample3.mp3\",\"correct_definition\":\"2\",\"correct_answer\":\"2\",\"difficulty\":\"Легкий\"}'))
  ];
  List<QuizVideoAudioStruct> get quizVideoAudio => _quizVideoAudio;
  set quizVideoAudio(List<QuizVideoAudioStruct> _value) {
    _quizVideoAudio = _value;
  }

  void addToQuizVideoAudio(QuizVideoAudioStruct _value) {
    _quizVideoAudio.add(_value);
  }

  void removeFromQuizVideoAudio(QuizVideoAudioStruct _value) {
    _quizVideoAudio.remove(_value);
  }

  void removeAtIndexFromQuizVideoAudio(int _index) {
    _quizVideoAudio.removeAt(_index);
  }

  void updateQuizVideoAudioAtIndex(
    int _index,
    QuizVideoAudioStruct Function(QuizVideoAudioStruct) updateFn,
  ) {
    _quizVideoAudio[_index] = updateFn(_quizVideoAudio[_index]);
  }

  int _currentLessonIndex = 0;
  int get currentLessonIndex => _currentLessonIndex;
  set currentLessonIndex(int _value) {
    _currentLessonIndex = _value;
    prefs.setInt('ff_currentLessonIndex', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
