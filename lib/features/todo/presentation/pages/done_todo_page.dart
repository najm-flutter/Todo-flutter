import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/features/todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:todo/features/todo/presentation/widgets/done_todo_page/app_bar_done_todo.dart';
import 'package:todo/features/todo/presentation/widgets/done_todo_page/done_todo_posts_widget.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/bg_widget.dart';
import 'package:todo/features/todo/presentation/widgets/public/dialog_widget.dart';

class DoneTodoPage extends StatelessWidget {
  const DoneTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(context),
    );
  }

  Widget _bodyBuilder(BuildContext context) {
    return BgWidget(
        childWidget: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              const AppBarDoneTodo(),
              _todoListBuilder(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _todoListBuilder() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is LoadingTodoState) {
          return Expanded(
              child: Center(
            child: CircularProgressIndicator(
              color: AppColors.bgGrandentTop.withOpacity(0.3),
            ),
          ));
        } else if (state is ErrorTodoState) {
          return const Text("NO DATA");
        } else if (state is LoadedTodoState) {
          return Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return index != state.todoList!.length
                      ? DoneTodoPostWidget(
                          todoEnti: state.todoList![index],
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return DialogMoreWidget(todoEnti: state.todoList![index]);
                            },
                          ),
                        )
                      : const SizedBox(
                          height: 20,
                        );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: state.todoList!.isNotEmpty ? state.todoList!.length + 1 : 0),
          );
        }
        return const SizedBox();
      },
    );
  }
}
