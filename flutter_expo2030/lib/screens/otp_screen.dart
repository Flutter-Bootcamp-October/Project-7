import 'package:flutter/material.dart';
import 'package:flutter_expo2030/screens/nav_bar.dart';
import 'package:flutter_expo2030/screens/widgets/custom_button.dart';
import 'package:flutter_expo2030/screens/widgets/textfeilds.dart';


import 'package:supabase_flutter/supabase_flutter.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("lib/assets/images/10.jpeg"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: otpController,
                hint: "OTP",
                icon: Icons.verified_outlined,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () async {
                  final supabase = Supabase.instance.client;
                  final otp = await supabase.auth.verifyOTP(
                    token: otpController.text,
                    type: OtpType.signup,
                    email: widget.email,
                  );
                  print('Email for OTP verification: ${widget.email}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppNavigationBar(),
                    ),
                  );
                },
                text: "Confirm",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
