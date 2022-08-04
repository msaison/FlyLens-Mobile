import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flylens/config.dart';
import 'package:latlong2/latlong.dart';

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
                layers: [
                  // TileLayerOptions(
                  //   urlTemplate: GEOMAPAGRILINK,
                  // ),
                  TileLayerOptions(
                    urlTemplate: GEOMAPLINK,
                    maxZoom: 21,
                    maxNativeZoom: 21,
                    // wmsOptions: WMSTileLayerOptions(
                    //   baseUrl: 'https://wxs.ign.fr/agriculture/geoportail/r/wms?SERVICE=WMS&REQUEST=GetCapabilities&service=WMS&request=GetMap&styles=&width=256&height=256',
                    //   layers: ['LANDUSE.AGRICULTURE2020'],
                    //   crs: Epsg4326(),
                    //   format: 'image/png',
                    //   version: '1.3.0',
                    // ),
                  ),
                  PolygonLayerOptions(
                    polygons: [
                      Polygon(
                        points: fieldTest,
                        color: Colors.red.withOpacity(0.5),
                        isFilled: true
                      ),
                    ],
                  ),
                ],
              ),
            ])
          : Center(
              child: SpinKitWave(
                color: Color(0xff033323),
              ),
            ),
    );
  }
}
