// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:khalti/khalti.dart';
// import 'package:khalti_core/khalti_core.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
//
// class KhaltiPayment extends StatefulWidget {
//   const KhaltiPayment({Key? key}) : super(key: key);
//
//   @override
//   State<KhaltiPayment> createState() => _KhaltiPaymentState();
// }
//
// class _KhaltiPaymentState extends State<KhaltiPayment> {
//   String referenceId = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Payment Methods",
//                 style: TextStyle(
//                   fontSize: 28,
//                   color: Color.fromARGB(255, 92, 15, 163),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Divider(
//                 color: Color.fromARGB(255, 92, 15, 163),
//                 height: 20,
//                 thickness: 1,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//
//               //Image for Khalti
//               InkWell(
//                 splashColor: Colors.grey,
//                 onTap: () {
//                   print("Image Tapped");
//                   khaltiWallet();
//                 }, // Image tapped
//                 child: Image.asset(
//                   'Images/khalti.png',
//                   width: 180,
//                 ),
//               ),
//
//               SizedBox(
//                 height: 40,
//               ),
//
//               //Cash on Delivery
//               InkWell(
//                 splashColor: Colors.grey,
//                 onTap: () {
//                   AlertDialog(
//                     title: const Text("Cash on Delivery"),
//                     content: const Text("Payment successful"),
//                     actions: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("OK"))
//                     ],
//                   );
//                 },
//                 child: Image.asset(
//                   'Images/ime.png',
//                   width: 100,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               InkWell(
//                 splashColor: Colors.grey,
//                 onTap: () {
//                   AlertDialog(
//                     title: const Text("Cash on Delivery"),
//                     content: const Text("Payment successful"),
//                     actions: [
//                       TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("OK"))
//                     ],
//                   );
//                 },
//                 child: Image.asset(
//                   'Images/visa.png',
//                   width: 150,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Divider(
//                 color: Color.fromARGB(255, 92, 15, 163),
//                 height: 20,
//                 thickness: 1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   khaltiWallet() {
//     KhaltiScope.of(context).pay(
//       config: PaymentConfig(
//           amount: 2000,
//           productIdentity: "1",
//           productName: "Pokhara",
//           mobile: "9866622390"),
//       preferences: [PaymentPreference.khalti],
//       onSuccess: onSuccess,
//       onFailure: onFailure,
//       onCancel: onCanceled,
//     );
//   }
//
//   // mentod to handle success
//   void onSuccess(PaymentSuccessModel success) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Success"),
//             content: Text("Payment successful"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         });
//   }
//
//   // method to handle failure
//   void onFailure(PaymentFailureModel failure) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Failure"),
//             content: Text("Payment failed"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("OK"))
//             ],
//           );
//         });
//   }
//
//   // method to handle onCanceled
//
//   void onCanceled() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Canceled"),
//             content: Text("Payment canceled"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("OK"))
//             ],
//           );
//         });
//   }
// }
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class KhaltiTest extends StatefulWidget {
  const KhaltiTest({super.key});

  @override
  State<KhaltiTest> createState() => _KhaltiTestState();
}

class _KhaltiTestState extends State<KhaltiTest> {
  String referenceId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new)
              .iconColor(Colors.black)
              .box
              .make(),
          onPressed: () {
            Navigator.pushNamed(context, "/homepage");
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Payment Methods",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 92, 15, 163),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color.fromARGB(255, 92, 15, 163),
                height: 20,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),

              //Image for Khalti
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  print("Image Tapped");
                  khaltiWallet();
                }, // Image tapped
                child: Image.asset(
                  'assets/images/khaltilogo.png',
                  width: 180,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //Cash on Delivery
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  AlertDialog(
                    title: const Text("Cash on Delivery"),
                    content: const Text("Payment successful"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
                child: Image.asset(
                  'assets/images/cod.png',
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  AlertDialog(
                    title: const Text("Cash on Delivery"),
                    content: const Text("Payment successful"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
                child: Image.asset(
                  'assets/images/visa.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                color: Color.fromARGB(255, 92, 15, 163),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  khaltiWallet() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000,
          productIdentity: "1",
          productName: "nike blazers mid 77",
          mobile: "9804704028"),
      preferences: [PaymentPreference.khalti],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCanceled,
    );
  }

  // mentod to handle success
  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Payment successful"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        });
  }

  // method to handle failure
  void onFailure(PaymentFailureModel failure) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Failure"),
            content: const Text("Payment failed"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }

  // method to handle onCanceled

  void onCanceled() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Canceled"),
            content: const Text("Payment canceled"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }
}