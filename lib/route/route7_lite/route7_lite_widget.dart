import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'route7_lite_model.dart';
export 'route7_lite_model.dart';

class Route7LiteWidget extends StatefulWidget {
  const Route7LiteWidget({Key? key}) : super(key: key);

  @override
  _Route7LiteWidgetState createState() => _Route7LiteWidgetState();
}

class _Route7LiteWidgetState extends State<Route7LiteWidget> {
  late Route7LiteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Route7LiteModel());
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
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
                      percent: 0.3,
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Найди пары',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                        child: Icon(
                          FFIcons.kphHourglassLight,
                          color: FlutterFlowTheme.of(context).white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Уровень : Lite',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Route7Intermediate');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/Group.png',
                        width: 31.0,
                        height: 34.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 34.0, 24.0, 0.0),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  primary: false,
                  scrollDirection: Axis.vertical,
                  children: [
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'assets/images/Frame_11748_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    FlipCard(
                      fill: Fill.fillBack,
                      direction: FlipDirection.HORIZONTAL,
                      speed: 400,
                      front: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF5F9),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
                          ),
                        ),
                      ),
                      back: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_11704_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Color(0xFFA9A9A9),
                            width: 1.0,
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
    );
  }
}
