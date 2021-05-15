import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/task.dart';
import 'package:homeplan/task-bill/services/task_db.dart';
import 'package:uuid/uuid.dart';

class TaskProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _task;
  String _taskId;
  String _pname;
  String _note;
  bool _status;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get task => _task;
  String get pname => _pname;
  // String get note => _note;
  Stream<List<Task>> get tasks => firestoreService.getTasks();
 Stream<List<Task>> get tasksc => firestoreService.getcomTasks();
  //Setters
  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changePname(String pname) {
    _pname = pname;
    notifyListeners();
  }

  set changeTask(String task) {
    _task = task;
    notifyListeners();
  }

  set changeNote(String note) {
    _note = note;
    notifyListeners();
  }

  changestatus(bool status) {
    _status = status;
    notifyListeners();
  }

  //Functions
  // this will pass all the values from the database to the form.
  loadAll(Task task) {
    if (task != null) {
      _date = DateTime.parse(task.date);
      _task = task.task;
      _pname = task.pname;
      _note = task.note;
      _taskId = task.taskId;
      _status = task.status;
    } else {
      _date = DateTime.now();
      _task = null;
      _pname = null;
      _taskId = null;
      _note = null;
      _status = false;
    }
  }
// this will insert and update new task.
  saveTask() {
    if (_taskId == null) {
      //Add
      var newTask = Task(
          date: _date.toIso8601String(),
          task: _task,
          pname: _pname,
          status: _status,
          note: _note,
          taskId: uuid.v1());
      print(newTask.task);
      firestoreService.setTask(newTask);
    } else {
      //Edit 
      var updatedTask = Task(
          date: _date.toIso8601String(),
          task: _task,
          pname: _pname,
          status: _status,
          note: _note,
          taskId: _taskId);
      firestoreService.setTask(updatedTask);
    }
  }

// remove the task using id.
  removeTask(String taskId) {
    firestoreService.removeTask(taskId);
  }
}
