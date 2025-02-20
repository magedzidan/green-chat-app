import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/constants/strings.dart';
import 'package:green_chat/ui/screens/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationViewModel(),
      child: Consumer<BottomNavigationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel
                .screens[viewModel.currentindex ?? 0], // ✅ Correct usage
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  currentIndex: viewModel.currentindex ?? 1, // ✅ Correct
                  onTap: viewModel.setCurrentScreen, // ✅ Correct
                  items: [
                    BottomNavigationBarItem(
                      label: "",
                      icon: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Image.asset(
                          homeIcon,
                          height: 33,
                          width: 35,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: null,
                      label: "",
                      icon: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Image.asset(
                          chatsIcon,
                          height: 33,
                          width: 35,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Image.asset(
                          profileIcon,
                          height: 33,
                          width: 35,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
