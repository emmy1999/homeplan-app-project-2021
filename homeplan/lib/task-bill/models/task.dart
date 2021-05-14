import 'package:flutter/material.dart';

class Task {
  final String taskId;
  final String date;
  final String task;
  final String pname;
  final String note;
  final bool status;

  Task({this.date, this.task, this.pname,this.status, this.note, @required this.taskId});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        date: json['date'],
        task: json['task'],
        taskId: json['taskId'],
        pname: json['person'],
        status: json['status'],
        note: json['note']);
    
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'task': task,
      'taskId': taskId,
      'person': pname,
        'status': status,
      'note': note
    
    };
  }
}
