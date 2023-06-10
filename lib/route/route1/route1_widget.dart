import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/route/right1/right1_widget.dart';
import '/route/wrong1/wrong1_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'route1_model.dart';
export 'route1_model.dart';

class Route1Widget extends StatefulWidget {
  const Route1Widget({
    Key? key,
    required this.usersRow,
  }) : super(key: key);

  final UsersRow? usersRow;

  @override
  _Route1WidgetState createState() => _Route1WidgetState();
}

class _Route1WidgetState extends State<Route1Widget> {
  late Route1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Route1Model());
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
            final childQuizText = FFAppState().quizText.toList();
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  List.generate(childQuizText.length, (childQuizTextIndex) {
                final childQuizTextItem = childQuizText[childQuizTextIndex];
                return Visibility(
                  visible: childQuizTextIndex == _model.index,
                  child: Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          child: LinearPercentIndicator(
                                            percent: functions.progressBar(
                                                _model.index.toDouble(),
                                                functions
                                                    .substratOne(FFAppState()
                                                        .quizText
                                                        .length)
                                                    ?.toDouble())!,
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
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 10.0, 16.0, 10.0),
                                        child: Text(
                                          childQuizTextItem.question,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
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
                                    'Уровень: ${childQuizTextItem.difficulty}',
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
                                      16.0, 16.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
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
                                                    width: 100.0,
                                                    height: 185.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
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
                                                          } else if (_model
                                                                  .answer ==
                                                              1) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          } else if ((_model
                                                                      .correctAnswer !=
                                                                  null) &&
                                                              (_model.correctAnswer !=
                                                                  1)) {
                                                            return Color(
                                                                0xFFDA5C21);
                                                          } else {
                                                            return Color(
                                                                0x00000000);
                                                          }
                                                        }(),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 90.0,
                                                          height: 90.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              childQuizTextItem
                                                                  .answer1ImageUrl,
                                                              '0',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            childQuizTextItem
                                                                .answer1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
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
                                                    width: 100.0,
                                                    height: 185.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
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
                                                          } else if (_model
                                                                  .answer ==
                                                              2) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          } else if ((_model
                                                                      .correctAnswer !=
                                                                  null) &&
                                                              (_model.correctAnswer !=
                                                                  2)) {
                                                            return Color(
                                                                0xFFDA5C21);
                                                          } else {
                                                            return Color(
                                                                0x00000000);
                                                          }
                                                        }(),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 90.0,
                                                          height: 90.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              childQuizTextItem
                                                                  .answer2ImageUrl,
                                                              '0',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            childQuizTextItem
                                                                .answer2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
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
                                                  width: 100.0,
                                                  height: 185.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
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
                                                        } else if (_model
                                                                .answer ==
                                                            3) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText;
                                                        } else if ((_model
                                                                    .correctAnswer !=
                                                                null) &&
                                                            (_model.correctAnswer !=
                                                                3)) {
                                                          return Color(
                                                              0xFFDA5C21);
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 90.0,
                                                        height: 90.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            childQuizTextItem
                                                                .answer3ImageUrl,
                                                            '0',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          childQuizTextItem
                                                              .answer3,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.answer == 4) {
                                                    setState(() {
                                                      _model.answer = null;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.answer = 4;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 185.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: () {
                                                        if (_model
                                                                .correctAnswer ==
                                                            4) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .greenActive;
                                                        } else if (_model
                                                                .answer ==
                                                            4) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText;
                                                        } else if ((_model
                                                                    .correctAnswer !=
                                                                null) &&
                                                            (_model.correctAnswer !=
                                                                4)) {
                                                          return Color(
                                                              0xFFDA5C21);
                                                        } else {
                                                          return Color(
                                                              0x00000000);
                                                        }
                                                      }(),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 90.0,
                                                        height: 90.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            childQuizTextItem
                                                                .answer4ImageUrl,
                                                            '0',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          childQuizTextItem
                                                              .answer4,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                                  24.0, 0.0, 24.0, 50.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (_model.answer == null)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 45.0),
                                        child: ButtonWidget(
                                          key: Key(
                                              'Key3gv_${childQuizTextIndex}_of_${childQuizText.length}'),
                                          text: 'Проверить',
                                          btnColor: FlutterFlowTheme.of(context)
                                              .notActiveButton,
                                        ),
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
                                          setState(() {
                                            _model.correctAnswer =
                                                childQuizTextItem.correctAnswer;
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
                                                    child: Right1Widget(
                                                      quizTextDataType:
                                                          childQuizTextItem,
                                                      usersRow:
                                                          widget.usersRow!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() =>
                                                _model.outputRight = value));

                                            _shouldSetState = true;
                                            if (!_model.outputRight!) {
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
                                                    child: Wrong1Widget(
                                                      quizTextDataType:
                                                          childQuizTextItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() =>
                                                _model.outputWrong = value));

                                            _shouldSetState = true;
                                            if (!_model.outputWrong!) {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }

                                          if (childQuizTextIndex !=
                                              functions.substratOne(FFAppState()
                                                  .quizText
                                                  .length)) {
                                            setState(() {
                                              _model.index = _model.index + 1;
                                            });
                                          } else {
                                            if (FFAppState()
                                                    .currentLessonIndex ==
                                                0) {
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
                                              'Keybe7_${childQuizTextIndex}_of_${childQuizText.length}'),
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
