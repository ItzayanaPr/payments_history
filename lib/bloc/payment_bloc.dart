import 'dart:async';

import 'package:payments_history/models/payment_information.dart';

final successPurchaseMock = PaymentInformation(
    statusText: '¡Compra exitosa!',
    dateTime: '22 de sep del 2022, 09:20am',
    type: 'Recarga de Saldo',
    toData: '5521907768',
    folio: '12345678',
    amount: 150
);

class PaymentBloc {
  Stream<PaymentInformation> get getPaymentInformation async* {
    final PaymentInformation payment =  successPurchaseMock;
    // await Future.delayed(const Duration(seconds: 2));
    yield payment;
  }

  final StreamController<bool> _isLoadingVisible = StreamController<bool>();
  Stream<bool> get isLoadingVisible => _isLoadingVisible.stream;

  dispose() {
    _isLoadingVisible.close();
  }

  PaymentBloc() {
    getPaymentInformation.listen((payment) {
      _isLoadingVisible.add(true);
    });
  }
}


