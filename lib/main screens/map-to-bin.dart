import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapToBin extends StatelessWidget {
  Widget build(BuildContext context) {
    const LatLng applePark = LatLng(41.380898, 2.122820);
    return Container(
        child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: applePark, zoom: 12)));
  }
}
