import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messenger/screens/splash_screen.dart';
import 'firebase_options.dart';

import '../screens/chat_screen.dart';
import '../screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Messenger',
      theme: ThemeData(
        // textTheme: TextTheme(
        //     headlineMedium: TextStyle(
        //   color: Colors.black,
        // )),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
          background: Colors.amber,
          primary: Colors.grey[900],
          error: Colors.red,
        ),
        // buttonTheme: ButtonThemeData().copyWith(
        //     colorScheme: ColorScheme.fromSwatch(
        //   backgroundColor: Colors.blueGrey,
        // )),
        primarySwatch: Colors.amber,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (userSnapshot.hasData) {
            //if we have a token
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
