import 'package:flutter/material.dart';

import 'package:homeplan/task-bill/providers/task_provider.dart';
import 'package:homeplan/task-bill/screens/complete_task.dart';
import 'package:provider/provider.dart';
// this widget is used to call the completed task screen.
class Comptasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
          home: Task_comp(),
          theme: ThemeData(
            
 
          )),
    );
  }
}
