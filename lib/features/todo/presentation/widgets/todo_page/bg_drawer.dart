import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_image.dart';

class BgDrawer extends StatelessWidget {
  const BgDrawer({super.key, required this.childWidget});
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [_bgImage(), _filter(height), childWidget],
      ),
    );
  }

  Widget _bgImage() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.bgGrandentTop.withOpacity(0.03), AppColors.bgGrandentDown.withOpacity(0.03)]),
          image: DecorationImage(image: AssetImage(AppImages.bgDrawer), fit: BoxFit.cover)),
    );
  }

  Widget _filter(double height) {
    return Container(
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
        const Color(0xffffffff),
        AppColors.filterColor.withOpacity(0.0),
      ])),
    );
  }
}
