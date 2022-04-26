// ignore_for_file: prefer_const_constructors

import 'package:intl/intl.dart';

import 'components.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if ((recentTransactions[i].date.day == weekDay.day) &&
            (recentTransactions[i].date.month == weekDay.month) &&
            (recentTransactions[i].date.year == weekDay.year)) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay).substring(0, 1));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: groupedTransactionsValues.map((data) {
          //
          // stop until here ...
          //
          return Text(
            '${data['day']} : ${data['amount'].toString()}',
          );
        }).toList(),
      ),
    );
  }
}
