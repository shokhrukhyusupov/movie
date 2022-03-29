import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_event.dart';
import 'package:movie/bloc/auth_bloc/auth_state.dart';
import 'package:movie/styles/images.dart';
import 'package:sizer/sizer.dart';

class AddRegisterButtons extends StatelessWidget {
  const AddRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  context.read<AuthBloc>().add(AuthGoogleLoginEvent()),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.white,
                shadowColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.white24, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.google, height: 30),
                  SizedBox(width: 2.w),
                  Text(
                    'Google',
                    style: Theme.of(context).textTheme.headline2,
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.6),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthFacebookLoginEvent());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.white,
                shadowColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.white24, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.facebook,
                    height: 30,
                    color: const Color(0xFF3b5998),
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    'Facebook',
                    style: Theme.of(context).textTheme.headline2,
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor.clamp(0.6, 0.6),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
