import 'package:flutter/material.dart';
import 'login.dart';
import 'payment_page.dart';
import 'history.dart';
import 'friends.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  int _selectedIndex = 0; // For tracking the index of the bottom navigation bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateToSelectedPage(index);
  }

  void _navigateToSelectedPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const PaymentPage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HistoryPage()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FriendsPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SimulatedRFIDReader reader = SimulatedRFIDReader();
    List<String> userDetails =
        reader.getStudentDetails(widget.userId, widget.password);

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
            Text(
                userDetails.isNotEmpty
                    ? "Hello, ${userDetails[1]}"
                    : "Hello, User",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (userDetails.isNotEmpty) ...[
              Text("Flex: \$${userDetails[2]}",
                  style: const TextStyle(fontSize: 18)),
              Text("Claremont Cash: \$${userDetails[3]}",
                  style: const TextStyle(fontSize: 18)),
              Text("Meal Swipes: ${userDetails[4]}",
                  style: const TextStyle(fontSize: 18)),
              Text("Campus: ${userDetails[5]}",
                  style: const TextStyle(fontSize: 18)),
              Text("Green Box Status: ${userDetails[6]}",
                  style: const TextStyle(fontSize: 18)),
            ],
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Add Cash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Friends',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
