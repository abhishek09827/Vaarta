import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vaarta/resources/auth_methods.dart';
import 'package:vaarta/screens/login_screen.dart';
import 'package:vaarta/screens/video_call_screen.dart';
import 'utils/colors.dart';
import 'package:vaarta/screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaarta',
      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login' :(context) => const LoginScreen(),
        '/home' :(context) => const HomeScreen(),
        '/video' :(context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshots){
          if(snapshots.connectionState == ConnectionState.waiting){
            return Center(
            child: CircularProgressIndicator(),
            );
    };
    if(snapshots.hasData){
      return const HomeScreen();

    }
    else{
      return const LoginScreen();
    }
    },


      ),
    );
  }
}
