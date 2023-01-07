import 'package:expense_tracker_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: Colors.orange,
                    )),
                padding: EdgeInsets.all(15),
                child: Text(
                  'Rp ${transactions[index].amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                ],
              ),
            ],
          ),
        ),
        itemCount: transactions.length,
      ),
    );
  }
}
