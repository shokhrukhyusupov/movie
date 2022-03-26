import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_event.dart';
import 'package:movie/bloc/auth_bloc/auth_state.dart';
import 'package:movie/pages/main_page.dart';
import 'package:sizer/sizer.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state.buttonStatus
                ? () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthRegisterSubmitEvent());
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false,
                      );
                    }
                  }
                : null,
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline3,
              textScaleFactor:
                  MediaQuery.of(context).textScaleFactor.clamp(1, 1),
            ),
          ),
        ),
      );
    });
  }
}
