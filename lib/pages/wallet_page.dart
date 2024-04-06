import 'dart:convert';
import 'package:delivery_app/widget/widget_support.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: AppWidget.headerTextStyle(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppWidget.lightTextStyle(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '\u{20B9}5000',
                        style: AppWidget.boldTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                "Add Money",
                style: AppWidget.boldTextStyle(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    //makePayment("500");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\u{20B9}500',
                      style: AppWidget.priceTextStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                   onTap: () {
                    //makePayment("1000");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\u{20B9}1000',
                      style: AppWidget.priceTextStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                   onTap: () {
                    //makePayment("2000");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\u{20B9}2000',
                      style: AppWidget.priceTextStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                   onTap: () {
                    //makePayment("5000");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE9E2E2),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\u{20B9}5000',
                      style: AppWidget.priceTextStyle(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFF008080),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> makePayment(String amount) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount, "INR");
  //     await Stripe.instance
  //         .initPaymentSheet(
  //             paymentSheetParameters: SetupPaymentSheetParameters(
  //                 paymentIntentClientSecret: paymentIntent!['client_secret'],
  //                 style: ThemeMode.dark,
  //                 merchantDisplayName: "Admin"))
  //         .then((value) => {});
  //   } catch (e, s) {
  //     print('exception: $e$s');
  //   }
  // }

  // displayPaymentSheet(String amount) async {
  //   try {
  //     await Stripe.instance.presentCustomerSheet().then((value) async {
  //       showDialog(
  //           context: context,
  //           builder: (_) => const AlertDialog(
  //                 content: Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.check_circle,
  //                           color: Colors.green,
  //                         ),
  //                         Text("Payment Succssful"),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ));
  //       //await usergetprofile();
  //       paymentIntent = null;
  //     }).onError(
  //       (error, stackTrace) {
  //         print("Error is : -----> $error $stackTrace");
  //       },
  //     );
  //   } on StripeException catch (e) {
  //     print('Eoor is : ------> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //               content: Text("Cancelled"),
  //             ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calcuateAmount(amount),
  //       'Currency': currency,
  //       'payment_method_type()': "Card",
  //     };

  //     var response = await http.post(
  //       Uri.parse("http://api.stripe.com/v1/payment_intents"),
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //       body: body,
  //     );
  //     print("Payment Intent Body ->>>> ${response.body.toString()}");
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     print('err charging user : ${err.toString()}');
  //   }
  // }

  // calcuateAmount(String amount) {
  //   final calculatedAmount = (int.parse(amount) + 100);

  //   return calculatedAmount.toString();
  // }
}
