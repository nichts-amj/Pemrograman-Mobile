import 'package:belajar_flutter/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Halaman Profile Nih !'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nama: ',
                    style:
                      TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                    '${authProvider.user.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'e-Mail: ',
                    style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    '${authProvider.user.email}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Skills: ',
                    style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    '${authProvider.user.skills.toString()}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sudah Menikah: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    '${authProvider.user.isMarried}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Gender: ',
                    style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(
                    '${authProvider.user.gender}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}