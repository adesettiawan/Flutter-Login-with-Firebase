import 'package:flutter/material.dart';
import 'package:login/auth/auth_services.dart';
import 'package:login/home_page.dart';
import 'package:login/login/login_page.dart';
import 'package:login/sign_up/sign_up_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => SignUpPage(),
        },
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
