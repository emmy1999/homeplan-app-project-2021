import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/task.dart';
import 'package:homeplan/task-bill/providers/task_provider.dart';
import 'package:homeplan/task-bill/screens/each_ctask.dart';
import 'package:provider/provider.dart';
import 'package:homeplan/nav_bar.dart';

class Task_comp extends StatelessWidget {
  @override
  // this widget will get all the completed task from the database stra, and dispay in in the screen.
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          title: Text('Completed Task'), backgroundColor: Color(0x33acdef8)),
      body: StreamBuilder<List<Task>>(
          stream: taskProvider.tasksc,
          builder: (context, snapshot) {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(12),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].pname),
                    subtitle: Text(snapshot.data[index].task),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CTaskScreen(task: snapshot.data[index])));
                    },
                  );
                });
          }),
    );
  }
}
