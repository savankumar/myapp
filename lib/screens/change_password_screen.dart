import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/profile_provider.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _currentPasswordController,
              labelText: 'Current Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _newPasswordController,
              labelText: 'New Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _confirmPasswordController,
              labelText: 'Confirm New Password',
              obscureText: true,
            ),
            const SizedBox(height: 32),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                return CustomButton(
                  text: 'Change Password',
                  onPressed: profileProvider.isLoading
                      ? null
                      : () async {
                          if (_newPasswordController.text != _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('New passwords do not match'),
                              ),
                            );
                            return;
                          }

                          bool success = await profileProvider.changePassword(
                            _currentPasswordController.text,
                            _newPasswordController.text,
                          );

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password changed successfully'),
                              ),
                            );
                            context.pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to change password'),
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
