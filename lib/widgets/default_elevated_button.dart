import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/app_theme.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({required this.label, required this.onPresed});
  String label;
  VoidCallback onPresed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPresed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 52),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppTheme.white,
            ),
      ),
    );
  }
}
