import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';

class ButtonAddAndDone extends StatelessWidget {
  const ButtonAddAndDone({super.key, this.onTapAdd, required this.title});
  final void Function()? onTapAdd ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAdd ,
      child: Container(
        height: 45,
        width: 132,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: AppColors.iconAddBgGrandentTop.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 3))
            ],
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [AppColors.iconAddBgGrandentTop, AppColors.iconAddBgGrandentDown])),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: AppColors.white, fontSize: 16),
        )),
      ),
    );
  }
}
