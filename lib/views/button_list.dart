import 'package:flutter/material.dart';
import 'package:payments_history/common/loading_screen.dart';

class ButtonList extends StatefulWidget {
  const ButtonList({super.key});

  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {

  void sendInformationPayment() {
    Navigator.of(context).pushNamed('/confirmation');
  }

  void showHistory() {
    Navigator.of(context).pushNamed('/history');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: const ConfirmationPayment(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  sendInformationPayment();
                },
                child: const Text(
                  'Pagar recarga',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF43A047)),
                ),
                onPressed: () {
                  showHistory();
                },
                child: const Text(
                  'Ver historial',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
      ),
      );
  }
}
