import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/constants/strings.dart';
import 'package:green_chat/core/constants/styles.dart';
import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/extenstions/widget_extrntion.dart';
import 'package:green_chat/core/services/auth_service.dart';
import 'package:green_chat/ui/screens/auth/Login/login_screen_viewmodel.dart';
import 'package:green_chat/ui/widgets/custom_button.dart';
import 'package:green_chat/ui/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginScreenViewmodel(AuthService()),
      child: Consumer<LoginScreenViewmodel>(builder: (context, model, _) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  50.verticalSpace,
                  Text(
                    "Login",
                    style: h,
                  ),
                  Text('Please Log In To Your Account!'),
                  30.verticalSpace,
                  CustomFormField(
                    onChanged: model.setEmail,
                    hintText: "Enter Email",
                  ),
                  25.verticalSpace,
                  CustomFormField(
                    onChanged: model.setPassword,
                    hintText: "Enter Password",
                  ),
                  25.verticalSpace,
                  CustomButton(
                    loading: model.state==ViewState.loading,
                    onPressed:model.state==ViewState.loading?null: () async {
                      try {
                        await model.Login();
                        context.showSnackBar("sign in succful");
                        //Navigator.pushNamed(context, home);
                      } on FirebaseAuthException catch (e) {
                        context.showSnackBar(e.toString());
                      } catch (e) {
                        context.showSnackBar(e.toString());
                      }
                    },
                    Text_inside: "Login",
                  ),
                  20.verticalSpace,
                  Text(
                    'Dont have an account',
                    style: body.copyWith(color: Color(0xFF808080)),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, signup);
                      },
                      child: Text(
                        'Sign Up',
                        style: body.copyWith(
                            color: Color(
                              0xFF232323,
                            ),
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
