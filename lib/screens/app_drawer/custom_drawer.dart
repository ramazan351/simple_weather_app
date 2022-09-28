import 'package:flutter/material.dart';
import 'package:simple_weather_project/constants/colors.dart';
import 'package:simple_weather_project/constants/values.dart';

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({super.key});
//Todo: make a snow effect with circular paints
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: primaryColor,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text.rich(
                TextSpan(text: "Çarşamba", children: [
                  TextSpan(text: "\n"),
                  TextSpan(
                    text: "9 | Aralık",
                    style: TextStyle(
                        color: grayColor.withOpacity(0.6),
                        fontSize:
                            Theme.of(context).textTheme.headline3?.fontSize),
                  )
                ]),
                style: TextStyle(
                    color: whiteColor,
                    fontSize: Theme.of(context).textTheme.headline3?.fontSize),
                textAlign: TextAlign.center,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.5),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius)),
                    textColor: whiteColor,
                    title: Text(cities[index % cities.length]),
                    trailing:
                        Image.asset("assets/images/moon_cloud_mid_rain.png"),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

List<String> cities = ["İstanbul", "Ankara", "İzmir", "Adana", "Şanlıurfa"];
