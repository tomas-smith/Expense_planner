import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  final expenseName = TextEditingController();
  final expenseCost = TextEditingController();
  final Function addExpense;

  NewExpense(this.addExpense);

  void submitExpense() {
    final enteredName = expenseName.text;
    final enteredCost = double.parse(expenseCost.text);

    if (enteredName.isEmpty || enteredCost <= 0) {
      return;
    }
    addExpense(
      enteredName,
      enteredCost,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Item Bought"),
              controller: expenseName,
              onSubmitted: (_) => submitExpense(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Price"),
              controller: expenseCost,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitExpense(),
            ),
            FlatButton(
              onPressed: submitExpense,
              child: Text('Add expense'),
              textColor: Colors.lightGreen,
            )
          ]),
        ));
  }
}
