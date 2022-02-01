import 'package:final_project/resources/resources.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final _phoneNumber = TextEditingController();
    final _password = TextEditingController();

    void _loginButton() {
      setState(() {
        if (_phoneNumber.text != '' && _password.text != '') {
          if (_phoneNumber.text == '555' && _password.text == '555') {
            Navigator.pushReplacementNamed(context, '/main_page');
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      content:
                          const Text('Неправильный номер телефона или пароль!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ));
          }
        }
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                ApplicationImages.jaguar,
              ),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 600,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: const Color.fromRGBO(145, 41, 53, 1),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                  controller: _phoneNumber,
                  decoration: const InputDecoration(
                    prefixIconColor: Color.fromRGBO(145, 41, 53, 1),
                    prefixIcon: Icon(Icons.local_phone),
                    prefix: Text('+7 '),
                    labelText: 'Введите номер телефона',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: const Color.fromRGBO(145, 41, 53, 1),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  controller: _password,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    labelText: 'Введите пароль',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: 200,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(145, 41, 53, 1),
                    textStyle: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  onPressed: _loginButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                      Text(
                        'Войти',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
