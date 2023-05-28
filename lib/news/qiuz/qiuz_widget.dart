import '/backend/supabase/supabase.dart';
import '/components/quizzes_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'qiuz_model.dart';
export 'qiuz_model.dart';

class QiuzWidget extends StatefulWidget {
  const QiuzWidget({Key? key}) : super(key: key);

  @override
  _QiuzWidgetState createState() => _QiuzWidgetState();
}

class _QiuzWidgetState extends State<QiuzWidget> {
  late QiuzModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QiuzModel());
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
        body: FutureBuilder<List<FeedQuizzesRow>>(
          future: FeedQuizzesTable().queryRows(
            queryFn: (q) => q,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              );
            }
            List<FeedQuizzesRow> queryQuizzesFeedQuizzesRowList =
                snapshot.data!;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 45.0, 24.0, 0.0),
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
                              context.safePop();
                            },
                            child: Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Icon(
                                  FFIcons.kleft2,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Квиз',
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
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final queryQuizzesChild =
                                    queryQuizzesFeedQuizzesRowList.toList();
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(queryQuizzesChild.length,
                                          (queryQuizzesChildIndex) {
                                    final queryQuizzesChildItem =
                                        queryQuizzesChild[
                                            queryQuizzesChildIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.quizzesListModels.getModel(
                                          queryQuizzesChildIndex.toString(),
                                          queryQuizzesChildIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: QuizzesListWidget(
                                          key: Key(
                                            'Keyx2m_${queryQuizzesChildIndex.toString()}',
                                          ),
                                          feedQuizzesRow: queryQuizzesChildItem,
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
