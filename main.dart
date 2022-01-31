// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app_aharbokti/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: FirebaseOptions(
      apiKey: "AIzaSyA_1JjGcCBq59tS9okmAZt9TqngwBaqzTM", // Your apiKey
      appId: "1:179196148215:android:5a592b99eae031a5a196f2", // Your appId
      messagingSenderId: "179196148215-2e6ren6lti9q9coo15fp4h36251rvqcu.apps.googleusercontent.com", // Your messagingSenderId
      projectId: "macfirstproject-395f7", // Your projectId
      androidClientId: "179196148215-q78gjqiud4q8lj76n39ljfkk4olp33b5.apps.googleusercontent.com",
    ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCTI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );
  }
}
