import 'package:firstflutter/main.dart';
import 'package:firstflutter/theme/color.dart';
import 'package:firstflutter/theme/theme.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routerName = "/register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum Gender { male, female }

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _passwordController = TextEditingController();
  void handleLogin() {
    String password = _passwordController.text;
    logger.i('Password Entered: $password');
  }

  // bool isMale = false;
  // bool isFemale = false;

  Gender? selectedGender;

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày bắt đầu mặc định khi mở picker
      firstDate: DateTime(1900), // Ngày đầu tiên có thể chọn
      lastDate:
          DateTime.now(), // Ngày cuối cùng có thể chọn (ở đây là ngày hiện tại)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Sign up Screen',
              style: TextStyle(fontSize: 16),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(children: [
                Text("iTicket lite",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.themeData.primaryColor,
                    )),
                Row(
                  children: [
                    Expanded(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(fontSize: 15),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Re - password',
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Your phone number',
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                // child: Column(
                //   children: [
                //     CheckboxListTile(
                //       title: const Text('Male'),
                //       dense: true,
                //       contentPadding: EdgeInsets.zero,
                //       controlAffinity: ListTileControlAffinity.leading,
                //       value: isMale,
                //       onChanged: (newValue) {
                //         setState(() {
                //           isMale = newValue!;
                //           if (newValue == true) {
                //             isFemale = false;
                //           }
                //         });
                //       },
                //     ),
                //     CheckboxListTile(
                //       title: const Text('Female'),
                //       dense: true,
                //       contentPadding: EdgeInsets.zero,
                //       controlAffinity: ListTileControlAffinity.leading,
                //       value: isFemale,
                //       onChanged: (newValue) {
                //         setState(() {
                //           isFemale = newValue!;
                //           if (newValue == true) {
                //             isMale = false;
                //           }
                //         });
                //       },
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: RadioListTile<Gender>(
                        title: const Text(
                          'Male',
                          style: TextStyle(fontSize: 14),
                        ),
                        dense: true,
                        value: Gender.male,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RadioListTile<Gender>(
                        title: const Text(
                          'Females',
                          style: TextStyle(fontSize: 14),
                        ),
                        dense: true,
                        value: Gender.female,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          selectedDate != null
                              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                              : 'Your birth date',
                        ),
                        onTap: () {
                          _selectDate(
                              context); // Gọi hàm để chọn ngày tháng năm
                        },
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Sign up"),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                handleLogin();
              },
            ),
          ),
        ),
      ],
    );
  }
}
