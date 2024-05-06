import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/features/todo/data/datasources/static/colors_status_image.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:uicons/uicons.dart';

class DoneTodoPostWidget extends StatelessWidget {
  const DoneTodoPostWidget({super.key, this.onTap, required this.todoEnti});
  final TodoEnti todoEnti;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        width: double.maxFinite,
        height: 52,
        decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(color: AppColors.black.withOpacity(0.06), blurRadius: 6, offset: const Offset(0, 1))
            ]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _iconStatusTodo(todoEnti.iconId),
                Container(margin: const EdgeInsets.only(left: 7, right: 12), child: _imageTodo(todoEnti.iconId)),
              ],
            ),
            _titleTodo(todoEnti.title),
            _time(Jiffy.parse(todoEnti.time).MMMd, Jiffy.parse(todoEnti.time).jm, context)
          ],
        ));
  }

  Widget _iconStatusTodo(int id) {
    return SizedBox(
      height: 7,
      width: 7,
      child: Icon(
        UIcons.solidRounded.checkbox,
        size: 9,
        color: StaticData.colorsStatusImage[id].colorStatus,
      ),
    );
  }

  Widget _imageTodo(int id) {
    return SizedBox(
      height: 28,
      width: 28,
      child: CircleAvatar(
        backgroundImage: AssetImage(StaticData.colorsStatusImage[id].images),
      ),
    );
  }

  Widget _titleTodo(String title) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
              color: Color(0xff181743), fontFamily: "lato", fontSize: 14, overflow: TextOverflow.ellipsis),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _time(String month, String hour, BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            hour,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
