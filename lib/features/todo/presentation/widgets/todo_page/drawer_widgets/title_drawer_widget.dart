
import 'package:flutter/material.dart';

class TitleDrawerWidget extends StatelessWidget {
  const TitleDrawerWidget({super.key, required this.title, required this.childWidget});
  final String title;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          childWidget
        ],
      ),
    );
  }
}
