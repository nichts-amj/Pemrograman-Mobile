import 'package:belajar_flutter/providers/auth.dart';
import 'package:belajar_flutter/screens/home.dart';
import 'package:belajar_flutter/screens/login.dart';
import 'package:belajar_flutter/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Login(),
          '/home':(context) => const Home(),
          '/profile': (context) => const Profile()
        },
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}