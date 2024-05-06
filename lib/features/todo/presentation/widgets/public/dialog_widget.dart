import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_strings.dart';
import 'package:todo/features/todo/data/datasources/static/colors_status_image.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/button_add_and_done.dart';

class DialogMoreWidget extends StatelessWidget {
  const DialogMoreWidget({super.key, required this.todoEnti});
  final TodoEnti todoEnti;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF000000).withOpacity(0),
      insetPadding: const EdgeInsets.all(0),
      child: SizedBox(
        child: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [PartTopOfDialog(todoEnti: todoEnti), PartDownOfDialog(todoEnti: todoEnti)],
          ),
        ),
      ),
    );
  }
}

class PartTopOfDialog extends StatelessWidget {
  const PartTopOfDialog({super.key, required this.todoEnti});
  final TodoEnti todoEnti;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: 123,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.bgGrandentTop.withOpacity(0.02),
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          const SizedBox(
            height: 16,
          ),
          _title(context),
          const SizedBox(
            width: 5,
          ),
          _dateTime(context)
        ],
      ),
    );
  }

  Widget _icon() {
    return SizedBox(
      height: 28,
      child: Image.asset(StaticData.colorsStatusImage[todoEnti.iconId].images),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      todoEnti.title,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: 1,
    );
  }

  Widget _dateTime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Jiffy.parse(todoEnti.time).MMMd,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          Jiffy.parse(todoEnti.time).jm,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
        )
      ],
    );
  }
}

class PartDownOfDialog extends StatelessWidget {
  const PartDownOfDialog({super.key, required this.todoEnti});
  final TodoEnti todoEnti;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          AppStrings.description,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w900),
        ),
        _descriptionContent(context),
        ButtonAddAndDone(
          title: AppStrings.done,
          onTapAdd: () => Navigator.of(context).pop(),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _descriptionContent(BuildContext context) {
    return Container(
      height: 107,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 29),
      child: SingleChildScrollView(
        child: Text(
          todoEnti.description,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
