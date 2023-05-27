import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wrong5_model.dart';
export 'wrong5_model.dart';

class Wrong5Widget extends StatefulWidget {
  const Wrong5Widget({Key? key}) : super(key: key);

  @override
  _Wrong5WidgetState createState() => _Wrong5WidgetState();
}

class _Wrong5WidgetState extends State<Wrong5Widget> {
  late Wrong5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Wrong5Model());
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
                  'Упс! Неверный ответ!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Ответ: скрипка',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 0.0),
                  child: Text(
                    'Скрипка — королева музыкальных инструментов — прошла долгий путь. Её предки встречаются в музыкальных культурах почти всех народов мира. И на деревенском празднике, и в лучшем концертном зале скрипка превосходно играет свою роль — выражает самые глубокие человеческие чувства!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 4.0),
                  child: Text(
                    ' #хочуигратьнаскрипке. #играемнаскрипке, #курсыскрипка',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                  child: wrapWithModel(
                    model: _model.buttonModel1,
                    updateCallback: () => setState(() {}),
                    child: ButtonWidget(
                      text: 'Следующий уровень',
                      btnColor: FlutterFlowTheme.of(context).greenActive,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                  child: wrapWithModel(
                    model: _model.buttonModel2,
                    updateCallback: () => setState(() {}),
                    child: ButtonWidget(
                      text: 'Читать о других инструментах',
                      btnColor: FlutterFlowTheme.of(context).greenActive,
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
