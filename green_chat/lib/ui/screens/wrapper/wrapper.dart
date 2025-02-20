import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_chat/ui/screens/auth/Login/login_screen.dart';
import 'package:green_chat/ui/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:green_chat/ui/screens/other/user_provider.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        if (user == null) {
          return LoginScreen();
        } else {
          // print('useruidddddddddddddd==${user.uid}');
          userProvider.loadUser(user.uid);
          // return HomeScreen();
          return BottomNavigationScreen();
        }
      },
    );
  }
}
