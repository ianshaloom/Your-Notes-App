import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({super.key});

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text('Send Verifivation Email'),
            ),
          ),
        ],
      ),
    );
  }
}
