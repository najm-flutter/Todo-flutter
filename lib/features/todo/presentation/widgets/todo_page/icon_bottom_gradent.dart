import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';

class IconBottomGradent extends StatelessWidget {
  const IconBottomGradent(
      {super.key, required this.topGrandient, required this.bottomGrandient, required this.iconData, this.onTap});
  final Color topGrandient;
  final Color bottomGrandient;
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: topGrandient.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 3))],
            gradient: LinearGradient(
                begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [topGrandient, bottomGrandient])),
        child: Center(
          child: Icon(
            iconData,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
