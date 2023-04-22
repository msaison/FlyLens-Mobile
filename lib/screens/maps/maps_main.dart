import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../config.dart';
import 'package:latlong2/latlong.dart';
import '../../api.dart';

class MapsMain extends StatefulWidget {
  const MapsMain({Key? key}) : super(key: key);

  @override
  State<MapsMain> createState() => _MapsMainState();
}

class _MapsMainState extends State<MapsMain> {
  bool _isLoading = true;
  MapController _mapController = MapController();
  List<LatLng> fieldTest = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Stack(children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(50.62535968777625, 1.889277204330555),
                  maxZoom: 19.0,
                  minZoom: 4,
                  zoom: 16.0,
                  onTap: (tapPosition, point) {
                    setState(() {
                      fieldTest.add(point);
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://wxs.ign.fr/agriculture/geoportail/wmts?SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetTile&LAYER=LANDUSE.AGRICULTURE2021&TILEMATRIXSET=PM&TILEMATRIX={z}&TILECOL={x}&TILEROW={y}&STYLE=normal&FORMAT=image/png',
                  ),
                  TileLayer(
                    urlTemplate: GEOMAPLINK,
                    maxZoom: 21,
                    maxNativeZoom: 21,
                  ),
                  PolygonLayer(
                    polygons: [
                      Polygon(points: fieldTest, color: Colors.red.withOpacity(0.5), isFilled: true),
                    ],
                  ),
                ],
              ),
            ])
          : Center(
              child: SpinKitWave(
                color: AppColor.primaryColor,
              ),
            ),
    );
  }
}
