import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/widgets/default_elevated_button.dart';
import 'package:todoapp/widgets/default_text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextStyle? titleMediumStyle = Theme.of(context).textTheme.titleMedium;
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.5,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Add new task',
                style: titleMediumStyle,
              ),
              SizedBox(height: 16),
              DefaultTextFormField(
                controller: titleController,
                hintText: 'Enter text title',
                validator: (value) {
                  //value?.trim();
                  if (value == null || value.trim().isEmpty) {
                    return 'Title can not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DefaultTextFormField(
                controller: descriptionController,
                hintText: 'Enter text description',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'description can not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Select data',
                style: titleMediumStyle?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    initialDate: selectedDate,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                  );
                  if (dateTime != null && dateTime != selectedDate) {
                    print('object');
                    selectedDate == dateTime;
                    setState(() {});
                  }
                },
                child: Text(dateFormat.format(selectedDate)),
              ),
              SizedBox(height: 32),
              DefaultElevatedButton(
                label: 'Add',
                onPresed: () {
                  if (formKey.currentState!.validate()) {
                    addTask();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {
    print('AddTask called');
  }
}
