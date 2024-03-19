import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen(this.onChange, {super.key});

  final void Function() onChange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Login Page'),
          ElevatedButton(
            onPressed: onChange,
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
