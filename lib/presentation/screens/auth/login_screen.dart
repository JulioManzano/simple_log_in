import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_sign_in/core/constants/icon_assets.dart';
import 'package:simple_sign_in/data/service/auth_service.dart';
import 'package:simple_sign_in/presentation/bloc/service_locator.dart';
import 'package:simple_sign_in/presentation/screens/home/widget/body_login.dart';

import '../../bloc/progress/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(kImgWallpaper).image,
              fit: BoxFit.cover,
            ),
          ),
          child: const BodyLogin(),
        ),
      ),
    );
  }
}
