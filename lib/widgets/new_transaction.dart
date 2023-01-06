import 'package:flutter/material.dart';
import 'package:expense_tracker_project/widgets/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) => titleInput = value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) => amountInput = value),
            ),
            FlatButton(
              onPressed: () => addTransaction(
                  titleController.text, num.parse(amountController.text)),
              child: Text('Add Transaction'),
              textColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
