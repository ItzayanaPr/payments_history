import 'package:payments_history/models/purchase.dart';

final historyInformation = [
  Purchase(title: 'Recarga Saldo', status: 1, toData: '5521907768', dateTime: '10 Mayo 2022, 12:20pm', amount: 150),
  Purchase(title: 'Pago recibo telmex', status: 0, toData: '55111111', dateTime: '10 Junio 2022, 02:20pm', amount: 1550.55),
  Purchase(title: 'Pago membresía VIP', status: 1, toData: '5521907768', dateTime: '22 Agosto 2022, 12:20am', amount: 49.99),
  Purchase(title: 'Recarga Saldo', status: 1, toData: '5521907768', dateTime: '31 Mayo 2022, 12:20pm', amount: 120.00),
];

class HistoryBloc {
  Stream <List<Purchase>> get getPurchaseHistory async* {
    final List<Purchase> purchases = [];

    for(Purchase purchase in historyInformation) {
      //await Future.delayed(const Duration(seconds: 3 ));
      purchases.add(purchase);
      yield purchases;
    }
  }
}