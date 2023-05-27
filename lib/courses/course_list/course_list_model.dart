import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/components/tab_bar_widget.dart';
import '/courses/buy_course_wid/buy_course_wid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CourseListModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for button component.
  late ButtonModel buttonModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
    tabBarModel = createModel(context, () => TabBarModel());
  }

  void dispose() {
    buttonModel.dispose();
    tabBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
