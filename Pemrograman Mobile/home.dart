import 'package:belajar_flutter/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome !'),
            Text(
              '${authProvider.user.name.toString()}', 
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold  
              )
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/profile'
                );
              }, 
              child: const Text('See My Profile'),
            )
          ],
        ),
      ),
    );
  }
}