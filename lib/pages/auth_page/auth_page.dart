import 'package:flutter/material.dart';
import 'package:movie/pages/auth_page/components/add_login_submit_buttons.dart';
import 'package:movie/pages/auth_page/components/password_form_field.dart';
import 'package:movie/pages/auth_page/components/submit_button.dart';
import 'package:movie/styles/colors.dart';
import 'package:movie/styles/images.dart';
import 'package:sizer/sizer.dart';
import '../register_page/register_page.dart';
import 'components/login_form_field.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(color: AppColors.dBackground),
          Image.asset(
            Images.authbg,
            alignment: Alignment.topCenter,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.dBackground,
                  AppColors.dBackground,
                  AppColors.dBackground,
                  AppColors.dBackground,
                  AppColors.dBackground.withOpacity(0.8),
                  AppColors.dBackground.withOpacity(0.1),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Hero(
                tag: 'logo',
                child: Image.asset(Images.logo, height: 7.h),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contetx) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'REGISTER',
                    style: Theme.of(context).textTheme.headline1,
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor.clamp(1, 1),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline2,
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor.clamp(1, 1),
                      ),
                      SizedBox(height: 1.h),
                      const LoginFormField(),
                      const PasswordFormField(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.shrink(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'or continue with',
                        style: Theme.of(context).textTheme.headline4,
                        textScaleFactor:
                            MediaQuery.of(context).textScaleFactor.clamp(1, 1),
                      ),
                      const AddLoginSubmitButton(),
                      SubmitButton(formKey: _formKey),
                      SizedBox(height: 2.h)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
