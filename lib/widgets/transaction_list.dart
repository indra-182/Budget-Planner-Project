import 'package:expense_tracker_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) => Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all()),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Rp ${transactions[index].amount.toStringAsFixed(0)}',
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
