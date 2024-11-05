import 'package:flutter/material.dart';

import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hapus tombol back
        title: const Text(""),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/images/login logo.png',
                    height: 300.0,
                    width: 300.0,
                  ),
                  const Text(
                    "Silahkan login menggunakan akun mu!",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignForm(),
                  const SizedBox(height: 16),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
