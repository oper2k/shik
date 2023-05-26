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
    if (prefs.containsKey('ff_loginJSON')) {
      try {
        _loginJSON = jsonDecode(prefs.getString('ff_loginJSON') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _listVKfriends = prefs.getStringList('ff_listVKfriends')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _listVKfriends;
    _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
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
    Function(String) updateFn,
  ) {
    updateFn(_artDirection[_index]);
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
    Function(dynamic) updateFn,
  ) {
    updateFn(_listVKfriends[_index]);
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

  String _photoUrl = '';
  String get photoUrl => _photoUrl;
  set photoUrl(String _value) {
    _photoUrl = _value;
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
