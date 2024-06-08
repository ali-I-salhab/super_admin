// import 'package:flutter/material.dart';
// import 'dart:developer';

// import 'package:flutter_paypal/flutter_paypal.dart';


// class CheckoutPage extends StatefulWidget {
//   const CheckoutPage({super.key});

//   @override
//   State<CheckoutPage> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "PayPal Checkout",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: () async {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (BuildContext context) => PaypalCheckout(
//                 sandboxMode: true,
//                 clientId:
//                     "AS_halXDVP-5LWBMg8e3YD1O7F_fZD2eKyPnSt7Hv-pYe5IhxzoVCm_sUaPvDZK_Qg2SpVy7GW6lVAkx",
//                 secretKey:
//                     "EHH-z9JJ6f4BjSmDKFAtnghXjXokWi92IvK0PF4PUYJs8tTohcHSJEzpuvPsLBIZWTdhgFpCW9oTQ3aC",
//                 returnURL: "success.snippetcoder.com",
//                 cancelURL: "cancel.snippetcoder.com",
//                 transactions: const [
//                   {
//                     "amount": {
//                       "total": '70',
//                       "currency": "USD",
//                       "details": {
//                         "subtotal": '70',
//                         "shipping": '0',
//                         "shipping_discount": 0
//                       }
//                     },
//                     "description": "The payment transaction description.",
//                     // "payment_options": {
//                     //   "allowed_payment_method":
//                     //       "INSTANT_FUNDING_SOURCE"
//                     // },
//                     "item_list": {
//                       "items": [
//                         {
//                           "name": "Apple",
//                           "quantity": 4,
//                           "price": '5',
//                           "currency": "USD"
//                         },
//                         {
//                           "name": "Pineapple",
//                           "quantity": 5,
//                           "price": '10',
//                           "currency": "USD"
//                         }
//                       ],

//                       // shipping address is not required though
//                       //   "shipping_address": {
//                       //     "recipient_name": "Raman Singh",
//                       //     "line1": "Delhi",
//                       //     "line2": "",
//                       //     "city": "Delhi",
//                       //     "country_code": "IN",
//                       //     "postal_code": "11001",
//                       //     "phone": "+00000000",
//                       //     "state": "Texas"
//                       //  },
//                     }
//                   }
//                 ],
//                 note: "Contact us for any questions on your order.",
//                 onSuccess: (Map params) async {
//                   print("onSuccess: $params");
//                 },
//                 onError: (error) {
//                   print("onError: $error");
//                   Navigator.pop(context);
//                 },
//                 onCancel: () {
//                   print('cancelled:');
//                 },
//               ),
//             ));
//           },
//           style: TextButton.styleFrom(
//             backgroundColor: Colors.teal,
//             foregroundColor: Colors.white,
//             shape: const BeveledRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(1),
//               ),
//             ),
//           ),
//           child: const Text('Checkout'),
//         ),
//       ),
//     );
//   }
// }
// // //  import 'package:flutter/material.dart';
// // // import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
// // // import 'package:get/get.dart';
// // // import 'package:socialmedia/controller/homepagecontroller.dart';

// // // class Paying extends StatefulWidget {
// // //   const Paying({super.key});

// // //   @override
// // //   State<Paying> createState() => _CheckoutPageState();
// // // }

