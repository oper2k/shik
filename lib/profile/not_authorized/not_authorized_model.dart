import '/components/button_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotAuthorizedModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    buttonModel.dispose();
    tabBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
