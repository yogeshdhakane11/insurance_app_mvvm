import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NivaBupaPaymentGatewayScreen extends StatelessWidget {
  const NivaBupaPaymentGatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(child: Text('Payment Gateway')),
    );
  }
}
