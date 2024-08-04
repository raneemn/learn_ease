import 'package:flutter/material.dart';
import 'package:learn_ease/model/userInfo.dart';
import 'package:learn_ease/view/forgetPassView.dart';
import 'package:learn_ease/view/resetPassView.dart';
import 'package:learn_ease/view/signUpView.dart';

class EmailVerificationWidget extends StatefulWidget {
  const EmailVerificationWidget({super.key});
  static const routeName = 'Email Verification Widget';

  @override
  State<EmailVerificationWidget> createState() =>
      _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> {
  TextEditingController digit1 = TextEditingController();
  TextEditingController digit2 = TextEditingController();
  TextEditingController digit3 = TextEditingController();
  TextEditingController digit4 = TextEditingController();
  bool invalidOTP = false;
  var args;

  @override
  Widget build(BuildContext context) {
    
 args = ModalRoute.of(context)!.settings.arguments as userInfo;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(top: 70, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Email Verification',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15),
              child: const Text(
                'Get Your Code',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15),
              child: const Text(
                'Please Enter your 4 digit code that is sent on your given email address.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTPinputBox(context, digit1),
                  OTPinputBox(context, digit2),
                  OTPinputBox(context, digit3),
                  OTPinputBox(context, digit4),
                ],
              ),
            ),
            Center(
              child: Text(
                invalidOTP ? 'Invalid OTP !' : '',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 15,
              ),
              child: Row(
                children: [
                  const Text(
                    'You Don\'t receive Code? ',
                    style: TextStyle(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        invalidOTP = false;
                      });
                      // maybe i need package here
                    },
                    child: const Text(
                      'Resend',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 330,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      final OTP =
                          digit1.text + digit2.text + digit3.text + digit4.text;
                      if (OTP == '1234') {
                        setState(() {
                          invalidOTP = false;
                        });
                        Navigator.pushNamed(context, ResetPassWidget.routeName,
                            arguments: args);
                      } else {
                        setState(() {
                          invalidOTP = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(104, 73, 239, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Text(
                      'VERIFY AND PROCEED',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget OTPinputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(217, 217, 217, 1)),
    child: TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      style: TextStyle(fontSize: 35),
      decoration: InputDecoration(
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
