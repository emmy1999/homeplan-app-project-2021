import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/bills.dart';
import 'package:homeplan/task-bill/providers/bills_provider.dart';
import 'package:provider/provider.dart';

class BilleScreen extends StatefulWidget {
  final Bill bill;

  BilleScreen({this.bill});

  @override
  _BilleScreenState createState() => _BilleScreenState();
}
// declaring the controller.
class _BilleScreenState extends State<BilleScreen> {
  final billController = TextEditingController();
  final pnameController = TextEditingController();
  final noteController = TextEditingController();
  final priceController = TextEditingController();
  final paidController = TextEditingController();
  bool _check = false;// this will check if the bill is paid or not.

  String billnchk, pnamechk, notechk, pricechk;
// declaring the string 
  @override
  void dispose() {
    // disposing the controller.
    billController.dispose();
    pnameController.dispose();
    noteController.dispose();
    priceController.dispose();
    paidController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    //  
    final billProvider = Provider.of<BillProvider>(context, listen: false);
    if (widget.bill != null) {
      //Edit
      // setting the values from the provider to controller to edit.
      billController.text = widget.bill.bill;
      pnameController.text = widget.bill.pname;
      noteController.text = widget.bill.note;
      priceController.text = widget.bill.price;

      billProvider.loadAll(widget.bill);
    } else {
      //Add
      // setting all value to null if we are adding.
      billProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // getting the date from the controller.
          title: Text(formatDate(billProvider.date, [MM, ' ', d, ', ', yyyy])),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                // 
                _pickDate(context, billProvider).then((value) {
                  if (value != null) {
                    billProvider.changeDate = value;
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
                labelText: ' Bill Name',
              ),
              onChanged: (String value) =>
                  billProvider.changeBill = value ,
              controller: billController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name of the Person',
              ),
              onChanged: (String value) =>
                  billProvider.changePname = value ,
              controller: pnameController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Note',
              ),
              onChanged: (String value) =>
                  billProvider.changeNote = value ,
              controller: noteController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Share Price',
              ),
              onChanged: (String value) =>
                  billProvider.changeprice = value ,
              controller: priceController,
            ),
            CheckboxListTile(
              activeColor: Colors.yellow,
              checkColor: Colors.blue,
              title: Text("Paid"),
              controlAffinity: ListTileControlAffinity.platform,
              value: _check,
              onChanged: (bool value) {
                setState(() {
                  _check = value;
                });
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Save', style: TextStyle(color: Colors.white)),
              onPressed: () {
              
                 billProvider.changepaid(_check);
                billProvider.saveBill();

                Navigator.of(context).pop();
              },
            ),
            (widget.bill != null)
                ? RaisedButton(
                    color: Colors.red,
                    child:
                        Text('Delete', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      billProvider.removebill(widget.bill.billId);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<DateTime> _pickDate(
      BuildContext context, BillProvider billProvider) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: billProvider.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}
