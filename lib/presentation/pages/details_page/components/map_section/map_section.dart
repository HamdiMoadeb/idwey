import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSection extends StatelessWidget {
  final String title;
  final String lat;
  final String lng;
  const MapSection(
      {Key? key, required this.lat, required this.lng, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Emplacement',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Container(
            height: 200.h,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MapPosition(
                title: title,
                lat: double.tryParse(lat) ?? 0,
                lng: double.tryParse(lng) ?? 0,
              ),
            )),
      ],
    );
  }
}

class MapPosition extends StatefulWidget {
  final double lat;
  final double lng;
  final String title;
  const MapPosition(
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
      markerId: const MarkerId("location"),
      position: LatLng(widget.lat, widget.lng), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: widget.title,
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
