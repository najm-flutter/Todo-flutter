import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({super.key, required this.textEditingController});

  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.maxFinite,
      child: TextFormField(
        maxLines: 5,
        controller: textEditingController,
        style: TextStyle(fontSize: 14, color: AppColors.bgGrandentTop),
        cursorHeight: 20,
        cursorColor: AppColors.bgGrandentTop.withOpacity(0.4),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white.withOpacity(0.8),
            contentPadding: const EdgeInsets.all(7),
            isDense: true,
            hintText: 'Add description for you to do',
            hintStyle: const TextStyle(fontSize: 12),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.bgGrandentTop.withOpacity(0.2))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.bgGrandentTop.withOpacity(0.2)))),
      ),
    );
  }
}