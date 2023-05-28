import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/route/right1/right1_widget.dart';
import '/route/wrong1/wrong1_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class Route1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? numberAns;

  bool? border = false;

  ///  State fields for stateful widgets in this page.

  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
  }

  /// Additional helper methods are added here.

}
