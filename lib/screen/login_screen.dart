// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:firstflutter/main.dart';
import 'package:firstflutter/screen/homeScreen/home_screen.dart';
import 'package:firstflutter/screen/register_screen.dart';
import 'package:firstflutter/theme/color.dart';
import 'package:firstflutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  static const routerName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

  AutovalidateMode autoValidateForEmail = AutovalidateMode.onUserInteraction;
  AutovalidateMode autoValidateForPassword = AutovalidateMode.onUserInteraction;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emaillController = TextEditingController();

  bool _isLoading = false;
  Future<void> handleLogin() async {
    try {
      final form = _formKey.currentState;
      if (form!.validate() != true) {
        setState(() {
          autoValidateForEmail = AutovalidateMode.always;
        });
        return;
      }

      setState(() {
        _isLoading = true;
      });

      if (mounted) {
        await Future.delayed(const Duration(seconds: 4));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      logger.e('Exception: ${e.runtimeType}, Message: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  isValidPass(String password) {
    if (password.isEmpty) {
      return "Password is not valid";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emaillController.dispose();
    super.dispose();
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
          child: FormBuilder(
            enabled: !_isLoading,
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
                child: TextFieldTapRegion(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: FormBuilderTextField(
                    key: _emailFieldKey,
                    autovalidateMode: autoValidateForEmail,
                    name: 'email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emaillController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      contentPadding: EdgeInsets.all(12),
                    ),
                    onSubmitted: (_) => handleLogin(),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "Please enter your email address."),
                        FormBuilderValidators.email(
                            errorText: "Email is invalid. Please try again!"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFieldTapRegion(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: FormBuilderTextField(
                    key: _passwordFieldKey,
                    autovalidateMode: autoValidateForPassword,
                    name: 'passwd',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      contentPadding: EdgeInsets.all(12),
                    ),
                    onSubmitted: (_) => handleLogin(),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: "Please enter your password."),
                        FormBuilderValidators.minLength(6,
                            errorText: "Password not valid.")
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: ThemeColor.white,
                      backgroundColor: ThemeColor.primary),
                  onPressed: _isLoading ? null : handleLogin,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          "Login",
                        ),
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
