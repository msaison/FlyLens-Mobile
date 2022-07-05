import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsMain extends StatefulWidget {
  const GoogleMapsMain({Key key}) : super(key: key);

  @override
  State<GoogleMapsMain> createState() => _GoogleMapsMainState();
}

class _GoogleMapsMainState extends State<GoogleMapsMain> {
  CameraPosition position = CameraPosition(target: LatLng(43.657892, 7.122337));
  Completer<GoogleMapController> _controller = Completer();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Stack(children: [
        GoogleMap(
          initialCameraPosition: position,
          onMapCreated: (_) {
            isLoading = false;
            _controller.complete(_);
          },
        )
      ]) : Center(child: SpinKitWave(color: Color(0xff033323),),),
    );
  }
}
