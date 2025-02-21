import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/services/auth_service.dart';
import 'package:green_chat/ui/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.05),
        child: Column(
          children: [
            50.verticalSpace,
            CustomButton(
                onPressed: () {
                  AuthService().signOut();
                },
                Text_inside: 'Log out',
                loading: false)
          ],
        ),
      ),
    );
  }
}
