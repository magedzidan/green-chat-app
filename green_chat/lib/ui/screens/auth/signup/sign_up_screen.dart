import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_chat/core/constants/strings.dart';
import 'package:green_chat/core/constants/styles.dart';
import 'package:green_chat/core/enums/enums.dart';
import 'package:green_chat/core/extenstions/widget_extrntion.dart';
import 'package:green_chat/core/services/auth_service.dart';
import 'package:green_chat/core/services/database_service.dart';
import 'package:green_chat/ui/screens/auth/signup/sign_up_viewmodel.dart';
import 'package:green_chat/ui/widgets/custom_button.dart';
import 'package:green_chat/ui/widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewmodel>(
      create: (BuildContext context) => SignUpViewmodel(AuthService(),DatabaseSerice()),
      child: Consumer<SignUpViewmodel>(builder: (context, modle, _) {
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                45.verticalSpace,
                Text(
                  "Create Your Account",
                  style: h,
                ),
                Text('Please Provide The Details!'),
                20.verticalSpace,
                CustomFormField(
                  onChanged: modle.setName,
                  hintText: "Enter Name",
                ),
                25.verticalSpace,
                CustomFormField(
                  onChanged: modle.setEmail,
                  hintText: "Enter Email",
                ),
                25.verticalSpace,
                CustomFormField(
                  onChanged: modle.setPassword,
                  hintText: "Enter Password",
                ),
                25.verticalSpace,
                CustomFormField(
                  onChanged: modle.setConfirmedPassword,
                  hintText: "Confirm Password",
                ),
                20.verticalSpace,
                CustomButton(
                  loading: modle.state==ViewState.loading,
                  onPressed:modle.state==ViewState.loading?null:  () async {
                    try {
                      await modle.signUp();
                      context.showSnackBar("sign up succful");
                      Navigator.pop(context); //3shan el msh hynf3 nrg3 3la el login 3la tol 3hsan 2hna sh8len on wrapper screen
                    } on FirebaseAuthException catch (e) {
                      context.showSnackBar(e.toString());
                    } catch (e) {
                      context.showSnackBar(e.toString());
                    }
                  },
                  Text_inside: "Register",
                ),
            0.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account? ',
                      style: body.copyWith(color: Color(0xFF808080)),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, login);
                        },
                        child: Text(
                          'Login',
                          style: body.copyWith(
                              color: Color(
                                0xFF232323,
                              ),
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
