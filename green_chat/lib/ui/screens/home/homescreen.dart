import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/services/auth_service.dart';
import 'package:green_chat/core/services/database_service.dart';
import 'package:green_chat/ui/screens/home/homeviewmodel.dart';
import 'package:green_chat/ui/screens/other/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) => HomeViewModel(DatabaseSerice()),
      child: Consumer<HomeViewModel>(builder: (context, model, _) {
        return Scaffold(
          body: userProvider.currentUser == null
              ? Center(child: CircularProgressIndicator())
              : InkWell(
                  onTap: () async {
                    try {
                      await AuthService().signOut();
                    } catch (e) {
                      print("Error signing out: $e");
                    }
                  },
                  child: Center(
                      child: Text(
                          userProvider.currentUser.toString() ?? "No user found"))),
        );
      }),
    );
  }
}
