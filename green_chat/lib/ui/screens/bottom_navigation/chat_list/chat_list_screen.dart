import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/constants/strings.dart';
import 'package:green_chat/core/constants/styles.dart';
import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/models/user_model.dart';
import 'package:green_chat/core/services/database_service.dart';
import 'package:green_chat/ui/screens/bottom_navigation/chat_list/chat_list_view_model.dart';
import 'package:green_chat/ui/screens/other/user_provider.dart';
import 'package:green_chat/ui/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).currentUser;
    return ChangeNotifierProvider(
      create: (context) => ChatListViewModel(DatabaseSerice(), currentUser!),
      child: Consumer<ChatListViewModel>(builder: (context, model, _) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              Text(
                'Chats',
                style: h.copyWith(fontSize: 25, color: Color(0xFF393A44)),
              ),
              10.verticalSpace,
              CustomFormField(
                enable_suffix_icon: true,
                hintText: 'Search here...',
                onChanged: model.searchUser
              ),
              10.verticalSpace,
              model.state == ViewState.loading
                  ? Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                          itemCount: model.filteredUseres.length,
                          separatorBuilder: (context, index) => 8.verticalSpace,
                          itemBuilder: (context, index) {
                            final user = model.filteredUseres[index];
                            return ChatTile(
                              user: user,
                              onTap: () =>
                                  Navigator.pushNamed(context, chatRoom),
                            );
                          }),
                    )
            ],
          ),
        );
      }),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    this.onTap,
    required this.user,
  });

  final void Function()? onTap;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      tileColor: Color(0xffF6F6F6),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 25,
        child: Text(user.name![0]),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.name!,
              style: TextStyle(
                  color: Color(0xff393A44),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          2.verticalSpace,
          Text(
            'Have you spoken to the ffffddd dddf',
            maxLines: 1,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                '15 minutes ago',
                style: TextStyle(
                    color: Color.fromARGB(255, 90, 90, 95), fontSize: 10),
              ),
              5.verticalSpace,
            ],
          ),
          6.verticalSpace,
          CircleAvatar(
            backgroundColor: Colors.black87.withOpacity(0.8),
            radius: 8.r,
            child: Text(
              '1',
              style: TextStyle(color: Colors.white, fontSize: 9),
            ),
          )
        ],
      ),
    );
  }
}
