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
