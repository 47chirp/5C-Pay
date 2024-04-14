// login.dart
import 'package:flutter/material.dart';
import '1208main.dart'; // Ensure this points to your main.dart containing MyHomePage

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Key for form validation
  String _errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to 5C-Pay"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'Enter your ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Enter your Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(context);
                  }
                },
                child: const Text('Login'),
              ),
              Text(_errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    final String userId = _idController.text.trim();
    final String password = _passwordController.text.trim();
    var userDetails = SimulatedRFIDReader().getStudentDetails(userId, password);
    if (userDetails.first != "Unknown tag ID or incorrect password") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                MyHomePage(userId: userId, password: password)),
      );
    } else {
      setState(() {
        _errorText = "Invalid ID or Password"; // Set error text to display
      });
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
