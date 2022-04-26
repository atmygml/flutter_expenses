// ignore_for_file: prefer_const_constructors

import 'components.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't001',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't002',
      title: 'Weekly Groceries',
      amount: 46.54,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction({
    required String txTitle,
    required double txAmount,
  }) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTx: _addNewTransaction),
        SizedBox(height: 20.0),
        TransactionList(
          transactions: _userTransactions,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
