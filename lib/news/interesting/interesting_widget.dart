import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interesting_model.dart';
export 'interesting_model.dart';

class InterestingWidget extends StatefulWidget {
  const InterestingWidget({Key? key}) : super(key: key);

  @override
  _InterestingWidgetState createState() => _InterestingWidgetState();
}

class _InterestingWidgetState extends State<InterestingWidget> {
  late InterestingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestingModel());
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
          children: [
            Container(
              width: double.infinity,
              height: 211.0,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Cat.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: wrapWithModel(
                      model: _model.backButtonModel,
                      updateCallback: () => setState(() {}),
                      child: BackButtonWidget(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xFFA3C8D8),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Интересное',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).white,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 26.0, 0.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        child: Icon(
                          FFIcons.kicSharpSearch1,
                          color: FlutterFlowTheme.of(context).white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 14.0, 24.0, 45.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '1 марта отмечают Всемирный день кошек!  Многие музыканты, писатели, художники и другие деятели искусств были неравнодушны к кошкам, воспевали грациозность этих животных в искусстве и заботились о своих домашних питомцах.   Коты встречаются в творчестве поэта Иосифа Бродского: им посвящены не только стихотворения и оды, но и очерки, рисунки и зарисовки, продуманные до мелких деталей и сделанные наспех в порыве вдохновения. Кота Иосифа Бродского звали Миссисипи, а в детстве у него был кот по имени Оська. Бродский утверждал, что в кошачей кличке обязательно должен присутствовать звук «с».   Знаменитый абстракционист Василий Кандинский назвал своего кота… Васька!Мало кто знает, что в собрании Музея Гуггенхайма в Нью-Йорке хранится картина Кандинского с изображением кота – художник рисовал не только абстрактные картины. В доме композитора Дмитрия Шостаковича временами жили и собаки, и кошки. Говорят, первых он терпел, а вот вторых нежно любил.  В доме композитора Дмитрия Шостаковича временами жили и собаки, и кошки. Говорят, первых он терпел, а вот вторых нежно любил.   У Игоря Стравинского было целых три кота: Панчо, Челеста и Василий Васильевич. Про последнего один из друзей композитора рассказывал такую историю: «Кот Васька был очень избалованный. Когда Стравинские взяли ещё одного кота, Васька так расстроился и так ревновал, что не на шутку заболел, и Стравинские в конце концов (о ужас!) высадили второго кота в шестнадцати километрах от дома, привязав ему на шею записочку, в которой говорилось, что кота можно подобрать. Однако второй кот оказался не промах и нашёл дорогу обратно в дом Стравинских». ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      lineHeight: 1.4,
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
    );
  }
}
