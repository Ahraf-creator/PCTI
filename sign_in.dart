// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_app_aharbokti/auth/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email' ],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      //print("signed in " + user.displayName);

      return user;
    } catch (e) {
      print(e.toString(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/aa.jpg'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.orangeAccent[200],
              height: 400,
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 27, color: Colors.black),
                  ),
                  Text(
                    "Palongkhali Computer Training Institute",
                    style:
                        // ignore: prefer_const_literals_to_create_immutables
                        TextStyle(
                            fontSize: 30,
                            color: Colors.black87,
                            // ignore: prefer_const_literals_to_create_immutables
                            shadows: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.white,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                  Column(children: [
                    SignInButton(
                      Buttons.Apple,
                      text: "Sign in with Apple",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () {
                        _googleSignUp().then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Homescreen(),),));
                      },
                    ),
                  ]),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Terms and Pricacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
