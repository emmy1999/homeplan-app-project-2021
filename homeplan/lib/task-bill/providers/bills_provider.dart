import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/bills.dart';
import 'package:homeplan/task-bill/services/bills_db.dart';
import 'package:uuid/uuid.dart';


// this is the provider class which act between the the front end and the backend for database interaction


class BillProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _bill;
  String _billId;
  String _pname;
  String _note;
  String _price;
  bool _paid;
  var uuid = Uuid();// get unique id using the package.

  //Getters 
  DateTime get date => _date;
  String get bill => _bill;
  String get pname => _pname;
  String get price => price;
  // String get note => _note;
  // stream for all bills
  Stream<List<Bill>> get bills => firestoreService.getbills();
  // stream for paid bills.
  Stream<List<Bill>> get billsp => firestoreService.getpaidbills();
  //Setters
  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changePname(String pname) {
    _pname = pname;
    notifyListeners();
  }

  set changeBill(String bill) {
    _bill = bill;
    notifyListeners();
  }

  set changeNote(String note) {
    _note = note;
    notifyListeners();
  }

  set changeprice(String price) {
    _price = price;
    notifyListeners();
  }

  changepaid(bool paid) {
    _paid = paid;
    notifyListeners();
  }

  //Functions
  loadAll(Bill bill) {
    if (bill != null) {
      _date = DateTime.parse(bill.date);
      _bill = bill.bill;
      _pname = bill.pname;
      _note = bill.note;
      _billId = bill.billId;
      _price = bill.price;
      _paid = bill.paid;
    } else {
      _date = DateTime.now();
      _bill = null;
      _pname = null;
      _billId = null;
      _note = null;
      _paid = false;
      _price = null;
    }
  }

  saveBill() {
    if (_billId == null) {
      //Add
      var newBill = Bill(
          date: _date.toIso8601String(),
          bill: _bill,
          pname: _pname,
          paid: _paid,
          price: _price,
          note: _note,
          billId: uuid.v1());
      print(newBill.bill);
      firestoreService.setbill(newBill);
    } else {
      //Edit
      var updatedBill = Bill(
          date: _date.toIso8601String(),
          bill: _bill,
          pname: _pname,
          paid: _paid,
          price: _price,
          note: _note,
          billId: _billId);
      firestoreService.setbill(updatedBill);
    }
  }
// remove a bill with the unique bill id.
  removebill(String billId) {
    firestoreService.removebill(billId);
  }
}
