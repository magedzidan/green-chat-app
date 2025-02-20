import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/services/database_service.dart';
import 'package:green_chat/core/utils/route_utils.dart';
import 'package:green_chat/firebase_options.dart';
import 'package:green_chat/ui/screens/other/user_provider.dart';
import 'package:green_chat/ui/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // 👈 Add this line before anything else
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //forr responsitve dimenstion resiszing u need to make it varibale

      builder: (context, child) => ChangeNotifierProvider(
        create: (context)=>UserProvider(DatabaseSerice()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteUtils.onGenerateRoute,
            home: SplashScreen()),
      ),
    );
  }
}
