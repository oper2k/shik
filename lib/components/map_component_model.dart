import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map_folder/school_info/school_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapComponentModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<LatLng> latLngList = [];
  void addToLatLngList(LatLng item) => latLngList.add(item);
  void removeFromLatLngList(LatLng item) => latLngList.remove(item);
  void removeAtIndexFromLatLngList(int index) => latLngList.removeAt(index);
  void updateLatLngListAtIndex(int index, Function(LatLng) updateFn) =>
      latLngList[index] = updateFn(latLngList[index]);

  LatLng? centerMap;

  int index = 0;

  bool pin = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for ShowBottomInfo widget.
  int showBottomInfoMilliseconds = 1000;
  String showBottomInfoValue = StopWatchTimer.getDisplayTime(
    1000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer showBottomInfoController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    showBottomInfoController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
