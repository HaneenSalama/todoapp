import 'package:flutter/material.dart';
import 'package:todoapp/app_theme.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                    'Play pasketball',
                    style: textTheme.titleMedium?.copyWith(
                      color: AppTheme.Primary,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'task description task description',
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
    );
  }
}
