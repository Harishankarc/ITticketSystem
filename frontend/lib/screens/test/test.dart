// import 'package:flutter/material.dart';
// import 'package:another_telephony/telephony.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final telephony = Telephony.instance;
//   TextEditingController mobilenum = TextEditingController();
//   TextEditingController message = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             Container(
//               padding: EdgeInsets.only(left: 20, right: 10),
//               child: TextField(
//                 controller: mobilenum,
//                 decoration: InputDecoration(hintText: 'mobile number'),
//                 keyboardType: TextInputType.number,
//                 maxLength: 10,
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 20, right: 10),
//                 child: TextField(
//                   controller: message,
//                   expands: true,
//                   maxLines: null,
//                   decoration: InputDecoration(hintText: 'content'),
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () async {
//                 telephony.sendSms(to: mobilenum.text, message: message.text);
//               },
//               child: Text('send', style: TextStyle(fontSize: 20)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
