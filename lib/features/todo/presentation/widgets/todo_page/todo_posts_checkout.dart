import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:uicons/uicons.dart';

class TodoPostsCheckout extends StatelessWidget {
  const TodoPostsCheckout({
    super.key,
    required this.visibleIconCheck,
    this.onTap,
  });
  final bool visibleIconCheck;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _bg(SizedBox(
        child: Container(
          height: 27,
          width: 27,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.bgGrandentTop.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.iconDoneBgGrandentTop.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
              ]),
          child: _checkIcon(),
        ),
      )),
    );
  }

  Widget _bg(Widget widget) {
    return Container(
      width: 74,
      height: double.maxFinite,
      alignment: AlignmentDirectional.centerEnd,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(colors: [
            AppColors.white.withOpacity(0),
            AppColors.white,
          ])),
      child: widget,
    );
  }

  Widget _checkIcon() {
    return Visibility(
      visible: visibleIconCheck,
      child: Center(
        child: SizedBox(
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.iconDoneBgGrandentTop, AppColors.iconDoneBgGrandentDown]).createShader(bounds);
            },
            child: Icon(
              UIcons.boldStraight.check,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}
