import '/backend/supabase/supabase.dart';
import '/components/quizzes_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QiuzModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Models for Quizzes_List dynamic component.
  late FlutterFlowDynamicModels<QuizzesListModel> quizzesListModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    quizzesListModels = FlutterFlowDynamicModels(() => QuizzesListModel());
  }

  void dispose() {
    quizzesListModels.dispose();
  }

  /// Additional helper methods are added here.

}
