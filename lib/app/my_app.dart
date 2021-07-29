// import 'package:agenda_crud/app/view/my_home_page.dart';
// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Aula Flutter'),
//     );
//   }
// }


import 'package:quentinha_crud/app/view/quentinha_details.dart';
import 'package:quentinha_crud/app/view/quentinha_form.dart';
import 'package:quentinha_crud/app/view/quentinha_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const QUENTINHA_FORM =  'quentinha-form';
  static const QUENTINHA_DETAILS = 'quentinha-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      HOME : (context) => QuentinhaList(),
      QUENTINHA_FORM : (context) => QuentinhaForm(),
      QUENTINHA_DETAILS : (context) => QuentinhaDetails()
      },
    );
  }
}