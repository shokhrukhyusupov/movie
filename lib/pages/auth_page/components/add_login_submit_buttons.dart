import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_event.dart';
import 'package:movie/bloc/auth_bloc/auth_state.dart';
import 'package:movie/pages/main_page.dart';
import 'package:movie/styles/images.dart';

class AddLoginSubmitButton extends StatelessWidget {
  const AddLoginSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            OutlinedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthGoogleLoginEvent());
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                    (route) => false);
              },
              child: Image.asset(
                Images.google,
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
            const SizedBox(width: 20),
            OutlinedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthFacebookLoginEvent());
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                    (route) => false);
              },
              child: Image.asset(
                Images.facebook,
                width: MediaQuery.of(context).size.width * 0.1,
                color: const Color(0xFF3b5998),
              ),
            ),
          ],
        ),
      );
    });
  }
}
