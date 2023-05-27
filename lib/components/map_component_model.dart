import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map_folder/school_info/school_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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

  LatLng? centerMap;

  int? index;

  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
