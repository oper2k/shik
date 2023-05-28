import '/backend/supabase/supabase.dart';
import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'playlist_full_model.dart';
export 'playlist_full_model.dart';

class PlaylistFullWidget extends StatefulWidget {
  const PlaylistFullWidget({Key? key}) : super(key: key);

  @override
  _PlaylistFullWidgetState createState() => _PlaylistFullWidgetState();
}

class _PlaylistFullWidgetState extends State<PlaylistFullWidget> {
  late PlaylistFullModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistFullModel());
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
        body: FutureBuilder<List<FeedPlaylistsAudioRow>>(
          future: FeedPlaylistsAudioTable().queryRows(
            queryFn: (q) => q.order('created_at'),
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
            List<FeedPlaylistsAudioRow> queryPlaylistFeedPlaylistsAudioRowList =
                snapshot.data!;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: 211.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/Piano.jpg',
                            width: double.infinity,
                            height: double.infinity,
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
                            'Плейлист',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).white,
                                  lineHeight: 1.4,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 0.0),
                    child: Text(
                      'Классическая музыка, которую слышал каждый.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final playlistsAudioChild =
                              queryPlaylistFeedPlaylistsAudioRowList.toList();
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(playlistsAudioChild.length,
                                      (playlistsAudioChildIndex) {
                                final playlistsAudioChildItem =
                                    playlistsAudioChild[
                                        playlistsAudioChildIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        _model.currentAudio =
                                            playlistsAudioChildItem;
                                      });
                                      setState(() {
                                        _model.currentIndex =
                                            playlistsAudioChildIndex;
                                      });
                                      if (_model.isPlaying) {
                                        setState(() {
                                          _model.isPlaying = false;
                                        });
                                        _model.soundPlayer1?.stop();
                                        _model.soundPlayer2?.stop();
                                      } else {
                                        setState(() {
                                          _model.isPlaying = true;
                                        });
                                        _model.soundPlayer1 ??= AudioPlayer();
                                        if (_model.soundPlayer1!.playing) {
                                          await _model.soundPlayer1!.stop();
                                        }
                                        _model.soundPlayer1!.setVolume(1.0);
                                        _model.soundPlayer1!
                                            .setUrl(
                                                _model.currentAudio!.audioUrl!)
                                            .then((_) =>
                                                _model.soundPlayer1!.play());
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 16.0, 12.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!(_model.isPlaying &&
                                                (playlistsAudioChildIndex ==
                                                    _model.currentIndex)))
                                              Icon(
                                                Icons.play_circle_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 36.0,
                                              ),
                                            if (_model.isPlaying &&
                                                (playlistsAudioChildIndex ==
                                                    _model.currentIndex))
                                              Icon(
                                                Icons.pause_circle_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 36.0,
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      18.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  playlistsAudioChildItem.title,
                                                  'title',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 34.0, 24.0, 45.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFA3C8D8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.currentIndex =
                                    functions.substratOne(_model.currentIndex)!;
                                _model.currentAudio =
                                    queryPlaylistFeedPlaylistsAudioRowList[
                                        _model.currentIndex];
                                _model.isPlaying = false;
                              });
                              _model.soundPlayer1?.stop();
                              _model.soundPlayer2?.stop();
                            },
                            child: Icon(
                              Icons.skip_previous,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 36.0,
                            ),
                          ),
                          if (!_model.isPlaying)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.isPlaying = true;
                                });
                                _model.soundPlayer1?.stop();
                                _model.soundPlayer2 ??= AudioPlayer();
                                if (_model.soundPlayer2!.playing) {
                                  await _model.soundPlayer2!.stop();
                                }
                                _model.soundPlayer2!.setVolume(1.0);
                                _model.soundPlayer2!
                                    .setUrl(_model.currentAudio!.audioUrl!)
                                    .then((_) => _model.soundPlayer2!.play());
                              },
                              child: Icon(
                                Icons.play_circle_outline,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 36.0,
                              ),
                            ),
                          if (_model.isPlaying)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.isPlaying = false;
                                });
                                _model.soundPlayer2?.stop();
                                _model.soundPlayer1?.stop();
                              },
                              child: Icon(
                                Icons.pause_circle_outline,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 36.0,
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.currentIndex ==
                                  functions.substratOne(
                                      queryPlaylistFeedPlaylistsAudioRowList
                                          .length)) {
                                return;
                              }

                              setState(() {
                                _model.currentIndex = _model.currentIndex + 1;
                                _model.currentAudio =
                                    queryPlaylistFeedPlaylistsAudioRowList[
                                        _model.currentIndex];
                                _model.isPlaying = false;
                              });
                              _model.soundPlayer1?.stop();
                              _model.soundPlayer2?.stop();
                            },
                            child: Icon(
                              Icons.skip_next,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 36.0,
                            ),
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
