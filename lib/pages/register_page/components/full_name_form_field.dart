import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_event.dart';
import 'package:movie/bloc/auth_bloc/auth_state.dart';
import 'package:movie/styles/colors.dart';

class FullNameFormField extends StatelessWidget {
  const FullNameFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return TextFormField(
        onChanged: (text) =>
            context.read<AuthBloc>().add(AuthLoginChangeEvent(text)),
        validator: (value) =>
            state.validateEmail ? null : 'email entered incorrectly',
        style: const TextStyle(color: Colors.white),
        keyboardType:
            state.isEmail ? TextInputType.emailAddress : TextInputType.phone,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.amber)),
          labelStyle: const TextStyle(color: Colors.white),
          labelText: state.isEmail ? 'E-mail' : 'Phone number',
          suffixIcon: IconButton(
            onPressed: () => context
                .read<AuthBloc>()
                .add(AuthLoginChangeTypeEvent(!state.isEmail)),
            icon: state.isEmail
                ? const Icon(Icons.email_outlined)
                : const Icon(Icons.phone),
            color: AppColors.amber,
          ),
        ),
      );
    });
  }
}
