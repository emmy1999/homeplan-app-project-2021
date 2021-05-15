import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/task.dart';
import 'package:homeplan/task-bill/providers/task_provider.dart';
import 'package:homeplan/task-bill/screens/tasks.dart';
import 'package:provider/provider.dart';
import 'package:homeplan/nav_bar.dart';

class Task_view extends StatelessWidget {
  @override
    bool loading = false;
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    // this is the task screen which display all the user created task from the database using stream builder.
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(title: Text('Task'), backgroundColor: Color(0x33acdef8)),
      body: StreamBuilder<List<Task>>(
          stream: taskProvider.tasks,
          builder: (context, snapshot) {
                  
        
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(12),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Icon(Icons.edit,
                          color: Theme.of(context).accentColor),
                      title: Text(snapshot.data[index].pname),
                      subtitle: Text(snapshot.data[index].task),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                TaskScreen(task: snapshot.data[index])));
                      },
                    );
                  });
            
           
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TaskScreen()));
        },
      ),
    );
  }
}
