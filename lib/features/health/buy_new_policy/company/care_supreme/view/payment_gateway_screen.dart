import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CareSupremePaymentGatewayScreen extends StatelessWidget {
  const CareSupremePaymentGatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text("Payment GateWay")),
    );
  }
}
