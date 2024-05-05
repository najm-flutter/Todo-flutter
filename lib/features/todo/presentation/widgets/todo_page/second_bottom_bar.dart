import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/icon_bottom_gradent.dart';

class SecondBottomBar extends StatelessWidget {
  const SecondBottomBar({super.key, this.onTapClose, this.onTapsubmet});
 final void Function()? onTapClose ;
 final void Function()? onTapsubmet ;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(1),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconBottomGradent(
              onTap: onTapClose,
              topGrandient: AppColors.bgGrandentTop,
              bottomGrandient: AppColors.iconCancelBgGrandentDown,
              iconData: Icons.close_rounded),
          const SizedBox(
            width: 46,
          ),
          IconBottomGradent(
            onTap:onTapsubmet ,
              topGrandient: AppColors.iconDoneBgGrandentTop,
              bottomGrandient: AppColors.iconDoneBgGrandentDown,
              iconData: Icons.done_all_rounded),
        ],
      ),
    );
  }
}
