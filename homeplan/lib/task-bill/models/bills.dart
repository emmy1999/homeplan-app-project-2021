import 'package:flutter/material.dart';
// this is the model of the firebase database.
class Bill {
  final String billId;
  final String date;
  final String bill;
  final String pname;
  final String note;
  final String price;

  final bool paid;

  Bill({this.date, this.bill, this.pname,this.paid,this.price, this.note, @required this.billId});
// converting the data from database from json and mapping to the bill
  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
        date: json['date'],
        bill: json['bill'],
        billId: json['billId'],
        pname: json['person'],
        paid: json['paid'],
        price: json['price'],
        note: json['note']);
    
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'bill': bill,
      'billId': billId,
      'person': pname,
        'paid': paid,
        'price': price,
      'note': note
    
    };
  }
}
