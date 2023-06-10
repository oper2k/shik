import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'sign_in5_model.dart';
export 'sign_in5_model.dart';

class SignIn5Widget extends StatefulWidget {
  const SignIn5Widget({
    Key? key,
    this.artDirection,
    this.knowledgeLevel,
    this.name,
    this.birthDate,
  }) : super(key: key);

  final String? artDirection;
  final String? knowledgeLevel;
  final String? name;
  final String? birthDate;

  @override
  _SignIn5WidgetState createState() => _SignIn5WidgetState();
}

class _SignIn5WidgetState extends State<SignIn5Widget> {
  late SignIn5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignIn5Model());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 0.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
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
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Icon(
                            FFIcons.kleft2,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 12.0, 0.0),
                    child: LinearPercentIndicator(
                      percent: 1.0,
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 27.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Golova.png',
                      width: 111.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 184.5,
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Corner.png',
                                  width: 15.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  14.5, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 170.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(22.0),
                                    topLeft: Radius.circular(22.0),
                                    topRight: Radius.circular(22.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22.0, 22.0, 22.0, 22.0),
                                  child: Text(
                                    'Тогда начнем!\nВот что вас ждёт!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.kcarbonCourse,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 36.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              28.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Более 100 курсов от лучших школ искусств Москвы',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kiconamoonFileVideoThin,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 36.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                28.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Огромная база видео материалов, тестов и квизов!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kfluentMdl2ReminderTime,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 36.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                28.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Привычка заниматься регулярно',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
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
            Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!((widget.knowledgeLevel != null &&
                          widget.knowledgeLevel != '') &&
                      (widget.artDirection != null &&
                          widget.artDirection != '') &&
                      (widget.name != null && widget.name != '')))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                      child: wrapWithModel(
                        model: _model.buttonModel1,
                        updateCallback: () => setState(() {}),
                        child: ButtonWidget(
                          text: 'Далее',
                          btnColor:
                              FlutterFlowTheme.of(context).notActiveButton,
                        ),
                      ),
                    ),
                  if ((widget.knowledgeLevel != null &&
                          widget.knowledgeLevel != '') &&
                      (widget.artDirection != null &&
                          widget.artDirection != '') &&
                      (widget.name != null && widget.name != ''))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await UsersTable().insert({
                            'name': widget.name,
                            'birth_date': widget.birthDate,
                            'art_direction': widget.artDirection,
                            'knowledge_level': widget.knowledgeLevel,
                            'rating': 0,
                            'id': currentUserUid,
                          });

                          context.goNamed('Home');
                        },
                        child: wrapWithModel(
                          model: _model.buttonModel2,
                          updateCallback: () => setState(() {}),
                          child: ButtonWidget(
                            text: 'Далее',
                            btnColor: FlutterFlowTheme.of(context).greenActive,
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
    );
  }
}
