import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_event.dart';
import 'package:movie/bloc/auth_bloc/auth_state.dart';
import 'package:movie/styles/colors.dart';
import 'package:sizer/sizer.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (contex, state) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: TextFormField(
          onChanged: (text) =>
              context.read<AuthBloc>().add(AuthPasswordChangeEvent(text)),
          validator: (value) => state.validatePassword
              ? null
              : 'the password must consist of at least 8 characters',
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          obscureText: state.isObscure,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white24)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.amber)),
            labelStyle: const TextStyle(color: Colors.white),
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () => context
                  .read<AuthBloc>()
                  .add(AuthPasswordIsObscureEvent(!state.isObscure)),
              icon: state.isObscure
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
              color: AppColors.amber,
            ),
          ),
        ),
      );
    });
  }
}
