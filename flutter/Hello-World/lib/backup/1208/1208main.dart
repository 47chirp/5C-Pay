import 'package:flutter/material.dart';
import '1208login.dart';
import '1208payment_page.dart';
import '1208history.dart';
import '1208friends.dart'; // Importing the FriendsPage

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5C-Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String userId;
  final String password;

  const MyHomePage({Key? key, required this.userId, required this.password})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SimulatedRFIDReader _reader = SimulatedRFIDReader();
  String _message = "";
  String _details = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    List<String> details =
        _reader.getStudentDetails(widget.userId, widget.password);
    if (details.first == "Unknown tag ID or incorrect password") {
      _message = "Invalid ID or Password. Please try again.";
      _details = "";
    } else {
      _message = "Hello,";
      _details = "${details[1]}\n\n" // Name
          "Flex: \$${details[2]}\n" // Flex Dollars
          "Claremont Cash: \$${details[3]}\n" // Claremont Cash
          "Meal Swipes: ${details[4]}\n" // Meal Swipes
          "Campus: ${details[5]}\n" // Campus
          "Green Box Status: ${details[6]}"; // Green Box Status
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5C-Pay Main Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_message,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(_details, style: const TextStyle(fontSize: 18)),
            Spacer(),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentPage()),
                      );
                    },
                    child: const Text('Add Claremont Cash'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryPage()),
                      );
                    },
                    child: const Text('View Payment History'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FriendsPage()),
                      );
                    },
                    child: const Text('Manage Friends'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                  ),
                ]
                    .map((widget) => Padding(
                        padding: const EdgeInsets.all(8.0), child: widget))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimulatedRFIDReader {
  final Map<String, Map<String, String>> tagData = {
    "001": {
      "name": "Mitchell",
      "flex": "80",
      "claremont_cash": "50",
      "swipes": "10",
      "campus": "Pomona",
      "green_box": "Available",
      "password": "soup"
    },
    "002": {
      "name": "Prof Dobbs",
      "flex": "80",
      "claremont_cash": "50",
      "swipes": "5",
      "campus": "Harvey Mudd",
      "green_box": "Checked Out",
      "password": "salad"
    },
    "003": {
      "name": "Cecilia Sagehen",
      "flex": "80",
      "claremont_cash": "50",
      "swipes": "10",
      "campus": "Pomona",
      "green_box": "Available",
      "password": "cup"
    },
    "004": {
      "name": "Yukie Grace Chang",
      "flex": "200",
      "claremont_cash": "50",
      "swipes": "0",
      "campus": "Pomona",
      "green_box": "Available",
      "password": "noodles"
    },
    "005": {
      "name": "Mikey Dickerson",
      "flex": "5",
      "claremont_cash": "50",
      "swipes": "0",
      "campus": "Pomona",
      "green_box": "Available",
      "password": "pizza"
    }
  };

  List<String> getStudentDetails(String userId, String password) {
    var user = tagData[userId];
    if (user != null && user["password"] == password) {
      return [userId] + user.values.toList();
    }
    return ["Unknown tag ID or incorrect password"];
  }
}
