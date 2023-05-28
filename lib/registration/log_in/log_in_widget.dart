import '/auth/supabase_auth/auth_util.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_in_model.dart';
export 'log_in_model.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  late LogInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogInModel());

    _model.emailInputController ??= TextEditingController();
    _model.passwordInputController ??= TextEditingController();
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Вход',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: TextFormField(
                              controller: _model.emailInputController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.emailInputController',
                                Duration(milliseconds: 500),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.emailInputControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: TextFormField(
                              controller: _model.passwordInputController,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.passwordInputController',
                                Duration(milliseconds: 500),
                                () => setState(() {}),
                              ),
                              obscureText: !_model.passwordInputVisibility,
                              decoration: InputDecoration(
                                labelText: 'Пароль',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordInputVisibility =
                                        !_model.passwordInputVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordInputVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(context).black,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              validator: _model.passwordInputControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('ResetPassword');
                            },
                            child: Text(
                              'Забыли пароль?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!((_model.emailInputController.text != null &&
                                  _model.emailInputController.text != '') &&
                              (_model.passwordInputController.text != null &&
                                  _model.passwordInputController.text != '')))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.buttonModel1,
                                updateCallback: () => setState(() {}),
                                child: ButtonWidget(
                                  text: 'Далее',
                                  btnColor: FlutterFlowTheme.of(context)
                                      .notActiveButton,
                                ),
                              ),
                            ),
                          if ((_model.emailInputController.text != null &&
                                  _model.emailInputController.text != '') &&
                              (_model.passwordInputController.text != null &&
                                  _model.passwordInputController.text != ''))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();

                                  final user =
                                      await authManager.signInWithEmail(
                                    context,
                                    _model.emailInputController.text,
                                    _model.passwordInputController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  context.goNamedAuth('Home', context.mounted);
                                },
                                child: wrapWithModel(
                                  model: _model.buttonModel2,
                                  updateCallback: () => setState(() {}),
                                  child: ButtonWidget(
                                    text: 'Далее',
                                    btnColor: FlutterFlowTheme.of(context)
                                        .greenActive,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF0077FF),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                26.0, 12.0, 26.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 3.0),
                                  child: Icon(
                                    FFIcons.kvector2,
                                    color: FlutterFlowTheme.of(context).white,
                                    size: 12.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'ВКонтакте',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                        ),
                                  ),
                                ),
                              ],
                            ),
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
  }
}
