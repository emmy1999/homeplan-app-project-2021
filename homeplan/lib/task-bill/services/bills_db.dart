import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homeplan/task-bill/models/bills.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //String uid = FirebaseAuth.instance.currentUser.uid;
  //Get Bills
  Stream<List<Bill>> getbills() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('bills')
        .where('paid', isEqualTo: false)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Bill.fromJson(doc.data())).toList());
  }

//get completed Bill
  Stream<List<Bill>> getpaidbills() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('bills')
        .where('paid', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Bill.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setbill(Bill bill) {
    var options = SetOptions(merge: true);

    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('bills')
        .doc(bill.billId)
        .set(bill.toMap(), options);
  }

  //Delete
  Future<void> removebill(String billId) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return _db
        .collection('Users')
        .doc(uid)
        .collection('bills')
        .doc(billId)
        .delete();
  }
}
