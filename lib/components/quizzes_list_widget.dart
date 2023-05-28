import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quizzes_list_model.dart';
export 'quizzes_list_model.dart';

class QuizzesListWidget extends StatefulWidget {
  const QuizzesListWidget({
    Key? key,
    required this.feedQuizzesRow,
  }) : super(key: key);

  final FeedQuizzesRow? feedQuizzesRow;

  @override
  _QuizzesListWidgetState createState() => _QuizzesListWidgetState();
}

class _QuizzesListWidgetState extends State<QuizzesListWidget> {
  late QuizzesListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizzesListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.feedQuizzesRow?.question,
                'question',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.updatePage(() {
                    _model.myAnswer = 1;
                  });
                  if (widget.feedQuizzesRow?.correctAnswer == 1) {
                    HapticFeedback.mediumImpact();
                  } else {
                    return;
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((_model.myAnswer == 1) &&
                        (_model.myAnswer ==
                            widget.feedQuizzesRow?.correctAnswer))
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF11E666),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.kmaterialSymbolsDoneRounded,
                          color: FlutterFlowTheme.of(context).white,
                          size: 16.0,
                        ),
                      ),
                    if ((_model.myAnswer == 1) &&
                        (_model.myAnswer !=
                            widget.feedQuizzesRow?.correctAnswer))
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).error,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.ksystemUiconsCross1,
                          color: FlutterFlowTheme.of(context).white,
                          size: 16.0,
                        ),
                      ),
                    if (_model.myAnswer != 1)
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.feedQuizzesRow?.answer1,
                          'answer 1',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.updatePage(() {
                    _model.myAnswer = 2;
                  });
                  if (widget.feedQuizzesRow?.correctAnswer == 2) {
                    HapticFeedback.mediumImpact();
                  } else {
                    return;
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((_model.myAnswer == 2) &&
                        (_model.myAnswer ==
                            widget.feedQuizzesRow?.correctAnswer))
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF11E666),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.kmaterialSymbolsDoneRounded,
                          color: FlutterFlowTheme.of(context).white,
                          size: 16.0,
                        ),
                      ),
                    if ((_model.myAnswer == 2) &&
                        (_model.myAnswer !=
                            widget.feedQuizzesRow?.correctAnswer))
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).error,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.ksystemUiconsCross1,
                          color: FlutterFlowTheme.of(context).white,
                          size: 16.0,
                        ),
                      ),
                    if (_model.myAnswer != 2)
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.feedQuizzesRow?.answer2,
                          'answer 2',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.updatePage(() {
                    _model.myAnswer = 3;
                  });
                  if (widget.feedQuizzesRow?.correctAnswer == 3) {
                    HapticFeedback.mediumImpact();
                  } else {
                    return;
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((_model.myAnswer == 3) &&
                        (_model.myAnswer ==
                            widget.feedQuizzesRow?.correctAnswer))
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF11E666),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.kmaterialSymbolsDoneRounded,
                          color: FlutterFlowTheme.of(context).white,
                          size: 16.0,
                        ),
                      ),
                    if ((_model.myAnswer == 3) &&
                        (_model.myAnswer !=
                            widget.feedQuizzesRow?.correctAnswer))
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).error,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FFIcons.ksystemUiconsCross1,
                          color: FlutterFlowTheme.of(context).white,
                          size: 16.0,
                        ),
                      ),
                    if (_model.myAnswer != 3)
                      Container(
                        width: 19.0,
                        height: 19.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.feedQuizzesRow?.answer3,
                          'answer 3',
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
