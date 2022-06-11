import 'package:belajar_flutter/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Define Variable

  final _formUserKey = GlobalKey<FormState>();

  bool _isMarried = false;
  String? _genderData;

  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _emailField = TextEditingController();

  final Map<String, bool> _checklistData = {
    "PHP": false,
    "ReactJS": false,
    "Go": false,
  };

  final List _skills = [];

  Map<String, dynamic> formData = {
    "name": null,
    "email": null,
    "isMarried": null,
    "gender": null,
    "skills": null
  };

  // Define Small Widget
  Widget inputName() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 5),
      child: TextFormField(
        controller: _nameField,
        decoration: InputDecoration(
          hintText: "Steve Rogers",
          labelText: "Nama Lengkap",
          icon: const Icon(Icons.people),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Nama Tidak Boleh Kosong !';
          }
          return null;
        },
      ),
    );
  }

  Widget inputEmail() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: _emailField,
        decoration: InputDecoration(
          hintText: "email@domain.com",
          labelText: "e-Mail",
          icon: const Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email Tidak Boleh Kosong !';
          }
          return null;
        },
      ),
    );
  }

  Widget inputIsMarried() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${_isMarried ? "Menikah" : "Belum Menikah"}'),
          Switch(
            value: _isMarried, 
            onChanged: (value) {
              setState(() {
                _isMarried = value;
              });
            }
          )
        ],
      )
    );
  }

   Widget inputGender() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Text('Jenis Kelamin'),
          ListTile(
            title: const Text('Laki-Laki'),
            leading: Radio(
                value: "Laki-Laki",
                groupValue: _genderData,
                onChanged: (value) {
                  setState(() {
                    _genderData = value.toString();
                  });
                }),
          ),
          ListTile(
            title: const Text('Perempuan'),
            leading: Radio(
              value: "Perempuan",
              groupValue: _genderData,
              onChanged: (value) {
                setState(() {
                  _genderData = value.toString();
                });
              }),
          ),
        ],
      ),
    );
  }

  Widget inputSkills() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Text('SKILLS'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PHP'),
              Checkbox(
                value: _checklistData['PHP'], 
                onChanged: (value) {
                  if (value == true && !_skills.contains('PHP')) {
                    _skills.add('PHP');
                  } else if (value == false && _skills.contains('PHP')) {
                    _skills.remove('PHP');
                  }

                  setState(() {
                    _checklistData['PHP'] = value!;
                  });

                }
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('ReactJS'),
              Checkbox(
                value: _checklistData['ReactJS'],
                onChanged: (value) {
                  if (value == true && !_skills.contains('ReactJS')) {
                    _skills.add('ReactJS');
                  } else if (value == false && _skills.contains('ReactJS')) {
                    _skills.remove('ReactJS');
                  }

                  setState(() {
                    _checklistData['ReactJS'] = value!;
                  });

                })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Go'),
              Checkbox(
                value: _checklistData["Go"],
                onChanged: (value) {
                  if (value == true && !_skills.contains('Go')) {
                    _skills.add('Go');
                  } else if (value == false && _skills.contains('Go')) {
                    _skills.remove('Go');
                  }

                  setState(() {
                    _checklistData['Go'] = value!;
                  });

                })
            ],
          ),
        ],
      ),
    );
  }

  Widget btnSubmit() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

     return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        child: const Text('Submit'),
        onPressed: () {
          if (_formUserKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );

            formData['name'] = _nameField.text;
            formData['email'] = _emailField.text;
            formData['isMarried'] = _isMarried;
            formData['gender'] = _genderData;
            formData['skills'] = _skills;

            authProvider.simulateLogin(formData);

            Navigator.pushNamed(
              context,
              '/home'
            );
                       
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Validation Fail !')),
              );
          }
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:  SingleChildScrollView(
            child: Form(
              key: _formUserKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  inputName(),
                  inputEmail(),
                  inputIsMarried(),
                  inputGender(),
                  inputSkills(),
                  btnSubmit()
                ],
              ),
            ),
          )
        ),
      )
    );
  }

  
}