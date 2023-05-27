import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_date_model.dart';
export 'choose_date_model.dart';

class ChooseDateWidget extends StatefulWidget {
  const ChooseDateWidget({Key? key}) : super(key: key);

  @override
  _ChooseDateWidgetState createState() => _ChooseDateWidgetState();
}

class _ChooseDateWidgetState extends State<ChooseDateWidget> {
  late ChooseDateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseDateModel());
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
      child: Container(
        width: 327.0,
        height: 665.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Урок музыки в ДМШИ И.О. Дунаевского ',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 58.0, 0.0, 0.0),
                child: Text(
                  'Выберите дату',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).greenActive,
                iconColor: Color(0xFF4A5660),
                weekFormat: false,
                weekStartsMonday: false,
                rowHeight: 64.0,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay = newSelectedDate);
                },
                titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                    ),
                dayOfWeekStyle:
                    FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          fontSize: 11.0,
                        ),
                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                selectedDateStyle:
                    FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                inactiveDateStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 0.0,
                          fontWeight: FontWeight.w100,
                        ),
                locale: FFLocalizations.of(context).languageCode,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.buttonModel,
                  updateCallback: () => setState(() {}),
                  child: ButtonWidget(
                    text: 'Записаться',
                    btnColor: Color(0xFFDEA5BA),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
