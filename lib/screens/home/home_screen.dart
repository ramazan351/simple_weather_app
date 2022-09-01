import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_weather_project/constants/colors.dart';
import 'package:simple_weather_project/constants/values.dart';
import 'package:simple_weather_project/custom_paints/button_bg.dart';
import 'package:simple_weather_project/screens/home/head_widget.dart';
import 'package:simple_weather_project/screens/home/hourly_items.dart';
import 'package:simple_weather_project/widgets/my_drawer.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg.png",
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const Expanded(flex: 2, child: WeatherHeadInfos()),
                Expanded(
                    flex: 6,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset("assets/images/house.png"),
                          Positioned.fill(
                            top: size.height * 0.285,
                            bottom: 0,
                            child: ClipRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.4),
                                      border: Border.all(
                                          color: whiteColor.withOpacity(0.5)),
                                      borderRadius: const BorderRadius.only(
                                          topLeft:
                                              Radius.circular(borderRadius),
                                          topRight:
                                              Radius.circular(borderRadius))),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: subTitleText(
                                                  context, "Hourly Forecast"),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: subTitleText(
                                                  context, "Weekly Forecast"),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: whiteColor.withOpacity(0.3),
                                        height: 2,
                                        thickness: 1.5,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: ListView.builder(
                                          itemCount: 7,
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.01),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      size.width * 0.02),
                                              child: const MyHourlyItemWidget(),
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: SvgPicture.asset(
                                                        "assets/images/location_symbol.svg")),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Stack(
                                                  children: [
                                                    LayoutBuilder(
                                                      builder: (context, _) {
                                                        return SizedBox(
                                                          width: _.maxWidth,
                                                          height: 100,
                                                          child: CustomPaint(
                                                            painter:
                                                                ButtonBackgroundPaint(),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Positioned.fill(
                                                      child: Container(
                                                        margin: EdgeInsets.all(
                                                            size.width * 0.05),
                                                        decoration: BoxDecoration(
                                                            color: whiteColor,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                width: 2,
                                                                color:
                                                                    buttonColor)),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: buttonColor,
                                                          size:
                                                              size.width * 0.1,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                    onPressed: () {
                                                      MyDrawer.of(context)
                                                          ?.toggle();
                                                    },
                                                    icon: SvgPicture.asset(
                                                        "assets/images/stars_drawer.svg")),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget subTitleText(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.headline6?.fontSize,
            color: grayColor.withOpacity(0.6)),
      ),
    );
  }
}
