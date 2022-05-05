import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifiedEmailView extends StatefulWidget {
  const VerifiedEmailView({Key? key}) : super(key: key);

  @override
  State<VerifiedEmailView> createState() => _VerifiedEmailViewState();
}

class _VerifiedEmailViewState extends State<VerifiedEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify User')),
      body: Column(
        children: [
          const Text("We've sent a verification email, please verify"),
          const Text("If you haven't received an email click the button below"),
          TextButton(
              onPressed: () async {
                AuthService.firebase().sendEmailVerification();
               
              },
              child: const Text('Send email verification')),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logout() ;
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text('restart'))
        ],
      ),
    );
  }
}
