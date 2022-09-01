import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_weather_project/constants/colors.dart';
import 'package:simple_weather_project/constants/values.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.child});
  final Widget child;
  static _MyDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyDrawerState>();
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _animationController;
  bool isDragging = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void openDrawer() => _animationController.forward();
  void closeDrawer() => _animationController.reverse();
  void toggle() {
    if (_animationController.isCompleted) {
      closeDrawer();
      return;
    }
    openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double maxSlideValue = -MediaQuery.of(context).size.width * 0.25;
    return GestureDetector(
      onHorizontalDragStart: (details) => isDragging = true,
      onHorizontalDragUpdate: (details) {
        if (!isDragging) return;
        const delta = 11;
        if (details.delta.dx > delta) {
          closeDrawer();
        } else if (details.delta.dx < -delta) {
          openDrawer();
        }
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, __) {
            double translateValue = maxSlideValue * _animationController.value;
            double scaleteValue = 1 - (_animationController.value * .3);
            double borderValue = borderRadius * _animationController.value;
            return Stack(
              children: [
                const MyCustomDrawer(),
                Transform(
                    alignment: Alignment.centerLeft,
                    transform: Matrix4.identity()
                      ..translate(translateValue)
                      ..scale(scaleteValue),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderValue),
                        child: widget.child)),
              ],
            );
          }),
    );
  }
}

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
