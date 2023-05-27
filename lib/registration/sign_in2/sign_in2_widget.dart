import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'sign_in2_model.dart';
export 'sign_in2_model.dart';

class SignIn2Widget extends StatefulWidget {
  const SignIn2Widget({Key? key}) : super(key: key);

  @override
  _SignIn2WidgetState createState() => _SignIn2WidgetState();
}

class _SignIn2WidgetState extends State<SignIn2Widget> {
  late SignIn2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignIn2Model());

    _model.nameInputController ??= TextEditingController();
    _model.birthDateInputController ??= TextEditingController();
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      storageFolderPath: 'photo_url',
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];
                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = await uploadSupabaseStorageFiles(
                          bucketName: 'media',
                          selectedMedia: selectedMedia,
                        );
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }
                  },
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFC7BBDC),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kmaterialSymbolsAddAPhotoOutline,
                        color: FlutterFlowTheme.of(context).white,
                        size: 46.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
                child: Text(
                  'Как к вам обращаться?',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                      controller: _model.nameInputController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.nameInputController',
                        Duration(milliseconds: 500),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Имя',
                        labelStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                      keyboardType: TextInputType.name,
                      validator: _model.nameInputControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                      controller: _model.birthDateInputController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.birthDateInputController',
                        Duration(milliseconds: 500),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Дата рождения',
                        labelStyle: FlutterFlowTheme.of(context).titleLarge,
                        hintText: '25.05.2010',
                        hintStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 8.0),
                        prefixIcon: Icon(
                          FFIcons.kmaterialSymbolsCalendarMonthOutlineRounded,
                          color: FlutterFlowTheme.of(context).black,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                      keyboardType: TextInputType.datetime,
                      validator: _model.birthDateInputControllerValidator
                          .asValidator(context),
                      inputFormatters: [_model.birthDateInputMask],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!((_model.nameInputController.text != null &&
                          _model.nameInputController.text != '') &&
                      (_model.birthDateInputController.text != null &&
                          _model.birthDateInputController.text != '')))
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
                  if ((_model.nameInputController.text != null &&
                          _model.nameInputController.text != '') &&
                      (_model.birthDateInputController.text != null &&
                          _model.birthDateInputController.text != ''))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'SignIn3',
                            queryParams: {
                              'name': serializeParam(
                                _model.nameInputController.text,
                                ParamType.String,
                              ),
                              'brithDate': serializeParam(
                                _model.birthDateInputController.text,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: wrapWithModel(
                          model: _model.buttonModel2,
                          updateCallback: () => setState(() {}),
                          child: ButtonWidget(
                            text: 'Далее',
                            btnColor: Color(0xFFA4CE57),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
