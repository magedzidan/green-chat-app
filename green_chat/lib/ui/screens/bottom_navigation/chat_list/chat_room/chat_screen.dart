import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/constants/colors.dart';
import 'package:green_chat/core/constants/styles.dart';
import 'package:green_chat/ui/widgets/text_form_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          40.verticalSpace,
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
              child: Column(
                children: [
                  _buildHeader(context,name: "Ava Adams"),
                  15.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return chatBubble();
                        },
                        separatorBuilder: (context, index) => 10.verticalSpace,
                        itemCount: 5),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 235, 233, 233),
            padding:
                EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 25.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add)),
                ),
                10.horizontalSpace,
                Expanded(
                    child: CustomFormField(
                  isWhite: true,
                  hintText: "Write message...",
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext Context,{String name = ""}) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(Context),
          child: Container(
            padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey.withOpacity(0.15)),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        20.horizontalSpace,
        Text(
          name,
          style: h.copyWith(fontSize: 22.sp, fontWeight: FontWeight.w900),
        ),
        Spacer(),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.withOpacity(0.15)),
          child: Center(
              child: Icon(
            Icons.more_vert_outlined,
            size: 22,
            color: Colors.black,
          )),
        ),
      ],
    );
  }
}

class chatBubble extends StatelessWidget {
  const chatBubble({
    super.key,
    this.isCurrentUser = true,
  });

  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    final aligment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    final borderRadius = isCurrentUser
        ? BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r))
        : BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r));
    return Align(
      alignment: aligment,
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(maxWidth: 1.sw * 0.75, minWidth: 50.w),
        decoration: BoxDecoration(
            color: isCurrentUser ? primary : Colors.grey.withOpacity(0.2),
            borderRadius: borderRadius),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(
              'data dddldlddlllllllllllllllllll rrrr r llll dkkkkkkkkkkkkkkdd ddd dd dd kkkk',
              style: body.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black),
            ),
            5.verticalSpace,
            Text('08:00 PM',
                style: isCurrentUser
                    ? small.copyWith(color: Colors.white.withOpacity(0.8))
                    : small.copyWith(
                        color: Colors.black.withOpacity(0.8),
                      ))
          ],
        ),
      ),
    );
  }
}
