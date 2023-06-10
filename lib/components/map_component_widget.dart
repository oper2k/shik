import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map_folder/school_info/school_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_component_model.dart';
export 'map_component_model.dart';

class MapComponentWidget extends StatefulWidget {
  const MapComponentWidget({
    Key? key,
    required this.mapRowList,
  }) : super(key: key);

  final List<MapRow>? mapRowList;

  @override
  _MapComponentWidgetState createState() => _MapComponentWidgetState();
}

class _MapComponentWidgetState extends State<MapComponentWidget> {
  late MapComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updatePage(() {
        _model.latLngList = functions
            .combineMapLatLng(
                widget.mapRowList
                    ?.map((e) => e.lat)
                    .withoutNulls
                    .toList()
                    ?.toList(),
                widget.mapRowList
                    ?.map((e) => e.lng)
                    .withoutNulls
                    .toList()
                    ?.toList())!
            .toList()
            .cast<LatLng>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        FlutterFlowGoogleMap(
          controller: _model.googleMapsController,
          onCameraIdle: (latLng) =>
              setState(() => _model.googleMapsCenter = latLng),
          initialLocation: _model.googleMapsCenter ??= LatLng(55.7522, 37.6156),
          markers: _model.latLngList
              .map(
                (marker) => FlutterFlowMarker(
                  marker.serialize(),
                  marker,
                  () async {
                    _model.showBottomInfoController.onExecute
                        .add(StopWatchExecute.start);
                  },
                ),
              )
              .toList(),
          markerColor: GoogleMarkerColor.violet,
          mapType: MapType.normal,
          style: GoogleMapStyle.standard,
          initialZoom: 10.0,
          allowInteraction: true,
          allowZoom: true,
          showZoomControls: true,
          showLocation: false,
          showCompass: false,
          showMapToolbar: false,
          showTraffic: false,
          centerMapOnMarkerTap: true,
        ),
        FlutterFlowTimer(
          initialTime: _model.showBottomInfoMilliseconds,
          getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
            value,
            hours: false,
            milliSecond: false,
          ),
          timer: _model.showBottomInfoController,
          updateStateInterval: Duration(milliseconds: 1000),
          onChanged: (value, displayTime, shouldUpdate) {
            _model.showBottomInfoMilliseconds = value;
            _model.showBottomInfoValue = displayTime;
            if (shouldUpdate) setState(() {});
          },
          onEnded: () async {
            setState(() {
              _model.centerMap = _model.googleMapsCenter;
              _model.index = functions.mapGetIndex(
                  _model.latLngList.toList(), _model.centerMap)!;
            });
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: SchoolInfoWidget(
                    current: widget.mapRowList![_model.index],
                  ),
                );
              },
            ).then((value) => setState(() {}));

            _model.showBottomInfoController.onExecute
                .add(StopWatchExecute.stop);
          },
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Inter',
                fontSize: 0.0,
              ),
        ),
      ],
    );
  }
}
