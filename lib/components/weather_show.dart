import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../api.dart';
import '../helper.dart';
import 'package:iconsax/iconsax.dart';
import '../config.dart';
import 'package:weather/weather.dart';

class WeatherShow extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String name;
  final bool deleting;
  final void Function(bool? delete)? isDeleting;
  const WeatherShow(
      {required this.latitude,
      required this.longitude,
      required this.name,
      this.deleting = false,
      this.isDeleting,
      Key? key})
      : super(key: key);

  @override
  State<WeatherShow> createState() => _WeatherShowState();
}

class _WeatherShowState extends State<WeatherShow> {
  final WeatherFactory _weatherFactory = WeatherFactory(WEATHER_API, language: Language.FRENCH);
  bool _isDelete = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _weatherFactory.currentWeatherByLocation(widget.latitude, widget.longitude),
        builder: (BuildContext context, AsyncSnapshot<Weather> weather) {
          return Container(
            padding: EdgeInsets.only(left: widget.deleting ? 10 : 25).copyWith(right: widget.deleting ? 20 : 40),
            constraints: BoxConstraints(maxHeight: 71),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: weather.hasData
                ? Row(
                    children: [
                      Image.network("http://openweathermap.org/img/wn/${weather.data!.weatherIcon}@2x.png"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.w,
                            child: AutoSizeText(
                              widget.name,
                              minFontSize: 5,
                              maxLines: 1,
                              style: TextStyle(color: Color.fromARGB(255, 53, 158, 81), fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                                text: '${weather.data!.tempMax!.celsius!.toInt().toString()}°C ',
                                style:
                                    TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.w600, fontSize: 10),
                                children: [
                                  TextSpan(
                                      text: '${weather.data!.tempMin!.celsius!.toInt().toString()}°C',
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
                                text: '${weather.data!.date!.hour}:${weather.data!.date!.minute}h ',
                                style:
                                    TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.w600, fontSize: 10),
                                children: [
                                  TextSpan(
                                      text:
                                          '(${weather.data!.sunrise!.hour}:${weather.data!.sunrise!.minute} / ${weather.data!.sunset!.hour}:${weather.data!.sunset!.minute})',
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
                                '${weather.data!.humidity}%',
                                style:
                                    TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.w600, fontSize: 10),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.air,
                                color: Colors.blue,
                                size: 12,
                              ),
                              Text(
                                '${weather.data!.windSpeed}m/s',
                                style:
                                    TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.w600, fontSize: 10),
                              ),
                            ],
                          )
                        ],
                      ),
                      widget.deleting
                          ? Checkbox(
                              value: _isDelete,
                              onChanged: (value) {
                                setState(() {
                                  _isDelete = !_isDelete;
                                });
                                if (widget.isDeleting != null) widget.isDeleting!(value);
                              },
                            )
                          : Container()
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

class WeatherAdd extends StatefulWidget {
  final VoidCallback onTap;
  const WeatherAdd({required this.onTap, Key? key}) : super(key: key);

  @override
  State<WeatherAdd> createState() => _WeatherAddState();
}

class _WeatherAddState extends State<WeatherAdd> {
  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: widget.onTap,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.only(left: 25).copyWith(right: 40),
        height: 71.h,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Icon(Iconsax.add),
      ),
    );
  }
}
