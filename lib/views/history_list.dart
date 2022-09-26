import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payments_history/bloc/history_bloc.dart';
import 'package:payments_history/models/purchase.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final historyBloc = HistoryBloc();

  String _toNationalFormat(double number) {
    var format = NumberFormat("#,##0.00", "en_US");
    return format.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: const Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<List<Purchase>>(
            stream: historyBloc.getPurchaseHistory,
            builder: (context, snapshot) {
              final purchases = snapshot.data ?? [];
              return ListView.builder(
                itemCount: purchases.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                purchases[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    purchases[index].status == 1 ? 'Exitosa' : 'Fallida',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: purchases[index].status == 1 ? Colors.green : Colors.red
                                    ),
                                  ),
                                  Builder(builder: (context) {
                                    if(purchases[index].status  == 1) {
                                      return const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                        size: 24,
                                      );
                                    } else {
                                      return const Icon(
                                        Icons.highlight_off,
                                        color: Colors.red,
                                        size: 24,
                                      );
                                    }
                                  }),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                purchases[index].toData,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16
                                )
                              ),
                              Text(
                                '\$${_toNationalFormat(purchases[index].amount)}',
                                style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                purchases[index].dateTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                )),
                            ],
                          ),
                        ),
                        const Divider(height: 2,thickness: 2,)
                      ],
                    ),
                  );
                }
              );
            }
          ),
        ),
      ),
    );
  }
}
