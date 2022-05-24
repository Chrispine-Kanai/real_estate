import 'package:flutter/material.dart';
import 'package:real_estate/confirm_otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late String mobileno;
  late String pin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      onSaved: (onSaveValue) => mobileno = onSaveValue!,
                      onChanged: (onChangeValue) => mobileno = onChangeValue,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your mobile number',
                        labelText: 'Mobile Number',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      onSaved: (onSaveValue) => pin = onSaveValue!,
                      onChanged: (onChangeValue) => pin = onChangeValue,
                      obscureText: true,
                      validator: (validatorValue) {
                        if (validatorValue == null || validatorValue.isEmpty) {
                          return 'Please enter your pin';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your pin',
                        labelText: 'Pin',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _login();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .7, 40),
                      ),
                      child: const Text(
                        'Login',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Validated Successfully')));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmOtp()),
      );

      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not Validated Successfully')));
      return true;
    }
  }
}
