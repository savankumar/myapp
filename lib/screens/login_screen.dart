import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HRMS Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _usernameController,
              labelText: 'Username',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return CustomButton(
                  text: 'Login',
                  onPressed: authProvider.isLoading
                      ? null
                      : () async {
                          bool success = await authProvider.login(
                            _usernameController.text,
                            _passwordController.text,
                          );
                          if (success) {
                            context.go('/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid credentials'),
                              ),
                            );
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
