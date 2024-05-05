import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_image.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.onTapIcon});
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      alignment: Alignment.bottomCenter,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              "TODO",
              style: TextStyle(fontFamily: "baloo", fontSize: 20, color: AppColors.bgGrandentTop),
            ),
          )),
          Expanded(
              child: Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: InkWell(onTap: onTapIcon, child: SizedBox(height: 15, child: Image.asset(AppImages.appBarIcon))),
          )),
        ],
      ),
    );
  }
}
