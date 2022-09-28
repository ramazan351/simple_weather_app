import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_weather_project/constants/colors.dart';
import 'package:simple_weather_project/constants/values.dart';
import 'package:simple_weather_project/screens/app_drawer/custom_drawer.dart';

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
  bool isDrawerOpen = false;
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

  void openDrawer() {
    _animationController.forward();
    isDrawerOpen = true;
  }

  void closeDrawer() {
    _animationController.reverse();
    isDrawerOpen = false;
  }

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
                    child: GestureDetector(
                      onTap: () {
                        if (isDrawerOpen) {
                          closeDrawer();
                        }
                      },
                      child: AbsorbPointer(
                        absorbing: isDrawerOpen,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(borderValue),
                            child: widget.child),
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
