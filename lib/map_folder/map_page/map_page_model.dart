import '/backend/supabase/supabase.dart';
import '/components/map_component_widget.dart';
import '/components/map_not_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map_folder/school_info/school_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool? filterVisibility = true;

  String? filterValue;

  String? filterValue2;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for MapComponent component.
  late MapComponentModel mapComponentModel;
  // State field(s) for SearchInput widget.
  TextEditingController? searchInputController;
  String? Function(BuildContext, String?)? searchInputControllerValidator;
  // Model for tabBar component.
  late TabBarModel tabBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mapComponentModel = createModel(context, () => MapComponentModel());
    tabBarModel = createModel(context, () => TabBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mapComponentModel.dispose();
    searchInputController?.dispose();
    tabBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
