import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stud_portal/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // brightness: Brightness.dark,
      ),
      home: Login(),
    );
  }
}
