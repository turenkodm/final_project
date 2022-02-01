import 'package:final_project/pages/auth_page.dart';
import 'package:final_project/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/auth_page': (context) => const AuthPage(),
        '/main_page': (context) => const MainPage(),
      },
      initialRoute: '/auth_page',
      theme: ThemeData(
        primarySwatch: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: const Color.fromRGBO(145, 41, 53, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          floatingLabelStyle:
              const TextStyle(color: Color.fromRGBO(145, 41, 53, 1)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(145, 41, 53, 1),
            ),
          ),
        ),
      ),
      home: const AuthPage(),
    );
  }
}
