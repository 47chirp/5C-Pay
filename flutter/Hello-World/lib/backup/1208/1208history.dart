// history.dart
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for the history of payments
    final List<String> entries = <String>[
      'Deposit: \$50.00 - Claremont Cash on 2023-04-12',
      'Charge: \$20.00 - Bookstore on 2023-04-13',
      'Deposit: \$75.00 - Claremont Cash on 2023-04-15',
      'Charge: \$15.00 - Dining Hall on 2023-04-16',
      'Deposit: \$100.00 - Claremont Cash on 2023-04-20',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              margin: const EdgeInsets.all(2),
              color: index % 2 == 0 ? Colors.blue[50] : Colors.white,
              child: Center(
                child: Text(
                  '${entries[index]}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          }),
    );
  }
}
