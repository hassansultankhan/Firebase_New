import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'mainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase Practice",
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 82, 65, 2),
          backgroundColor: Colors.amberAccent),
      home: mainScreen(),
    );
  }
}
