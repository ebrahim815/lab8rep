import 'dart:async';
import 'package:lab8/model/users.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapSample extends StatefulWidget {
  Geo userLocation;

  MapSample({this.userLocation});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initLocation;

  @override
  void initState() {
    super.initState();
    initLocation = CameraPosition(
      target: LatLng(
        double.parse(widget.userLocation.lat),
        double.parse(widget.userLocation.lng),
      ),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: openLocation,
          label: Text('OpenMyLocation'),
          icon: Icon(Icons.location_city)),
    );
  }

  openLocation() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.userLocation.lat),
      double.parse(widget.userLocation.lng),
    );
  }
}
