import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wrong3_model.dart';
export 'wrong3_model.dart';

class Wrong3Widget extends StatefulWidget {
  const Wrong3Widget({Key? key}) : super(key: key);

  @override
  _Wrong3WidgetState createState() => _Wrong3WidgetState();
}

class _Wrong3WidgetState extends State<Wrong3Widget> {
  late Wrong3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Wrong3Model());
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 46.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Упс! Это автобус?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 38.0, 24.0, 0.0),
                  child: wrapWithModel(
                    model: _model.buttonModel1,
                    updateCallback: () => setState(() {}),
                    child: ButtonWidget(
                      text: 'Попробовать еще раз',
                      btnColor: FlutterFlowTheme.of(context).greenActive,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 14.0, 24.0, 0.0),
                  child: wrapWithModel(
                    model: _model.buttonModel2,
                    updateCallback: () => setState(() {}),
                    child: ButtonWidget(
                      text: 'Пропустить',
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
