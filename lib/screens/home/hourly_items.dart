import 'package:flutter/material.dart';
import 'package:simple_weather_project/const_values/colors.dart';

class MyHourlyItemWidget extends StatelessWidget {
  const MyHourlyItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01, vertical: size.height * 0.02),
      decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: 1),
          borderRadius: BorderRadius.circular(46)),
      child: Column(
        children: [
          infoText(context, "09 AM"),
          Image.asset("assets/images/MoonCloudMidRain.png"),
          infoText(context, "32"),
        ],
      ),
    );
  }

  Text infoText(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(color: whiteColor, fontSize: 16),
    );
  }
}
