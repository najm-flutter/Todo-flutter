import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({super.key, required this.textEditingController});

  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: TextFormField(
        controller: textEditingController,
        style: TextStyle(fontSize: 14, color: AppColors.bgGrandentTop),
        cursorHeight: 20,
        cursorColor: AppColors.bgGrandentTop.withOpacity(0.4),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 3, bottom: 7),
            isDense: true,
            hintText: 'Add name for you to do',
            hintStyle: const TextStyle(fontSize: 12),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.bgGrandentDown.withOpacity(0.3), width: 1)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.bgGrandentDown.withOpacity(0.5), width: 1.5))),
      ),
    );
  }
}