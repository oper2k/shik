import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/map_folder/school_info/school_info_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowGoogleMap(
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
                setState(() {
                  _model.centerMap = _model.googleMapsCenter;
                });
                setState(() {
                  _model.index = functions.mapGetIndex(
                      _model.latLngList.toList(), _model.centerMap)!;
                });
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (bottomSheetContext) {
                    return Padding(
                      padding: MediaQuery.of(bottomSheetContext).viewInsets,
                      child: SchoolInfoWidget(
                        current: widget.mapRowList![_model.index],
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
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
    );
  }
}
