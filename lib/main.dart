import 'package:flutter/material.dart';

import 'screens/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: LoginPage(),
    );
  }
}

// class _RootState extends State<Root> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth(auth: _auth).user,
//       builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           if (snapshot.data?.uid == null) {
//             return Login(
//               auth: _auth,
//               firestore: _firestore,
//             );
//           } else {
//             return Home(
//               auth: _auth,
//               firestore: _firestore,
//             );
//           }
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: Text("Loading..."),
//             ),
//           );
//         }
//       }, //Auth stream
//     );
//   }
// }
