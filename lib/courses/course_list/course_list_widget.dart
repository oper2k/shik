import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/button_widget.dart';
import '/components/tab_bar_widget.dart';
import '/courses/buy_course_wid/buy_course_wid_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_list_model.dart';
export 'course_list_model.dart';

class CourseListWidget extends StatefulWidget {
  const CourseListWidget({
    Key? key,
    required this.coursesRow,
  }) : super(key: key);

  final CoursesRow? coursesRow;

  @override
  _CourseListWidgetState createState() => _CourseListWidgetState();
}

class _CourseListWidgetState extends State<CourseListWidget> {
  late CourseListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseListModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.coursesRow?.title,
                          'Заголовок курса',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<CoursesLessonsRow>>(
                  future: CoursesLessonsTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'course_id',
                          widget.coursesRow?.id,
                        )
                        .order('lesson_number', ascending: true),
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
                    List<CoursesLessonsRow>
                        coursesLessonsQueryCoursesLessonsRowList =
                        snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<UsersCoursesRow>>(
                        future: UsersCoursesTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'user_id',
                                currentUserUid,
                              )
                              .eq(
                                'course_id',
                                widget.coursesRow?.id,
                              ),
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
                          List<UsersCoursesRow>
                              usersCoursesQueryUsersCoursesRowList =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 22.0, 24.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    if (usersCoursesQueryUsersCoursesRowList
                                            .length ==
                                        0)
                                      Text(
                                        'К изучению',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    if (usersCoursesQueryUsersCoursesRowList
                                            .length ==
                                        0)
                                      Builder(
                                        builder: (context) {
                                          final coursesLessonsChildFreeLessons =
                                              coursesLessonsQueryCoursesLessonsRowList
                                                  .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                coursesLessonsChildFreeLessons
                                                    .length,
                                                (coursesLessonsChildFreeLessonsIndex) {
                                              final coursesLessonsChildFreeLessonsItem =
                                                  coursesLessonsChildFreeLessons[
                                                      coursesLessonsChildFreeLessonsIndex];
                                              return Visibility(
                                                visible: valueOrDefault<bool>(
                                                  coursesLessonsChildFreeLessonsItem
                                                      .openStatus,
                                                  false,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 22.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'CourseLesson',
                                                        queryParams: {
                                                          'coursePurchased':
                                                              serializeParam(
                                                            usersCoursesQueryUsersCoursesRowList
                                                                    .length >
                                                                0,
                                                            ParamType.bool,
                                                          ),
                                                          'coursesLessonsRowList':
                                                              serializeParam(
                                                            coursesLessonsQueryCoursesLessonsRowList,
                                                            ParamType
                                                                .SupabaseRow,
                                                            true,
                                                          ),
                                                          'coursesRow':
                                                              serializeParam(
                                                            widget.coursesRow,
                                                            ParamType
                                                                .SupabaseRow,
                                                          ),
                                                          'initialIndex':
                                                              serializeParam(
                                                            coursesLessonsChildFreeLessonsIndex,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 144.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                coursesLessonsChildFreeLessonsItem
                                                                    .imageUrl!,
                                                                width: 120.0,
                                                                height: 135.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Урок ${coursesLessonsChildFreeLessonsItem.lessonNumber?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              Color(0xFF76787A),
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.4,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        coursesLessonsChildFreeLessonsItem
                                                                            .title,
                                                                        'Заголовок',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            lineHeight:
                                                                                1.4,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        coursesLessonsChildFreeLessonsItem
                                                                            .description,
                                                                        'Описание',
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0xFF76787A),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            lineHeight:
                                                                                1.4,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    if (usersCoursesQueryUsersCoursesRowList
                                            .length ==
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 22.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'BuyCourse',
                                              queryParams: {
                                                'coursesRow': serializeParam(
                                                  widget.coursesRow,
                                                  ParamType.SupabaseRow,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model.buttonModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: ButtonWidget(
                                              text: 'Купить курс',
                                              btnColor: Color(0xFFDEA5BA),
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
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
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Text(
                                                'Посмотреть на карте',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 0.0),
                                      child: Text(
                                        'Следующие уроки',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    if (usersCoursesQueryUsersCoursesRowList
                                            .length ==
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final coursesLessonsChild =
                                                coursesLessonsQueryCoursesLessonsRowList
                                                    .toList();
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 28.0,
                                                mainAxisSpacing: 20.0,
                                                childAspectRatio: 0.8,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  coursesLessonsChild.length,
                                              itemBuilder: (context,
                                                  coursesLessonsChildIndex) {
                                                final coursesLessonsChildItem =
                                                    coursesLessonsChild[
                                                        coursesLessonsChildIndex];
                                                return Visibility(
                                                  visible:
                                                      !coursesLessonsChildItem
                                                          .openStatus!,
                                                  child: Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showAlignedDialog(
                                                          context: context,
                                                          isGlobal: true,
                                                          avoidOverflow: false,
                                                          targetAnchor:
                                                              Alignment(
                                                                  0.0, 0.0),
                                                          followerAnchor:
                                                              Alignment(
                                                                  0.0, 0.0),
                                                          builder:
                                                              (dialogContext) {
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _unfocusNode),
                                                                child:
                                                                    BuyCourseWidWidget(
                                                                  coursesRow: widget
                                                                      .coursesRow!,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Container(
                                                        height: 220.0,
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    ClipRect(
                                                                      child:
                                                                          ImageFiltered(
                                                                        imageFilter:
                                                                            ImageFilter.blur(
                                                                          sigmaX:
                                                                              8.0,
                                                                          sigmaY:
                                                                              8.0,
                                                                        ),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          child:
                                                                              Image.network(
                                                                            coursesLessonsChildItem.imageUrl!,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                106.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Урок ${coursesLessonsChildItem.lessonNumber?.toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF76787A),
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                coursesLessonsChildItem.description,
                                                                                'Описание урока',
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kfluentLockClosed20Regular,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if (usersCoursesQueryUsersCoursesRowList
                                            .length >
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final coursesLessonsChild =
                                                coursesLessonsQueryCoursesLessonsRowList
                                                    .toList();
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 28.0,
                                                mainAxisSpacing: 20.0,
                                                childAspectRatio: 0.8,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  coursesLessonsChild.length,
                                              itemBuilder: (context,
                                                  coursesLessonsChildIndex) {
                                                final coursesLessonsChildItem =
                                                    coursesLessonsChild[
                                                        coursesLessonsChildIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'CourseLesson',
                                                      queryParams: {
                                                        'coursePurchased':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                        'coursesLessonsRowList':
                                                            serializeParam(
                                                          coursesLessonsQueryCoursesLessonsRowList,
                                                          ParamType.SupabaseRow,
                                                          true,
                                                        ),
                                                        'coursesRow':
                                                            serializeParam(
                                                          widget.coursesRow,
                                                          ParamType.SupabaseRow,
                                                        ),
                                                        'initialIndex':
                                                            serializeParam(
                                                          coursesLessonsChildIndex,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 212.0,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                child: Image
                                                                    .network(
                                                                  coursesLessonsChildItem
                                                                      .imageUrl!,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 106.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Урок ${coursesLessonsChildItem.lessonNumber?.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Color(0xFF76787A),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          coursesLessonsChildItem
                                                                              .description,
                                                                          'Описание урока',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Icon(
                                                              FFIcons
                                                                  .kfluentLockClosed20Regular,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.05, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 60.0, 0.0, 0.0),
                                        child: Text(
                                          'Преподаватель курса ${widget.coursesRow?.instructorName}',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.coursesRow
                                              ?.instructorDescription,
                                          'Дополнительная информация о преподавателе',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        'Школы искусств, предоставляющие занятия по интересующему направлению:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 14.0, 0.0, 40.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.coursesRow?.schoolAdress,
                                          'Адреса школ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              wrapWithModel(
                model: _model.tabBarModel,
                updateCallback: () => setState(() {}),
                child: TabBarWidget(
                  activeTab: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
