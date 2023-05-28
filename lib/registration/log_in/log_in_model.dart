import '/auth/supabase_auth/auth_util.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogInModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailInput widget.
  TextEditingController? emailInputController;
  String? Function(BuildContext, String?)? emailInputControllerValidator;
  // State field(s) for PasswordInput widget.
  TextEditingController? passwordInputController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputControllerValidator;
  // Model for button component.
  late ButtonModel buttonModel1;
  // Model for button component.
  late ButtonModel buttonModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordInputVisibility = false;
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  void dispose() {
    emailInputController?.dispose();
    passwordInputController?.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }

  /// Additional helper methods are added here.

}
