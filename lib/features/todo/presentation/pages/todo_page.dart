import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_route.dart';
import 'package:todo/features/todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/app_bar_widget.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/bg_bottom_bar.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/bg_widget.dart';
import 'package:todo/features/todo/presentation/widgets/public/dialog_widget.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/drawer_widget.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/main_bottom_bar.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/second_bottom_bar.dart';
import 'package:todo/features/todo/presentation/widgets/todo_page/todo_post_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //!For Swith by mainBottonBar and secondBottomBar
  int showNumber = 0;
  //! For get all todo posts id for Update Posts from todo to doneTodo 
  List<int> idPostsForUpdate = [];
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      endDrawer: DrawerWidget(
        scaffoldState: scaffoldState,
      ),
      body: _bodyBuilder(),
    );
  }

  Widget _bodyBuilder() {
    return
    //? BgWidget to make background For this page
     BgWidget(
        childWidget: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              AppBarWidget(
                onTapIcon: () => Navigator.of(context).pushNamed(AppRoute.done),
              ),
              //! List Builder todo Posts
              _todoListBuilder(),
            ],
          ),
        ),
        //? BgWidget to make background For bottomBar For more info show desing  
        BgBottomBar(
          //? for switch between MainBottomBar And secondBottomBar  with animation
            widget: AnimatedSwitcher(
                duration: Durations.medium1,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: showNumber == 1
                    ? SecondBottomBar(
                       //! update Posts to DoneTodo by id Post 
                        onTapsubmet: () async {
                          if (idPostsForUpdate.isNotEmpty) {
                            BlocProvider.of<TodoBloc>(context).add(UpdateTodoEvent(idsTodo: idPostsForUpdate));
                          }
                        },
                        onTapClose: () => setState(() {
                          showNumber = 0;
                        }),
                      )
                    : MainBottomBar(
                        onTapAdd: () => scaffoldState.currentState!.openEndDrawer(),
                        key: const ValueKey(2),
                        onTapDone: () => setState(() {
                          showNumber = 1;
                        }),
                      )))
      ],
    ));
  }

  Widget _todoListBuilder() {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is LoadedTodoState) {
          setState(() {
            //! On loaded Clear idPostsForUpdate To remove Old ids updated 
            idPostsForUpdate.clear();
             //! Change  showNumber to 0 for return to mainBottomBar
            showNumber = 0;
          });
        }
      },
      builder: (context, state) {
        if (state is LoadingTodoState) {
          return 
          //!on Loading
          Expanded(
              child: Center(
            child: CircularProgressIndicator(
              color: AppColors.bgGrandentTop.withOpacity(0.3),
            ),
          ));
          //!
        } else if (state is ErrorTodoState) {
          //!
          return const Text("NO DATA");
        } else if (state is LoadedTodoState) {
          //! list Posts
          return Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return index != state.todoList!.length
                      ? TodoPostWidget(
                          ids: idPostsForUpdate /** for use It to check if todo post is selected or unSelected by id */,
                          todoEnti: state.todoList![index],
                          showNumber: showNumber  /** for  show checkBox on switch to secondBottomBar*/,
                          onTapCheckOut: () {
                            setState(() {
                              //! Select And unSelect  todo posts by id
                              idPostsForUpdate.contains(state.todoList![index].id)
                                  ? idPostsForUpdate.remove(state.todoList![index].id)
                                  : idPostsForUpdate.add(state.todoList![index].id!);
                            });
                          },
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return DialogMoreWidget(todoEnti: state.todoList![index]);
                            },
                          ),
                        )
                         /** for Add space in the End list */
                      : const SizedBox(
                          height: 200,
                        );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: state.todoList!.isNotEmpty ? state.todoList!.length + 1 : 0 /** for Add space in the End list */),
          );
        }
        return const SizedBox();
      },
    );
  }
}
