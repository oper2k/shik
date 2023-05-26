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
import 'piano_model.dart';
export 'piano_model.dart';

class PianoWidget extends StatefulWidget {
  const PianoWidget({Key? key}) : super(key: key);

  @override
  _PianoWidgetState createState() => _PianoWidgetState();
}

class _PianoWidgetState extends State<PianoWidget>
    with TickerProviderStateMixin {
  late PianoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'audioPlayerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PianoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 45.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
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
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.ksystemUiconsCross1,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: LinearPercentIndicator(
                          percent: 0.3,
                          width: MediaQuery.of(context).size.width * 0.75,
                          lineHeight: 8.0,
                          animation: true,
                          progressColor: Color(0xFFA4CE57),
                          backgroundColor: FlutterFlowTheme.of(context).accent4,
                          barRadius: Radius.circular(8.0),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFDEA5BA),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          'Послушайте и выберите правильную ноту',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.4,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!_model.startGame!)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                () {
                                  if (_model.noteNumber == 1) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/gzqd1x2plsjd/1.jpg';
                                  } else if (_model.noteNumber == 2) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/ubq41hsprrd9/2.jpg';
                                  } else {
                                    return '11';
                                  }
                                }(),
                                width: 148.0,
                                height: 150.0,
                                fit: BoxFit.contain,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 220.0,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      FlutterFlowAudioPlayer(
                                        audio: Audio.network(
                                          () {
                                            if (_model.noteNumber == 1) {
                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/2nftemyqo81r/zvuk-notyi-do.mp3';
                                            } else if (_model.noteNumber == 2) {
                                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/rnfeudx1z5kp/zvuk-notyi-re.mp3';
                                            } else {
                                              return 'https://filesamples.com/samples/audio/mp3/sample3.mp3';
                                            }
                                          }(),
                                          metas: Metas(
                                            id: 'sample3.mp3-cb8ccbfe',
                                            title: 'Какая это нота?',
                                          ),
                                        ),
                                        titleTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20.0,
                                                  lineHeight: 1.0,
                                                ),
                                        playbackDurationTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 0.0,
                                                  lineHeight: 1.7,
                                                ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        playbackButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        elevation: 0.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'audioPlayerOnPageLoadAnimation']!),
                                      Container(
                                        width: double.infinity,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Угаданных подряд нот: ${valueOrDefault<String>(
                                      _model.gameNumber?.toString(),
                                      '0',
                                    )}',
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_model.startGame ?? true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          _model.startGame = false;
                          _model.noteNumber = random_data.randomInteger(1, 2);
                        });
                      },
                      child: wrapWithModel(
                        model: _model.buttonModel,
                        updateCallback: () => setState(() {}),
                        child: ButtonWidget(
                          text: 'Начать',
                          btnColor: FlutterFlowTheme.of(context).greenActive,
                        ),
                      ),
                    ),
                  ),
                Spacer(),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 1.0,
                        height: 335.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 220.0,
                                      decoration: BoxDecoration(
                                        color: _model.key == 1
                                            ? Color(0xFFA9A9A9)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20.0,
                                    height: 220.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.key = 1;
                                    });
                                    _model.soundPlayer1 ??= AudioPlayer();
                                    if (_model.soundPlayer1!.playing) {
                                      await _model.soundPlayer1!.stop();
                                    }
                                    _model.soundPlayer1!.setVolume(1.0);
                                    _model.soundPlayer1!
                                        .setUrl(
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/2nftemyqo81r/zvuk-notyi-do.mp3')
                                        .then(
                                            (_) => _model.soundPlayer1!.play());

                                    await Future.delayed(
                                        const Duration(milliseconds: 300));
                                    if (!_model.startGame!) {
                                      if (_model.key == _model.noteNumber) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Правильно!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Дальше'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        setState(() {
                                          _model.noteNumber =
                                              random_data.randomInteger(1, 2);
                                          _model.gameNumber =
                                              _model.gameNumber! + 1;
                                        });
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Не правильно'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        setState(() {
                                          _model.startGame = false;
                                          _model.gameNumber = null;
                                        });
                                      }
                                    }
                                    setState(() {
                                      _model.key = 0;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: _model.key == 1
                                          ? Color(0xFFA9A9A9)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: _model.key == 1 ? 5.0 : 15.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 1.0,
                            height: 220.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
                          Container(
                            width: 1.0,
                            height: 115.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 20.0,
                                    height: 220.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 20.0,
                                      height: 220.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20.0,
                                    height: 220.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.key = 2;
                                    });
                                    _model.soundPlayer2 ??= AudioPlayer();
                                    if (_model.soundPlayer2!.playing) {
                                      await _model.soundPlayer2!.stop();
                                    }
                                    _model.soundPlayer2!.setVolume(1.0);
                                    _model.soundPlayer2!
                                        .setUrl(
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/shik-mobile-app-feklwx/assets/rnfeudx1z5kp/zvuk-notyi-re.mp3')
                                        .then(
                                            (_) => _model.soundPlayer2!.play());

                                    await Future.delayed(
                                        const Duration(milliseconds: 300));
                                    if (!_model.startGame!) {
                                      if (_model.key == _model.noteNumber) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Правильно!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Дальше'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        setState(() {
                                          _model.noteNumber =
                                              random_data.randomInteger(1, 2);
                                          _model.gameNumber =
                                              _model.gameNumber! + 1;
                                        });
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Не правильно'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        setState(() {
                                          _model.startGame = true;
                                          _model.gameNumber = null;
                                        });
                                      }
                                    }
                                    setState(() {
                                      _model.key = 0;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: _model.key == 2
                                          ? Color(0xFFA9A9A9)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 220.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
