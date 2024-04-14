import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For using Clipboard functionalities

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select your payment method:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _paymentButton(
              context,
              'Pay with PayPal',
              Colors.blue,
              () => _showPaymentDialog(context, 'PayPal'),
            ),
            const SizedBox(height: 10),
            _paymentButton(
              context,
              'Pay with Card',
              Colors.deepPurple,
              () => _showPaymentDialog(context, 'Credit/Debit Card'),
            ),
            const SizedBox(height: 10),
            _paymentButton(
              context,
              'Pay with Google Pay',
              Colors.black,
              () => _showPaymentDialog(context, 'Google Pay'),
            ),
            const SizedBox(height: 10),
            _paymentButton(
              context,
              'Pay with Apple Pay',
              Colors.black,
              () => _showPaymentDialog(context, 'Apple Pay'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color, // Branding color for payment method
        onPrimary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, String paymentMethod) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Payment Successful'),
            content: Text(
                'Your payment with $paymentMethod was processed successfully.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                      text:
                          paymentMethod)); // Optional: Copying payment method name to clipboard
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        });
  }
}
