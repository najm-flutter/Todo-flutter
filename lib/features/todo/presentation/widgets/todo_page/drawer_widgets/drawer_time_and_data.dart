import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widgets/title_drawer_widget.dart';

class DrawerTimeAndData extends StatelessWidget {
  const DrawerTimeAndData({super.key, required this.title, required this.timeOrData, this.onTapIcon});

  final String title;
  final String timeOrData;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return TitleDrawerWidget(
        title: title,
        // ignore: avoid_unnecessary_containers
        childWidget: Container(
          child: InkWell(
            splashColor: AppColors.white.withOpacity(0),
            onTap: onTapIcon,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(timeOrData), const Icon(Icons.arrow_drop_down)],
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.bgGrandentTop.withOpacity(0.12),
                )
              ],
            ),
          ),
        ));
  }
}
