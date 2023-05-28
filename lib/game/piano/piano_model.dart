import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class PianoModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? key;

  bool? startGame = true;

  int? noteNumber;

  int? gameNumber = 0;

  String? mp3;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  // Model for button component.
  late ButtonModel buttonModel;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  void dispose() {
    buttonModel.dispose();
  }

  /// Additional helper methods are added here.

}
