import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_strings.dart';
import 'package:uicons/uicons.dart';

class AppBarDoneTodo extends StatelessWidget {
  const AppBarDoneTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  UIcons.solidRounded.angle_left,
                  size: 20,
                  color: AppColors.gray,
                )),
          )),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                AppStrings.dONETASKS,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
