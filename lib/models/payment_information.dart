class PaymentInformation {
  String statusText;
  String dateTime;
  String type;
  String toData;
  String folio;
  double amount;

  PaymentInformation({
    required this.statusText,
    required this.dateTime,
    required this.type,
    required this.toData,
    required this.folio,
    required this.amount
  });
}