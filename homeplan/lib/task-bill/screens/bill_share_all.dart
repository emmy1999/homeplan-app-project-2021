import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/bills.dart';
import 'package:homeplan/task-bill/providers/bills_provider.dart';
import 'package:homeplan/task-bill/screens/bill_share_edit.dart';
import 'package:provider/provider.dart';
import 'package:homeplan/nav_bar.dart';

class Bill_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(title: Text('Bills'), backgroundColor: Color(0x33acdef8)),
      body: StreamBuilder<List<Bill>>(
          stream: billProvider.bills,
          builder: (context, snapshot) {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(12),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing:
                        Icon(Icons.edit, color: Theme.of(context).accentColor),
                    title: Text(snapshot.data[index].pname),
                    subtitle: Text(snapshot.data[index].bill),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              BilleScreen(bill: snapshot.data[index])));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BilleScreen()));
        },
      ),
    );
  }
}
