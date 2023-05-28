import '/components/button_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'not_authorized_model.dart';
export 'not_authorized_model.dart';

class NotAuthorizedWidget extends StatefulWidget {
  const NotAuthorizedWidget({
    Key? key,
    required this.activeTab,
  }) : super(key: key);

  final int? activeTab;

  @override
  _NotAuthorizedWidgetState createState() => _NotAuthorizedWidgetState();
}

class _NotAuthorizedWidgetState extends State<NotAuthorizedWidget> {
  late NotAuthorizedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotAuthorizedModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      AutoSizeText(
                        'Только авторизованные пользователи могут просматривать данную информацию.\n\nПройдите регистрацию или авторизуйтесь.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Inter',
                              lineHeight: 1.4,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Registration');
                          },
                          child: wrapWithModel(
                            model: _model.buttonModel,
                            updateCallback: () => setState(() {}),
                            child: ButtonWidget(
                              text: 'Регистрация',
                              btnColor: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('LogIn');
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Text(
                                  'У меня уже есть аккаунт',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.tabBarModel,
              updateCallback: () => setState(() {}),
              child: TabBarWidget(
                activeTab: widget.activeTab!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
