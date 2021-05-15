import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/bills.dart';
import 'package:homeplan/task-bill/providers/bills_provider.dart';
import 'package:homeplan/task-bill/screens/bill_share_edit.dart';
import 'package:provider/provider.dart';
import 'package:homeplan/nav_bar.dart';

class Bill_view extends StatelessWidget {
  @override
  // this widget show all the bills from the database.
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    return Scaffold(
      drawer: NavBar(),
      // this is a app bar to display the text Bills on top of the screen.
      appBar: AppBar(title: Text('Bills'), backgroundColor: Color(0x33acdef8)),
      // this is a stream builder used to build the list data from the database.
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
                      Navigator.of(context).push(MaterialPageRoute( // this will push the selected data to the edit page to edit the information.
                          builder: (context) =>
                              BilleScreen(bill: snapshot.data[index])));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {// this is add buttton to create a new bill.
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BilleScreen()));
        },
      ),
    );
  }
}
