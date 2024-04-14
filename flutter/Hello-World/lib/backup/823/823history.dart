import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Expanded dummy data for the history of payments with detailed item breakdowns
    final List<Map<String, dynamic>> entries = [
      {
        'type': 'Deposit',
        'amount': '\$50.00',
        'method': 'Claremont Cash',
        'date': '2023-04-12',
        'details': []
      },
      {
        'type': 'Charge',
        'amount': '\$20.00',
        'method': 'Bookstore',
        'date': '2023-04-13',
        'details': [
          {'item': 'Eraser', 'quantity': 1, 'cost': '\$1.00'},
          {
            'item': 'The Fault in Our Stars',
            'quantity': 3,
            'cost': '\$6.00 each'
          }
        ]
      },
      {
        'type': 'Deposit',
        'amount': '\$75.00',
        'method': 'Claremont Cash',
        'date': '2023-04-15',
        'details': []
      },
      {
        'type': 'Charge',
        'amount': '\$15.00',
        'method': 'Dining Hall',
        'date': '2023-04-16',
        'details': [
          {'item': 'Lunch Buffet', 'quantity': 1, 'cost': '\$15.00'}
        ]
      },
      {
        'type': 'Deposit',
        'amount': '\$100.00',
        'method': 'Claremont Cash',
        'date': '2023-04-20',
        'details': []
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type: ${entry['type']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Amount: ${entry['amount']}'),
                  Text('Method: ${entry['method']}'),
                  Text('Date: ${entry['date']}'),
                  const SizedBox(height: 8),
                  if (entry['details'].isNotEmpty) ...[
                    const Text('Details:'),
                    for (var detail in entry['details'])
                      Text(
                          '- ${detail['item']} (${detail['quantity']}): ${detail['cost']}'),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
