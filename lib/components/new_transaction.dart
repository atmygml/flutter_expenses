// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'components.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction({
    Key? key,
    required this.addNewTx,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    /* if (titleController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        ((num.tryParse(amountController.text)) != null) &&
        (amountController.text != "NaN") &&
        (amountController.text != "-NaN") &&
        (num.tryParse(amountController.text)! > 0)) {
      widget.addNewTx(
        txTitle: titleController.text,
        txAmount: double.parse(amountController.text),
      );
    }
    Navigator.of(context).pop(); */

    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        ((num.tryParse(amountController.text)) == null) ||
        (amountController.text == "NaN") ||
        (amountController.text == "-NaN") ||
        (num.tryParse(amountController.text)! <= 0)) {
      return;
    }

    widget.addNewTx(
      txTitle: titleController.text,
      txAmount: double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'title',
              ),
            ),
            TextField(
              controller: amountController,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'amount',
              ),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 25.0,
                bottom: 15.0,
                left: 15.0,
                right: 15.0,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.only(
                    top: 15.0,
                    bottom: 18.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                ),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onPressed: submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
