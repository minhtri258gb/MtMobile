import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background/3.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const FlutterLogo(),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                "Flutter Mobile App",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "USERNAME",
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                TextField(
                  obscureText: _isHidePassword,
                  decoration: const InputDecoration(
                    labelText: "PASSWORD",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isHidePassword = !_isHidePassword;
                    });
                  },
                  icon: Icon(_isHidePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password!",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "GUEST",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
