import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather/weather.dart';

class WeatherShow extends StatefulWidget {
  final double latitude;
  final double longitude;
  const WeatherShow({this.latitude = 43.631188, this.longitude = 7.130258, Key key}) : super(key: key);

  @override
  State<WeatherShow> createState() => _WeatherShowState();
}

class _WeatherShowState extends State<WeatherShow> {
  final WeatherFactory _weatherFactory = WeatherFactory('5ced979135b6774c501086f1aba2b0c4', language: Language.FRENCH);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _weatherFactory.currentWeatherByLocation(widget.latitude, widget.longitude),
        builder: (BuildContext context, AsyncSnapshot<Weather> weather) {
          return Container(
            padding: EdgeInsets.only(left: 25).copyWith(right: 40),
            constraints: BoxConstraints(maxHeight: 71),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: weather.hasData
                ? Row(
                    children: [
                      Image.network("http://openweathermap.org/img/wn/${weather.data.weatherIcon}@2x.png"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Aujourd'hui",
                            style: TextStyle(color: Color.fromARGB(255, 53, 158, 81), fontWeight: FontWeight.w600),
                          ),
                          Text.rich(
                            TextSpan(
                                text: '${weather.data.tempMax.celsius.toInt().toString()}°C ',
                                style: TextStyle(color: Color(0xff033323), fontWeight: FontWeight.w600, fontSize: 10),
                                children: [
                                  TextSpan(
                                      text: '${weather.data.tempMin.celsius.toInt().toString()}°C',
                                      style: TextStyle(color: Color.fromARGB(255, 139, 139, 139))),
                                ]),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: '${weather.data.date.hour}:${weather.data.date.minute}h ',
                                style: TextStyle(color: Color(0xff033323), fontWeight: FontWeight.w600, fontSize: 10),
                                children: [
                                  TextSpan(
                                      text:
                                          '(${weather.data.sunrise.hour}:${weather.data.sunrise.minute} / ${weather.data.sunset.hour}:${weather.data.sunset.minute})',
                                      style: TextStyle(color: Color.fromARGB(255, 139, 139, 139))),
                                ]),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.water_drop,
                                color: Colors.blue,
                                size: 12,
                              ),
                              Text(
                                '${weather.data.humidity}%',
                                style: TextStyle(color: Color(0xff033323), fontWeight: FontWeight.w600, fontSize: 10),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.air,
                                color: Colors.blue,
                                size: 12,
                              ),
                              Text(
                                '${weather.data.windSpeed}m/s',
                                style: TextStyle(color: Color(0xff033323), fontWeight: FontWeight.w600, fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                : Center(
                    child: SpinKitWave(
                      color: Color.fromARGB(255, 53, 158, 81),
                      size: 20,
                    ),
                  ),
          );
        });
  }
}

IconData weatherIcon(int weatherCode) {
  if (weatherCode >= 200 && weatherCode < 233) {
    return Iconsax.cloud_lightning;
  } else if (weatherCode >= 300 && weatherCode < 322) {
    return Iconsax.cloud_drizzle;
  } else if (weatherCode >= 500 && weatherCode < 532) {
    return Iconsax.drop;
  } else if (weatherCode >= 600 && weatherCode < 623) {
    return Iconsax.cloud_snow;
  } else if (weatherCode >= 700 && weatherCode < 782) {
    return Iconsax.cloud_fog;
  } else if (weatherCode > 800 && weatherCode < 805) {
    return Iconsax.cloud;
  } else {
    return Iconsax.sun_1;
  }
}