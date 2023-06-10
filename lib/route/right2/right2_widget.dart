import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'right2_model.dart';
export 'right2_model.dart';

class Right2Widget extends StatefulWidget {
  const Right2Widget({
    Key? key,
    required this.quizVideoAudioDataType,
    required this.usersRow,
  }) : super(key: key);

  final QuizVideoAudioStruct? quizVideoAudioDataType;
  final UsersRow? usersRow;

  @override
  _Right2WidgetState createState() => _Right2WidgetState();
}

class _Right2WidgetState extends State<Right2Widget> {
  late Right2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Right2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await UsersTable().update(
        data: {
          'rating': valueOrDefault<int>(
            valueOrDefault<int>(
                  widget.usersRow?.rating,
                  0,
                ) +
                15,
            0,
          ),
        },
        matchingRows: (rows) => rows.eq(
          'id',
          currentUserUid,
        ),
      );
      HapticFeedback.vibrate();
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Правильно!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FFIcons.kvector12,
                        color: FlutterFlowTheme.of(context).warning,
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '+15',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context, true);
                    },
                    child: wrapWithModel(
                      model: _model.buttonModel,
                      updateCallback: () => setState(() {}),
                      child: ButtonWidget(
                        text: 'Следующий вопрос',
                        btnColor: FlutterFlowTheme.of(context).greenActive,
                      ),
                    ),
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
