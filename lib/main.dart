import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie/pages/auth_page/auth_page.dart';
import 'package:movie/repositories/movie_repository.dart';
import 'package:movie/repositories/user_repository.dart';
import 'package:movie/styles/theme.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override//asdasd
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => AuthBloc(UserRepository())),
          RepositoryProvider(create: (_) => MovieBloc(MovieRepository())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie',
          theme: AppTheme.darkTheme,
          home: AuthPage(),
        ),
      );
    });
  }
}
