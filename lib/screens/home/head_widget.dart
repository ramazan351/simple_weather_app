import 'package:flutter/material.dart';
import 'package:simple_weather_project/const_values/colors.dart';

class WeatherHeadInfos extends StatelessWidget {
  const WeatherHeadInfos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Gaziantep",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline4?.fontSize,
              color: whiteColor),
        ),
        Text(
          "19°",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline2?.fontSize,
              fontWeight: FontWeight.w300,
              color: whiteColor),
        ),
        Text(
          "Çoğunlukla açık",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline5?.fontSize,
              color: grayColor.withOpacity(0.6)),
        ),
        Text(
          "H:32° L:18°",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline4?.fontSize,
              color: whiteColor),
        )
      ],
    );
  }
}
