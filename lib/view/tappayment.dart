// import 'package:flutter/material.dart';
// import 'package:flutter_tap_payment/flutter_tap_payment.dart';

// class Tappayment extends StatefulWidget {
//   const Tappayment({super.key, required this.title});
//   final String title;

//   @override
//   State<Tappayment> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<Tappayment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: TextButton(
//               onPressed: () => {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => TapPayment(
//                             apiKey: "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
//                             redirectUrl: "http://your_website.com/redirect_url",
//                             postUrl: "http://your_website.com/post_url",
//                             paymentData: const {
//                               "amount": 10,
//                               "currency": "OMR",
//                               "threeDSecure": true,
//                               "save_card": false,
//                               "description": "Test Description",
//                               "statement_descriptor": "Sample",
//                               "metadata": {"udf1": "test 1", "udf2": "test 2"},
//                               "reference": {
//                                 "transaction": "txn_0001",
//                                 "order": "ord_0001"
//                               },
//                               "receipt": {"email": false, "sms": true},
//                               "customer": {
//                                 "first_name": "test",
//                                 "middle_name": "test",
//                                 "last_name": "test",
//                                 "email": "test@test.com",
//                                 "phone": {
//                                   "country_code": "965",
//                                   "number": "50000000"
//                                 }
//                               },
//                               // "merchant": {"id": ""},
//                               "source": {"id": "src_card"},
//                               // "destinations": {
//                               //   "destination": [
//                               //     {"id": "480593777", "amount": 2, "currency": "KWD"},
//                               //     {"id": "486374777", "amount": 3, "currency": "KWD"}
//                               //   ]
//                               // }
//                             },
//                             onSuccess: (Map params) async {
//                               print("onSuccess: $params");
//                             },
//                             onError: (error) {
//                               print("onError: $error");
//                             }),
//                       ),
//                     )
//                   },
//               child: const Text("Make Payment")),
//         ));
//   }
// }
