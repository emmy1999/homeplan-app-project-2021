import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeplan/task-bill/models/task.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //String uid = FirebaseAuth.instance.currentUser.uid;
  //Get Tasks
  Stream<List<Task>> getTasks() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('tasks')
        .where('status', isEqualTo: false)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }

//get completed task
  Stream<List<Task>> getcomTasks() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('tasks')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setTask(Task task) {
    var options = SetOptions(merge: true);

    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('tasks')
        .doc(task.taskId)
        .set(task.toMap(), options);
  }

  //Delete
  Future<void> removeTask(String taskId) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }
}
