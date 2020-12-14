import 'package:flutter/material.dart';
import '../models/expenses.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final List<Expenses> expenses;

  ExpenseList(this.expenses);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (cexpense, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text('\£ ${expenses[index].money.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      expenses[index].title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat().format(expenses[index].date),
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        )),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: expenses.length,
      ),
    );
  }
}
