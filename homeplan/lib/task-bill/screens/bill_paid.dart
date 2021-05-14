import 'package:flutter/material.dart';
import 'package:homeplan/task-bill/models/bills.dart';
import 'package:homeplan/task-bill/providers/bills_provider.dart';
import 'package:homeplan/task-bill/screens/each_bill_paid.dart';
import 'package:provider/provider.dart';
import 'package:homeplan/nav_bar.dart';


class Bill_paid extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    return Scaffold(
      drawer: NavBar(),
      appBar:
          AppBar(title: Text('Bills Paid'), backgroundColor: Color(0x33acdef8)),
      body: StreamBuilder<List<Bill>>(
          stream: billProvider.billsp,
          builder: (context, snapshot) {
         
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(12),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                     
                      title: Text(snapshot.data[index].pname),
                      subtitle: Text(snapshot.data[index].bill),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BillpScreen(bill: snapshot.data[index])));
                      },
                    );
                  });
           
          }),
    
    );
  }
}
