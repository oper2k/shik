import '/backend/supabase/supabase.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map_folder/school_info/school_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? filterVisibility = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // State field(s) for SearchInput widget.
  TextEditingController? searchInputController;
  String? Function(BuildContext, String?)? searchInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  void dispose() {
    tabBarModel.dispose();
    searchInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
