import './widgets/expense_list.dart';
import './widgets/new_expense.dart';
import './models/expenses.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startNewExpense(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(onTap: () {},
            child: NewExpense(_newExpense),
            behavior: HitTestBehavior.opaque) ;
        });
  }

  final List<Expenses> _userExpenses = [
    Expenses(
      id: '1',
      title: 'shirt',
      money: 20.99,
      date: DateTime.now(),
    ),
    Expenses(
      id: '2',
      title: 'food',
      money: 5.99,
      date: DateTime.now(),
    ),
  ];

  void _newExpense(String title, double amount) {
    final newTX = Expenses(
      title: title,
      money: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userExpenses.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_alarm),
              onPressed: () => _startNewExpense(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
            ExpenseList(_userExpenses)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewExpense(context),
      ),
    );
  }
}
