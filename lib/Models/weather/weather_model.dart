import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String id,
    required String name,
    @LatLngConverter() required LatLng center,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

class LatLngConverter implements JsonConverter<LatLng, String> {
  const LatLngConverter();

  @override
  LatLng fromJson(String latLng) {
    return LatLng(double.parse(latLng.substring(0, latLng.indexOf(','))),
        double.parse(latLng.substring(latLng.indexOf(',') + 2)));
  }

  @override
  String toJson(LatLng latLng) {
    return '${latLng.latitude.toDouble()}, ${latLng.longitude.toDouble()}';
  }
}
