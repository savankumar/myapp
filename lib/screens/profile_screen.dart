import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/providers/profile_provider.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF64B5F6), Color(0xFF1976D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final ImagePicker picker = ImagePicker();
                            final XFile? image =
                                await picker.pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              profileProvider.updateProfilePicture(File(image.path));
                            }
                          },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: profileProvider.profileImage != null
                                ? FileImage(profileProvider.profileImage!)
                                : null,
                            child: profileProvider.profileImage == null
                                ? const Icon(Icons.person, size: 60)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          profileProvider.user?.username ?? 'N/A',
                          style: GoogleFonts.lato(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Joined: 2024-01-01', // Placeholder
                          style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 32),
                        CustomButton(
                          text: 'Change Password',
                          onPressed: () => context.go('/profile/change-password'),
                        ),
                        const SizedBox(height: 16),
                        TextButton.icon(
                          onPressed: () {
                            Provider.of<AuthProvider>(context, listen: false).logout();
                            context.go('/');
                          },
                          icon: const Icon(Icons.logout, color: Colors.red),
                          label: Text(
                            'Logout',
                            style: GoogleFonts.lato(color: Colors.red, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
