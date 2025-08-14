import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sg_grocery/screens/profile/components/profile_header.dart';
import 'package:sg_grocery/screens/profile/components/profile_menu.dart';

import '../../components/custom_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(
        title: 'Profile',
        titleAlignment: TextAlign.start,
        leftPadding: 16,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Header Section
              const ProfileHeader(
                imageUrl:
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop&crop=face',
                name: 'George D.',
                username: '@george31',
              ),
              const SizedBox(height: 40),
              // Menu Section
              ProfileMenu(
                menuItems: [
                  ProfileMenuItem(
                    icon: Icons.wallet,
                    title: 'My Wallet',
                    onTap: () {
                      context.go('/home/profile/wallet');
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.receipt_long_outlined,
                    title: 'My orders',
                    onTap: () {
                      context.go('/home/profile/orders');
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.card_membership_outlined,
                    title: 'My Subscriptions',
                    onTap: () {
                      // Navigate to subscriptions
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'My Addresses',
                    onTap: () {
                      context.go('/home/profile/addresses');
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.quiz_outlined,
                    title: 'FAQ',
                    onTap: () {
                      // Navigate to FAQ
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.headset_mic_outlined,
                    title: 'Contact Us',
                    onTap: () {
                      // Navigate to contact
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {
                      // Navigate to about
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout_outlined,
                    title: 'Log Out',
                    isLogout: true,
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Handle logout logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
