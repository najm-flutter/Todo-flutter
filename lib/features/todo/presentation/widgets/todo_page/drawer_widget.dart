import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todo/core/constant/app_strings.dart';
import 'package:todo/core/functions/show_time_data_piker.dart';
import 'package:todo/features/todo/domain/entities/todo_enti.dart';
import 'package:todo/features/todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/bg_drawer.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widgets/description_form_field.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/button_add_and_done.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widgets/drawer_time_and_data.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widgets/icon_widget.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widgets/name_form_filed.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widgets/title_drawer_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key, required this.scaffoldState});
  final GlobalKey<ScaffoldState> scaffoldState;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int iconIdSelected = 1;
  DateTime initialDate = DateTime.now();
  DateTime initialTime = DateTime.now();
  TextEditingController nameTextCo = TextEditingController();
  TextEditingController descriptionTextCo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BgDrawer(
          childWidget: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? Tittle Drawer
            Text(
              AppStrings.newTask,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            //? List Icons For choose todo Type
            _space30(),
            TitleDrawerWidget(
                title: AppStrings.icon,
                childWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                        5,
                        (index) => IconWidget(
                              index: index,
                              iconIdSelected: iconIdSelected,
                              onTapSelectedIcon: () => setState(() {
                                iconIdSelected = index;
                              }),
                            ))
                  ],
                )),
            //!
            _space18(),
            TitleDrawerWidget(title: AppStrings.name, childWidget: NameFormField(textEditingController: nameTextCo)),
            //!
            _space30(),

            TitleDrawerWidget(
                title: AppStrings.description,
                childWidget: DescriptionFormField(textEditingController: descriptionTextCo)),
            //!
            _space30(),
            DrawerTimeAndData(
                title: AppStrings.data,
                timeOrData: Jiffy.parse(initialDate.toString()).format(pattern: 'd - MMMM - yyyy'),
                onTapIcon: () => showTimeDataPiker(
                      context: context,
                      initialDateTime: initialDate,
                      type: "date",
                      onDateTimeChanged: (p0) => setState(() {
                        initialDate = p0;
                      }),
                    )),
            //!
            _space30(),
            DrawerTimeAndData(
                title: AppStrings.time,
                timeOrData: Jiffy.parse(initialTime.toString()).jm,
                onTapIcon: () => showTimeDataPiker(
                      context: context,
                      initialDateTime: initialTime,
                      type: "time",
                      onDateTimeChanged: (p0) => setState(() {
                        initialTime = p0;
                      }),
                    )),
            //!
            const Spacer(),
            ButtonAddAndDone(
              title: AppStrings.add,
              onTapAdd: () {
                if (nameTextCo.text.isNotEmpty || descriptionTextCo.text.isNotEmpty) {
                  BlocProvider.of<TodoBloc>(context).add(AddTodoEvent(
                      todoEnti: TodoEnti(
                          id: 0,
                          iconId: iconIdSelected,
                          isDone: 0,
                          title: nameTextCo.text,
                          description: descriptionTextCo.text,
                          time:
                              //!for Marge Date And Time like [1997-09-23 11:18:12.946621] And use it in [TodoPostsWidget]
                              "${Jiffy.parse(initialDate.toString()).format(pattern: 'yyyy-MM-dd')} ${Jiffy.parse(initialDate.toString()).format(pattern: 'HH:mm:ss.SSS')}")));
                  widget.scaffoldState.currentState!.closeEndDrawer();
                }
              },
            )
          ],
        ),
      )),
    );
  }

  Widget _space18() {
    return const SizedBox(
      height: 18,
    );
  }

  Widget _space30() {
    return const SizedBox(
      height: 30,
    );
  }

  @override
  void dispose() {
    nameTextCo.dispose();
    descriptionTextCo.dispose();
    super.dispose();
  }
}
