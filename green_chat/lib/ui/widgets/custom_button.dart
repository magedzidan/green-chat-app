import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.Text_inside,
    required this.loading,
  });
  final void Function()? onPressed;
  final String Text_inside;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width of the screen
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF232323), // Black background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Oval shape
          ),
          padding: EdgeInsets.symmetric(vertical: 15), // Adjust height
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                Text_inside,
                style: TextStyle(
                  color: Colors.white, // White text color
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
