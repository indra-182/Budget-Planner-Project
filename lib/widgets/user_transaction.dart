import 'package:expense_tracker_project/models/transaction.dart';
import 'package:expense_tracker_project/widgets/new_transaction.dart';
import 'package:expense_tracker_project/widgets/transaction_list.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactionList = [
    Transaction(
      id: "id1",
      title: "Pay Rent",
      amount: 800000,
      date: DateTime.now(),
    ),
    Transaction(
      id: "id2",
      title: "Pet Food",
      amount: 250000,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, num amount) {
    final newTransaction = Transaction(
        id: Uuid().v4(), title: title, amount: amount, date: DateTime.now());

    setState(() {
      _transactionList.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactionList),
      ],
    );
  }
}
