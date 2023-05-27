import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'right6_model.dart';
export 'right6_model.dart';

class Right6Widget extends StatefulWidget {
  const Right6Widget({Key? key}) : super(key: key);

  @override
  _Right6WidgetState createState() => _Right6WidgetState();
}

class _Right6WidgetState extends State<Right6Widget> {
  late Right6Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Right6Model());
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 24.0, 0.0),
                    child: Container(
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Icon(
                          FFIcons.kiconoirSoundLow,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Правильно!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Портрет ИС Баха',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                  child: Text(
                    'Иоганн Себастьян Бах (1685 – 1750)немецкий композитор, органист, капельмейстер, музыкальный педагог.Бах — один из величайших представителей музыкального искусства эпохи барокко. Его творчество отличается всеохватностью жанров (за исключением оперы и балета). Композитор соединил традиции немецкой культуры, прежде всего – протестантского хорала, с завоеваниями австрийской, итальянской, французской музыкальных школ.Бах – великий мастер полифонии, в его творчестве барочная полифония достигла наивысшего расцвета.  Барокко – одна из характеристик европейской культуры эпохи XVII—XVIII веков, центром которой была Италия. Барокко – один из самых многозначных терминов в истории и теории художественной культуры.\nС итальянского языка это слово переводится как «странный, причудливый». Эпоха барокко отвергала естественность, считая ее невежеством. Для этого художественного направления было характерно наличие большого количестваукрашений, которые порой буквально не давали разглядеть смысл.\n\nБарочная музыка – это стиль в западноевропейской музыке, охватывающийэпоху примерно с 1600 по 1750 год. Она последовала за эпохой Возрождения, а за ней, в свою очередь, последовала классическая эпоха. Период барокко делится на три основных этапа: ранний, средний и поздний.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
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
                          '+10',
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
                      EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 6.0),
                  child: wrapWithModel(
                    model: _model.buttonModel,
                    updateCallback: () => setState(() {}),
                    child: ButtonWidget(
                      text: 'Следующий уровень',
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
