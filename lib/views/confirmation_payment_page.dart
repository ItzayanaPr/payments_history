import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payments_history/bloc/payment_bloc.dart';
import 'package:payments_history/common/center_text.dart';
import 'package:payments_history/models/payment_information.dart';

import '../common/loading_screen.dart';
import '../models/text_config.dart';

class ConfirmationPayment extends StatefulWidget {
  const ConfirmationPayment({Key? key}) : super(key: key);

  @override
  _ConfirmationPaymentState createState() => _ConfirmationPaymentState();
}

class _ConfirmationPaymentState extends State<ConfirmationPayment> {
  final Widget svg = SvgPicture.asset(
    'assets/images/tick.svg',
    semanticsLabel: 'SuccessPayment',
    height: 48,
  );
  final paymentBloc = PaymentBloc();
  final stylesConfig = TextConfiguration(color: 0xFFFFFFFF, align: 'center', size: 16, isBold: true);

  bool isVisible = true;

  LoadingScreen toggleLoading() {
    print('toggle loading');
    setState(() {
      isVisible = !isVisible;
    });
    return LoadingScreen(isVisible: isVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation Page'),
        backgroundColor: Colors.indigo,
      ),
      body: Row(
        children: [
          StreamBuilder<bool>(
            stream: paymentBloc.isLoadingVisible,
            builder: (context, snapshot) {
              print(snapshot.data);
              return Text('testing');
              // return LoadingScreen(isVisible: snapshot.data);
            }
          ),
          StreamBuilder<PaymentInformation>(
            stream: paymentBloc.getPaymentInformation,
            builder: (context, snapshot) {
              return Container(
                height: 250,
                color: const Color(0xFF129FDC),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          svg,
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                            child: CenterText(configuration: stylesConfig, text: snapshot.data?.statusText ?? ''),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                        width: 20,
                        indent: 16,
                        endIndent: 16,
                        thickness: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CenterText(configuration: stylesConfig, text: snapshot.data?.dateTime ?? ''),
                          CenterText(configuration: stylesConfig, text: 'Folio: ${snapshot.data?.folio ?? ''}'),
                          Image.asset('assets/images/telcel_white.png'),
                          CenterText(configuration: stylesConfig, text: snapshot.data?.type ?? ''),
                          CenterText(configuration: stylesConfig, text: snapshot.data?.toData ?? ''),
                          CenterText(
                            configuration: stylesConfig,
                            text: '\$${snapshot.data?.amount ?? ''}'
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
