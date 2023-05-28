import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/quizzes_list_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Quizzes_List component.
  late QuizzesListModel quizzesListModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    quizzesListModel = createModel(context, () => QuizzesListModel());
    tabBarModel = createModel(context, () => TabBarModel());
  }

  void dispose() {
    quizzesListModel.dispose();
    tabBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
