import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapView extends StatefulWidget {
  const MapView({
    super.key,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
        controller:controller,
        osmOption: OSMOption(
          userTrackingOption: UserTrackingOption(
            enableTracking: true,
            unFollowUser: false,
          ),
          zoomOption: ZoomOption(
            initZoom: 3,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: MarkerIcon(
              icon: Icon(
                Icons.location_history_rounded,
                color: Colors.red,
                size: 48,
              ),
            ),
            directionArrowMarker: MarkerIcon(
              icon: Icon(
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),
          roadConfiguration: RoadOption(
            roadColor: Colors.yellowAccent,
          ),
          // markerOption: MarkerOption(
          //     defaultMarker: MarkerIcon(
          //       icon: Icon(
          //         Icons.person_pin_circle,
          //         color: Colors.blue,
          //         size: 56,
          //       ),
          //     )
          // ),
        )
    );

  }
}