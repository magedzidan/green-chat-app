import 'package:flutter/material.dart';
import 'package:green_chat/core/constants/strings.dart';
import 'package:green_chat/core/models/user_model.dart';
import 'package:green_chat/ui/screens/SplashScreen.dart';
import 'package:green_chat/ui/screens/auth/Login/login_screen.dart';
import 'package:green_chat/ui/screens/auth/signup/sign_up_screen.dart';
import 'package:green_chat/ui/screens/bottom_navigation/chat_list/chat_room/chat_screen.dart';
import 'package:green_chat/ui/screens/home/homescreen.dart';
import 'package:green_chat/ui/screens/wrapper/wrapper.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case spalsh:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case signup:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case wrapper:
        return MaterialPageRoute(builder: (context) => Wrapper());
      case chatRoom:
        return MaterialPageRoute(builder: (context) => ChatScreen(reciver: args as UserModel,));

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(child: Text('There is no route')),
                ));
    }
  }
}
