import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/constant/app_colors.dart';

  void showTimeDataPiker({required BuildContext context, required DateTime initialDateTime ,required String type, required void Function(DateTime) onDateTimeChanged}) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Dialog(
              backgroundColor: AppColors.white,
              insetPadding: EdgeInsets.all(0),
              child: SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: type == "time" ? CupertinoDatePickerMode.time : CupertinoDatePickerMode.date ,
                  initialDateTime: initialDateTime,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              )),
        );
      },
    );
  }