import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, wrapper);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            frame,
            width: 1.sw,
            height: 1.sh,
            fit: BoxFit.contain,
          ),
          Image.asset(
            frame, width: 1.sw, height: 1.sh, fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7), // Adjust opacity here
            colorBlendMode: BlendMode.dstATop,
          ),
          Center(
              child: Image.asset(
            logo,
            height: 170,
            width: 180,
            fit: BoxFit.cover,
          )),
        ],
      ),
    );
  }
}