// // // class _CheckoutPageState extends State<Paying> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     homepagecontroller controller = Get.find();
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           "PayPal Checkout",
// // //           style: TextStyle(fontSize: 20),
// // //         ),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           children: [
// // //             Text(controller.sectionSelecteddropdownitem.toString()),
// // //             Text(controller.servicesSelecteddropdownitem.toString()),
// // //             Text(controller.amount!.text.toString()),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 // Get.to(PaypalCheckout);
// // //                 Navigator.of(context).push(MaterialPageRoute(
// // //                   builder: (BuildContext context) => PaypalCheckout(
// // //                     sandboxMode: true,
// // //                     clientId:
// // //                         "AVlS2zBJayNaoH_4II6v6szaORaIjUDS-hETxPNUQqVCfFFdlT8d2RzZR34ioZpL5YEilskNFeti-hPk",
// // //                     secretKey:
// // //                         "EPdnA7FVNdTZDi9pbg4AM4H3pRrQhmns5Y-XNAXGEGm6Sc7GwYZ5TKiz9kVgoXb3nrsv04Rd7sR2IJv-",
// // //                     returnURL: "success.snippetcoder.com",
// // //                     cancelURL: "cancel.snippetcoder.com",
// // //                     transactions: [],
// // //                     note: "Contact us for any questions on your order.",
// // //                     onSuccess: (Map params) async {
// // //                       print("suceesss");
// // //                       // controller.payorder();
// // //                     },
// // //                     onError: (error) {
// // //                       print("onError: $error");
// // //                       Navigator.pop(context);
// // //                     },
// // //                     onCancel: () {
// // //                       print('cancelled:');
// // //                     },
// // //                   ),
// // //                 ));
// // //               },
// // //               style: TextButton.styleFrom(
// // //                 backgroundColor: Colors.teal,
// // //                 foregroundColor: Colors.white,
// // //                 shape: const BeveledRectangleBorder(
// // //                   borderRadius: BorderRadius.all(
// // //                     Radius.circular(1),
// // //                   ),
// // //                 ),
// // //               ),
// // //               child: const Text('Checkout'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_paypal/flutter_paypal.dart';

// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// // //   final String title;

// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           title: Text(widget.title),
// // //         ),
// // //         body: Center(
// // //           child: TextButton(
// // //               onPressed: () => {
// // //                     Navigator.of(context).push(
// // //                       MaterialPageRoute(
// // //                         builder: (BuildContext context) => UsePaypal(
// // //                             sandboxMode: true,
// // //                             clientId:
// // //                                 "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
// // //                             secretKey:
// // //                                 "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
// // //                             returnURL: "https://samplesite.com/return",
// // //                             cancelURL: "https://samplesite.com/cancel",
// // //                             transactions: const [
// // //                               {
// // //                                 "amount": {
// // //                                   "total": '10.12',
// // //                                   "currency": "USD",
// // //                                   "details": {
// // //                                     "subtotal": '10.12',
// // //                                     "shipping": '0',
// // //                                     "shipping_discount": 0
// // //                                   }
// // //                                 },
// // //                                 "description":
// // //                                     "The payment transaction description.",
// // //                                 // "payment_options": {
// // //                                 //   "allowed_payment_method":
// // //                                 //       "INSTANT_FUNDING_SOURCE"
// // //                                 // },
// // //                                 "item_list": {
// // //                                   "items": [
// // //                                     {
// // //                                       "name": "A demo product",
// // //                                       "quantity": 1,
// // //                                       "price": '10.12',
// // //                                       "currency": "USD"
// // //                                     }
// // //                                   ],

// // //                                   // shipping address is not required though
// // //                                   "shipping_address": {
// // //                                     "recipient_name": "Jane Foster",
// // //                                     "line1": "Travis County",
// // //                                     "line2": "",
// // //                                     "city": "Austin",
// // //                                     "country_code": "US",
// // //                                     "postal_code": "73301",
// // //                                     "phone": "+00000000",
// // //                                     "state": "Texas"
// // //                                   },
// // //                                 }
// // //                               }
// // //                             ],
// // //                             note: "Contact us for any questions on your order.",
// // //                             onSuccess: (Map params) async {
// // //                               print("onSuccess: $params");
// // //                             },
// // //                             onError: (error) {
// // //                               print("onError: $error");
// // //                             },
// // //                             onCancel: (params) {
// // //                               print('cancelled: $params');
// // //                             }),
// // //                       ),
// // //                     )
// // //                   },
// // //               child: const Text("Make Payment")),
// // //         ));
// // //   }
// // // }
