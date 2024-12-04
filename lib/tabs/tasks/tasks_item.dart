import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_theme.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/tabs/tasks/tasks_provider.dart';
import 'package:todoapp/widgets/firebase_functions.dart';

class TaskItem extends StatelessWidget {
  TaskItem({required this.task});
  TaskModel task;
  //
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (_) {
                FirebaseFunctions.DeleteTaskFromFirestore(task.id)
                    .timeout(Duration(microseconds: 100), onTimeout: () {
                  Provider.of<TasksProvider>(context, listen: false).getTasks();
                }).catchError((_) {
                  Fluttertoast.showToast(
                    msg: "Something went wrong",
                    toastLength: Toast.LENGTH_LONG,
                    timeInSecForIosWeb: 5,
                    backgroundColor: AppTheme.red,
                  );
                });
              },
              backgroundColor: AppTheme.red,
              foregroundColor: AppTheme.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 62,
                    width: 4,
                    margin: const EdgeInsetsDirectional.only(end: 12),
                    color: AppTheme.Primary,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppTheme.Primary,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        task.description,
                        style: textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 34,
                width: 69,
                decoration: BoxDecoration(
                  color: AppTheme.Primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.check,
                  color: AppTheme.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
