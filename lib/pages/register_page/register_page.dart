import 'package:flutter/material.dart';
import 'package:movie/pages/register_page/components/add_register_buttons.dart';
import 'package:movie/pages/register_page/components/login_form_field.dart';
import 'package:movie/pages/register_page/components/password_form_field.dart';
import 'package:movie/pages/register_page/components/submit_button.dart';
import 'package:movie/styles/images.dart';
import 'package:sizer/sizer.dart';
import 'components/confirm_password_form_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(Images.logo, height: 80, width: 120),
                    ),
                    Text(
                      'sign up to discover all our movies and enjoy our features',
                      style: Theme.of(context).textTheme.headline4,
                      textScaleFactor: MediaQuery.of(context)
                          .textScaleFactor
                          .clamp(1.1, 1.1),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    const LoginFormField(),
                    const PasswordFormField(),
                    const ConfirmPasswordFormField(),
                    SizedBox(height: 2.h),
                    SubmitButton(formKey: _formKey),
                    Text(
                      'or simply sign up with',
                      style: Theme.of(context).textTheme.headline4,
                      textScaleFactor:
                          MediaQuery.of(context).textScaleFactor.clamp(1, 1),
                    ),
                    SizedBox(height: 3.h),
                    const AddRegisterButtons(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                            style: Theme.of(context).textTheme.headline4),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Sign In',
                              style: Theme.of(context).textTheme.headline1),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
