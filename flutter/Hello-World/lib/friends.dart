import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<String> friends = [];
  String newFriend = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Enter Friend\'s Name'),
            onChanged: (value) {
              setState(() {
                newFriend = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (newFriend.trim().isNotEmpty) {
                  friends.add(newFriend);
                  newFriend = '';
                }
              });
            },
            child: const Text('Add Friend'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Friends List',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(friends[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        friends.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
