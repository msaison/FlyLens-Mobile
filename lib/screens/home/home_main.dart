// ignore_for_file: diagnostic_describe_all_properties

import 'package:flutter/material.dart';
import 'package:flylens/components/weather_show.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WeatherShow(),
          const SizedBox(height: 20),
          const WeatherShow(
            latitude: -41.286460,
            longitude: 174.776236,
          ),
          const SizedBox(height: 20),
          const WeatherShow(
            latitude: 70.47233000,
            longitude: -68.58987000,
          ),
        ],
      ),
    ));
  }
}
