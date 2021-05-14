import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/task.dart';
import 'package:homeplan/task-bill/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CTaskScreen extends StatefulWidget {
  final Task task;

  CTaskScreen({this.task});

  @override
  _CTaskScreenState createState() => _CTaskScreenState();
}

class _CTaskScreenState extends State<CTaskScreen> {
  final taskController = TextEditingController();
  final pnameController = TextEditingController();
  final noteController = TextEditingController();
  final statusController = TextEditingController();
  bool _check = false;

  @override
  void dispose() {
    taskController.dispose();
    pnameController.dispose();
    noteController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    if (widget.task != null) {
      //Edit
      taskController.text = widget.task.task;
      pnameController.text = widget.task.pname;
      noteController.text = widget.task.note;
      taskProvider.loadAll(widget.task);
    } else {
      //Add
      taskProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(formatDate(taskProvider.date, [MM, ' ', d, ', ', yyyy])),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                _pickDate(context, taskProvider).then((value) {
                  if (value != null) {
                    taskProvider.changeDate = value;
                  }
                });
              },
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
           
            TextField(
              decoration: InputDecoration(
                labelText: ' Task Name',
              ),
              onChanged: (String value) => taskProvider.changeTask = value,
              controller: taskController,
            ),
            
            TextField(
              decoration: InputDecoration(
                labelText: 'Name of the Person',
              ),
              onChanged: (String value) => taskProvider.changePname = value,
              controller: pnameController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Note',
              ),
              onChanged: (String value) => taskProvider.changeNote = value,
              controller: noteController,
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime> _pickDate(
      BuildContext context, TaskProvider taskProvider) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: taskProvider.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}
