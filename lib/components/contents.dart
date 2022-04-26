// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'components.dart';

class Contents extends StatelessWidget {
  final List<Transaction> userTransactions;
  final List<Transaction> recentTransactions;
  const Contents({
    Key? key,
    required this.userTransactions,
    required this.recentTransactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Card(
            child: Chart(
              recentTransactions: recentTransactions,
            ),
            color: Colors.blue,
            elevation: 5,
          ),
        ),
        TransactionList(
          transactions: userTransactions,
        ),
      ],
    );
  }
}
