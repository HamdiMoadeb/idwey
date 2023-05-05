import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapPosition extends StatefulWidget {
  double lat;
  double lng;
  String title;
  MapPosition(
      {Key? key, required this.lat, required this.lng, required this.title})
      : super(key: key);

  @override
  State<MapPosition> createState() => _MapPositionState();
}

class _MapPositionState extends State<MapPosition> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = Set();

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId("location"),
      position: LatLng(widget.lat, widget.lng), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: '${widget.title}',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //you can add more markers here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: GoogleMap(
          zoomControlsEnabled: false,
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer())
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.lng),
            zoom: 11.0,
          ),
          markers: markers),
    );
  }
}
