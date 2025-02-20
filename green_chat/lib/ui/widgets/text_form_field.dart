import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.focusNode,
    this.enable_suffix_icon, this.isWhite,
  });

  final void Function(String)? onChanged;
  final String? hintText;
  final FocusNode? focusNode;
  final bool? enable_suffix_icon;
  final bool? isWhite;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      focusNode: focusNode,

      decoration: InputDecoration(
        suffixIcon: enable_suffix_icon == true
            ? Container(
                decoration: BoxDecoration(
                  color: Color(0xFF232323), // Black background for icon
                  borderRadius: BorderRadius.circular(12.0), // Rounded shape
                ),
                padding: EdgeInsets.all(5.0), // Padding for better spacing
                child: Image.asset(
                  'assests/search_icon.png',
                  scale: 1.5,
                ),
              )
            : null,

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54), // Hint text color
        filled: true,
        fillColor: isWhite==true ? Colors.white : Colors.grey.withOpacity(0.2), // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r), // Semi-rectangle shape
          borderSide: BorderSide.none, // No border
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      style: TextStyle(color: Colors.black54), // Text color
    );
  }
}
