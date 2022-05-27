import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/property_list_screen.dart';

class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({Key? key, required this.mobileno}) : super(key: key);

  final String mobileno;

  @override
  State<ConfirmOtp> createState() => _ConfirmOtpState();
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  final _formKey = GlobalKey<FormState>();

  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.sms_outlined,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'We have sent you a 5 digit OTP Code via SMS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
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
                    keyboardType: TextInputType.text,
                    onSaved: (onSaveValue) => otpCode = onSaveValue!,
                    onChanged: (onChangeValue) => otpCode = onChangeValue,
                    obscureText: true,
                    validator: (validatorValue) {
                      if (validatorValue == null || validatorValue.isEmpty) {
                        return 'Please enter the OTP Code';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your OTP Code',
                      labelText: 'OTP Code',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _verifyOTPCode();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .7, 40),
                    ),
                    child: const Text(
                      'Verify',
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

  Future<bool> _verifyOTPCode() async {
    if (_formKey.currentState!.validate()) {
      final number = widget.mobileno;
      // final number = '0741308360';

      final loginEndpoint =
          "http://192.168.1.84:8180/confirmotp?&otpsentback=$otpCode&phonenumber=$number";
      try {
        var response = await http.post(Uri.parse(loginEndpoint));
        _showSnackBar(response.statusCode.toString());
      } catch (e) {
        _showSnackBar(e.toString());
      }

      _showSnackBar('Validated Successfully');

      _navigate(const PropertyScreen());

      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not Validated Successfully')));
      return true;
    }
  }

  _navigate(route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }

  _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
        ),
      ),
    );
  }
}
