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
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          final item = entries[index];
          return Card(
            color: index % 2 == 0 ? Colors.blue[50] : Colors.white,
            child: ListTile(
              title: Text(
                '${item['type']}: ${item['amount']} - ${item['method']} on ${item['date']}',
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                if (item['details'].isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Details for ${item['method']}'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: item['details']
                                .map<Widget>((detail) => Text(
                                    '${detail['item']}: ${detail['quantity']} x ${detail['cost']}'))
                                .toList(),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Transaction Details'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Type: ${item['type']}'),
                              Text('Amount: ${item['amount']}'),
                              Text('Method: ${item['method']}'),
                              Text('Date: ${item['date']}'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
