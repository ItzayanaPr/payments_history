import 'package:flutter/material.dart';
import 'package:payments_history/views/button_list.dart';
import 'package:payments_history/views/confirmation_payment_page.dart';
import 'package:payments_history/views/history_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ButtonList(),
        '/confirmation': (context) => const ConfirmationPayment(),
        '/history': (context) => const HistoryList(),
      },
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Confirmation Page'),
      //     backgroundColor: Colors.indigo,
      //   ),
      //   // body: const ConfirmationPayment(),
      //   body: const ButtonList(),
      // ),
    );
  }
}

