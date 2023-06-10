import '/backend/supabase/supabase.dart';
import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class PlaylistFullModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  FeedPlaylistsAudioRow? currentAudio;

  bool isPlaying = false;

  int currentIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for backButton component.
  late BackButtonModel backButtonModel;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
