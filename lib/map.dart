import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:super_admin/controller/addacount/addhotelaccountcontroller.dart';

class MapSample extends StatefulWidget {
  final Position position;
  const MapSample({super.key, required this.position});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late Set<Marker>? mymarkers = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(widget.position.latitude, widget.position.longitude))
  };

  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  late CameraPosition mypos = CameraPosition(
      target: LatLng(widget.position.latitude, widget.position.longitude));

  Widget build(BuildContext context) {
    AddHotelAccountController controller = Get.find();
    return Scaffold(
      body: GoogleMap(
        gestureRecognizers: Set()
          ..add(
              Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
        markers: mymarkers!,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (l) {
          mymarkers!.add(Marker(
              markerId: MarkerId("1"),
              position: LatLng(l.latitude, l.longitude)));
          controller.hotel!.lat = l.latitude.toDouble();
          controller.hotel!.long = l.longitude.toDouble();
          controller.verticalline!.text = l.longitude.toString();
          controller.horizonalline!.text = l.latitude.toString();

          setState(() {});
        },
        initialCameraPosition: CameraPosition(
            zoom: 50,
            target:
                LatLng(widget.position.latitude, widget.position.longitude)),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(mypos));
  }
}
