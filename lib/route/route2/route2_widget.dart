import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/route/right2/right2_widget.dart';
import '/route/wrong2/wrong2_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'route2_model.dart';
export 'route2_model.dart';

class Route2Widget extends StatefulWidget {
  const Route2Widget({
    Key? key,
    required this.usersRow,
  }) : super(key: key);

  final UsersRow? usersRow;

  @override
  _Route2WidgetState createState() => _Route2WidgetState();
}

class _Route2WidgetState extends State<Route2Widget> {
  late Route2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Route2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Builder(
          builder: (context) {
            final childQuizVideoAudio = FFAppState().quizVideoAudio.toList();
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(childQuizVideoAudio.length,
                  (childQuizVideoAudioIndex) {
                final childQuizVideoAudioItem =
                    childQuizVideoAudio[childQuizVideoAudioIndex];
                return Visibility(
                  visible: childQuizVideoAudioIndex == _model.index,
                  child: Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 45.0, 24.0, 0.0),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pop();
                                          },
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Icon(
                                                FFIcons.kleft2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 12.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: functions.progressBar(
                                              functions
                                                  .substratOne(FFAppState()
                                                      .quizVideoAudio
                                                      .length)
                                                  ?.toDouble(),
                                              childQuizVideoAudioIndex
                                                  .toDouble())!,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          lineHeight: 8.0,
                                          animation: true,
                                          progressColor: Color(0xFFA4CE57),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          barRadius: Radius.circular(8.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Text(
                                          childQuizVideoAudioItem.question,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Уровень: ${childQuizVideoAudioItem.difficulty}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FlutterFlowVideoPlayer(
                                        path: valueOrDefault<String>(
                                          childQuizVideoAudioItem
                                              .questionVideoUrl,
                                          '0',
                                        ),
                                        videoType: VideoType.network,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 18.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 10.0, 24.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.soundPlayer1?.stop();
                                                  _model.soundPlayer2?.stop();
                                                  _model.soundPlayer3?.stop();
                                                  setState(() {
                                                    _model.currentAudio =
                                                        childQuizVideoAudioItem
                                                            .answer1AudioUrl;
                                                  });
                                                  _model.soundPlayer1 ??=
                                                      AudioPlayer();
                                                  if (_model
                                                      .soundPlayer1!.playing) {
                                                    await _model.soundPlayer1!
                                                        .stop();
                                                  }
                                                  _model.soundPlayer1!
                                                      .setVolume(1.0);
                                                  _model.soundPlayer1!
                                                      .setUrl(
                                                          _model.currentAudio!)
                                                      .then((_) => _model
                                                          .soundPlayer1!
                                                          .play());

                                                  if (_model.answer == 1) {
                                                    setState(() {
                                                      _model.answer = null;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.answer = 1;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 7.0,
                                                        color:
                                                            Color(0xB2EFEFEF),
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: () {
                                                        if (_model
                                                                .correctAnswer ==
                                                            1) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .greenActive;
                                                        } else if ((_model
                                                                    .correctAnswer !=
                                                                null) &&
                                                            (_model.correctAnswer !=
                                                                1)) {
                                                          return Color(
                                                              0xFFDA5C21);
                                                        } else if (_model
                                                                .answer ==
                                                            1) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText;
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          FFIcons.kframe27,
                                                          color:
                                                              Color(0x4D222222),
                                                          size: 36.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Аудио №1',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 10.0, 24.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.soundPlayer1?.stop();
                                                  _model.soundPlayer2?.stop();
                                                  _model.soundPlayer3?.stop();
                                                  setState(() {
                                                    _model.currentAudio =
                                                        childQuizVideoAudioItem
                                                            .answer2AudioUrl;
                                                  });
                                                  _model.soundPlayer2 ??=
                                                      AudioPlayer();
                                                  if (_model
                                                      .soundPlayer2!.playing) {
                                                    await _model.soundPlayer2!
                                                        .stop();
                                                  }
                                                  _model.soundPlayer2!
                                                      .setVolume(1.0);
                                                  _model.soundPlayer2!
                                                      .setUrl(
                                                          _model.currentAudio!)
                                                      .then((_) => _model
                                                          .soundPlayer2!
                                                          .play());

                                                  if (_model.answer == 2) {
                                                    setState(() {
                                                      _model.answer = null;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.answer = 2;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 7.0,
                                                        color:
                                                            Color(0xB2EFEFEF),
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: () {
                                                        if (_model
                                                                .correctAnswer ==
                                                            2) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .greenActive;
                                                        } else if ((_model
                                                                    .correctAnswer !=
                                                                null) &&
                                                            (_model.correctAnswer !=
                                                                2)) {
                                                          return Color(
                                                              0xFFDA5C21);
                                                        } else if (_model
                                                                .answer ==
                                                            2) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText;
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          FFIcons
                                                              .kzondiconsPlayOutline,
                                                          color:
                                                              Color(0x4D222222),
                                                          size: 36.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Аудио №2',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 10.0, 24.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.soundPlayer1?.stop();
                                                  _model.soundPlayer2?.stop();
                                                  _model.soundPlayer3?.stop();
                                                  setState(() {
                                                    _model.currentAudio =
                                                        childQuizVideoAudioItem
                                                            .answer1AudioUrl;
                                                  });
                                                  _model.soundPlayer3 ??=
                                                      AudioPlayer();
                                                  if (_model
                                                      .soundPlayer3!.playing) {
                                                    await _model.soundPlayer3!
                                                        .stop();
                                                  }
                                                  _model.soundPlayer3!
                                                      .setVolume(1.0);
                                                  _model.soundPlayer3!
                                                      .setUrl(
                                                          _model.currentAudio!)
                                                      .then((_) => _model
                                                          .soundPlayer3!
                                                          .play());

                                                  if (_model.answer == 3) {
                                                    setState(() {
                                                      _model.answer = null;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.answer = 3;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 7.0,
                                                        color:
                                                            Color(0xB2EFEFEF),
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: () {
                                                        if (_model
                                                                .correctAnswer ==
                                                            3) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .greenActive;
                                                        } else if ((_model
                                                                    .correctAnswer !=
                                                                null) &&
                                                            (_model.correctAnswer !=
                                                                3)) {
                                                          return Color(
                                                              0xFFDA5C21);
                                                        } else if (_model
                                                                .answer ==
                                                            3) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText;
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          FFIcons.kframe27,
                                                          color:
                                                              Color(0x4D222222),
                                                          size: 36.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Аудио №3',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (_model.answer == null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 45.0),
                                      child: ButtonWidget(
                                        key: Key(
                                            'Key9od_${childQuizVideoAudioIndex}_of_${childQuizVideoAudio.length}'),
                                        text: 'Проверить',
                                        btnColor: FlutterFlowTheme.of(context)
                                            .notActiveButton,
                                      ),
                                    ),
                                  if (_model.answer != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 45.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var _shouldSetState = false;
                                          _model.soundPlayer1?.stop();
                                          _model.soundPlayer2?.stop();
                                          _model.soundPlayer3?.stop();
                                          setState(() {
                                            _model.correctAnswer =
                                                childQuizVideoAudioItem
                                                    .correctAnswer;
                                          });
                                          if (_model.correctAnswer ==
                                              _model.answer) {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Right2Widget(
                                                      quizVideoAudioDataType:
                                                          childQuizVideoAudioItem,
                                                      usersRow:
                                                          widget.usersRow!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() =>
                                                _model.outputRight2 = value));

                                            _shouldSetState = true;
                                            if (!_model.outputRight2!) {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          } else {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Wrong2Widget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() =>
                                                _model.outputWrong2 = value));

                                            _shouldSetState = true;
                                            if (!_model.outputWrong2!) {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }

                                          if (_model.index !=
                                              functions.substratOne(FFAppState()
                                                  .quizVideoAudio
                                                  .length)) {
                                            setState(() {
                                              _model.index = _model.index + 1;
                                            });
                                          } else {
                                            if (FFAppState()
                                                    .currentLessonIndex ==
                                                1) {
                                              setState(() {
                                                FFAppState()
                                                        .currentLessonIndex =
                                                    FFAppState()
                                                            .currentLessonIndex +
                                                        1;
                                              });
                                            }

                                            context.goNamed('Route');
                                          }

                                          setState(() {
                                            _model.correctAnswer = null;
                                            _model.answer = null;
                                          });
                                          if (_shouldSetState) setState(() {});
                                        },
                                        child: ButtonWidget(
                                          key: Key(
                                              'Keyk9b_${childQuizVideoAudioIndex}_of_${childQuizVideoAudio.length}'),
                                          text: 'Проверить',
                                          btnColor: FlutterFlowTheme.of(context)
                                              .greenActive,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
