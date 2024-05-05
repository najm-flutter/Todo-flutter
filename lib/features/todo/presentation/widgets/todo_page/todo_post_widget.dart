import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/features/todo/data/datasources/static/colors_status_image.dart';

class TodoPostWidget extends StatelessWidget {
  const TodoPostWidget(
      {super.key,
      required this.idColorAndImage,
      required this.title,
      required this.month,
      required this.hour,
      this.onTap});
  final int idColorAndImage;
  final String title;
  final String month;
  final String hour;
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
          boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.06), blurRadius: 6, offset: const Offset(0, 1))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _iconStatusTodo(idColorAndImage),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 7, left: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _imageTodo(idColorAndImage),
                  const SizedBox(
                    width: 12,
                  ),
                  _titleTodo(title),
                  const SizedBox(
                    width: 12,
                  ),
                  _time(month, hour, context),
                  Container(
                    width: 74,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      AppColors.white.withOpacity(0),
                      AppColors.white.withOpacity(0.9),
                    ])),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _iconStatusTodo(int id) {
    return SizedBox(
      height: 7,
      width: 7,
      child: CircleAvatar(
        backgroundColor: StaticData.colorsStatusImage[id].colorStatus,
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
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xff181743), fontFamily: "lato", fontSize: 14, overflow: TextOverflow.ellipsis),
        maxLines: 1,
      ),
    );
  }

  Widget _time(String month, String hour, BuildContext context) {
    return SizedBox(
      child: Column(
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
