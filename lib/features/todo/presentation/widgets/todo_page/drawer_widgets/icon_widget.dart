import 'package:flutter/material.dart';
import 'package:todo/features/todo/data/datasources/static/colors_status_image.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.index, required this.iconIdSelected, this.onTapSelectedIcon});
  final int index;
  final int iconIdSelected;
  final void Function()? onTapSelectedIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      margin: EdgeInsets.only(right: index == StaticData.colorsStatusImage.length - 1 ? 0 : 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconIdSelected == index ? _iconStatusSelected() : const SizedBox(),
          Stack(
            alignment: Alignment.center,
            children: [
              iconIdSelected == index ? _bgIconOnSelected() : const SizedBox(),
              _icon(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconStatusSelected() {
    return SizedBox(
      height: 5,
      width: 5,
      child: CircleAvatar(
        backgroundColor: StaticData.colorsStatusImage[index].colorStatus,
      ),
    );
  }

  Widget _bgIconOnSelected() {
    return SizedBox(
      height: 32,
      width: 32,
      child: CircleAvatar(
        backgroundColor: StaticData.colorsStatusImage[index].colorStatus.withOpacity(0.12),
      ),
    );
  }

  Widget _icon() {
    return SizedBox(
      height: 28,
      width: 28,
      child: InkWell(
        onTap: onTapSelectedIcon,
        child: CircleAvatar(
          backgroundImage: AssetImage(StaticData.colorsStatusImage[index].images),
        ),
      ),
    );
  }
}
