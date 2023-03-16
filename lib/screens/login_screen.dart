import 'package:flutter/material.dart';
import 'package:vaarta/widgets/custom_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vaarta/resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Start or Join Meeting',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 38.0),
          child: Image.asset('assets/images/onboarding.jpg'))
          ,CustomButton(text: 'Login',onPressed: () async{
            bool res = await _authMethods.signInWithGoogle(context);
            if(res){
              Navigator.pushNamed(context, '/home');
    }
            }
    ,)
        ]

      ),
    );
  }
}
