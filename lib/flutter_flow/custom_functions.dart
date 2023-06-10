import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<LatLng>? combineMapLatLng(
  List<double>? lat,
  List<double>? lng,
) {
  assert(lat != null &&
      lng != null &&
      lat.length == lng.length); // Проверка на равную длину списков

  List<LatLng> latLngList = [];
  for (int i = 0; i < lat!.length; i++) {
    double latValue = lat![i];
    double lngValue = lng![i];
    LatLng latLng = LatLng(latValue, lngValue);
    latLngList.add(latLng);
  }

  return latLngList;
}

int? mapGetIndex(
  List<LatLng>? latLngList,
  LatLng? latLng,
) {
  if (latLngList == null || latLng == null || latLngList.isEmpty) {
    return 0;
  }

  double roundedLat = double.parse(latLng.latitude.toStringAsFixed(6));
  double roundedLng = double.parse(latLng.longitude.toStringAsFixed(6));

  for (int i = 0; i < latLngList.length; i++) {
    double roundedListLat =
        double.parse(latLngList[i].latitude.toStringAsFixed(6));
    double roundedListLng =
        double.parse(latLngList[i].longitude.toStringAsFixed(6));

    if (roundedListLat == roundedLat && roundedListLng == roundedLng) {
      return i;
    }
  }

  return 0;
}

int? findUserIndex(
  String? userId,
  List<String>? stringList,
) {
  for (int i = 0; i < stringList!.length; i++) {
    if (stringList![i] == userId!) {
      return i + 1;
    }
  }
  return 0; // Возвращаем 0, если user id не найден в списке
}

bool? isStringInList(
  List<String>? stringList,
  String? value,
) {
  return stringList!.contains(value!);
}

bool? textSearchInChild(
  String? textSearchIn,
  String? textSearchFor,
) {
  return textSearchIn!.toLowerCase().contains(textSearchFor!.toLowerCase());
}

int? substratOne(int? value) {
  int result = value! - 1;
  if (result < 0) {
    return 0;
  } else {
    return result;
  }
}

bool? showSearchResult(
  String textSearchFor,
  String textSearchName,
  String textSearchNfamily,
) {
  // search in different case
  if (textSearchFor.isEmpty) {
    return true;
  }
  if (textSearchName.toLowerCase().contains(textSearchFor.toLowerCase())) {
    return true;
  }
  if (textSearchNfamily.toLowerCase().contains(textSearchFor.toLowerCase())) {
    return true;
  }
  return false;
}

bool? onlineStatus(DateTime? dateTime) {
  DateTime currentTime = DateTime.now();

  Duration difference = currentTime.difference(dateTime!);

  // Проверяем, если разница между текущим временем и dateTime
  // составляет менее 20 минут, возвращаем true
  if (difference.inMinutes.abs() < 20) {
    return true;
  } else {
    return false;
  }
}

double? progressBar(
  double? fact,
  double? plan,
) {
  if (plan == null || plan.isNaN || fact == null || fact.isNaN) {
    return 0;
  }
  if (fact / plan > 1) {
    return 1;
  }
  return fact / plan;
}

bool? containsInt(
  int? value,
  List<int>? list,
) {
  return list!.contains(value!);
}
