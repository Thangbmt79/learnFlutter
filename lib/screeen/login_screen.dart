import 'package:firstflutter/main.dart';
import 'package:firstflutter/screeen/register_screen.dart';
import 'package:firstflutter/theme/color.dart';
import 'package:firstflutter/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routerName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  void handleLogin() {
    String password = _passwordController.text;
    logger.i('Password Entered: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          const Text(
            "Welcome to LoginPage!",
            style: TextStyle(fontSize: 14),
          ),
          Image.asset(
            'assets/images/LogoUKPC.png',
            width: 100,
            height: 50,
          ),
          Text("iTicket lite",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppTheme.themeData.primaryColor,
              )),
          const Text(
            "Welcome to iTicket Lite \nPlease enter your e-mail below:",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintStyle: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                labelText: 'Password',
                hintStyle: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              child: Text(
                "Login",
              ),
              style: ElevatedButton.styleFrom(
                  primary: ThemeColor.primary, onPrimary: ThemeColor.white),
              onPressed: () {
                handleLogin();
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // dùng để center text
            children: [
              const Text(
                "You don't have an account? ",
                style: TextStyle(fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
