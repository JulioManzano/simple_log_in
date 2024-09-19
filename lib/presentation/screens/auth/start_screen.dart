import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_sign_in/core/utils/const.dart';
import 'package:simple_sign_in/presentation/bloc/progress/auth/auth_bloc.dart';
import 'package:simple_sign_in/presentation/bloc/service_locator.dart';
import 'package:simple_sign_in/presentation/screens/auth/login_screen.dart';
import 'package:simple_sign_in/presentation/screens/home/home_screen.dart';
import 'package:simple_sign_in/presentation/widget/component/loading.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (getIt<AuthBloc>().currentUser != null) {
        context.go(HomeScreen.route);
      } else {
        context.go(LoginScreen.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Loading(),
    );
  }
}
