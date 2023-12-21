import 'package:firstflutter/main.dart';
import 'package:firstflutter/screen/homeScreen/home_screen.dart';
import 'package:firstflutter/screen/register_screen.dart';
import 'package:firstflutter/theme/color.dart';
import 'package:firstflutter/theme/theme.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  static const routerName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  handleLogin() {
    String password = _passwordController.text;
    logger.i('Password Entered: $password');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  isValidEmail(String email) {
    RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    final isEmailValidate = emailRegExp.hasMatch(email ?? '');
    if (email.length <= 0) {
      return "Email is not valid";
    }
    if (!isEmailValidate) {
      return "Please enter a valid email";
    }
    return null;
  }

  isValidPass(String password) {
    if (password.length <= 0) {
      return "Password is not valid";
    }
    return null;
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
            child: Center(
          child: Form(
            key: _formKey,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  validator: (email) => isValidEmail(email!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(fontSize: 15),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  validator: (password) => isValidPass(password!),
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
                    if (_formKey.currentState!.validate()) {
                      handleLogin();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        )),
      ),
    );
  }
}
